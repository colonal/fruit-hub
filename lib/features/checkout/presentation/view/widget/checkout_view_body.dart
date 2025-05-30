import 'dart:developer';

import 'package:e_commerce_app/core/utils/app_keys.dart';
import 'package:e_commerce_app/core/widgets/build_error_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/checkout/presentation/view/widget/address_input_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/order_entity.dart';
import '../../../domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import '../../manger/add_order_cubit/add_order_cubit.dart';
import 'checkout_steps.dart';
import 'checkout_steps_page_view.dart';
import 'payment_section.dart';
import 'shipping_section.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  int currentStepIndex = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late ValueNotifier<AutovalidateMode> autovalidateMode;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    autovalidateMode = ValueNotifier(AutovalidateMode.disabled);

    pageController.addListener(() {
      setState(() {
        currentStepIndex = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    autovalidateMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CheckoutSteps(
            steps: steps,
            currentStep: currentStepIndex,
            onStepTapped: (value) {
              if (value >= currentStepIndex) return;
              pageController.animateToPage(
                value,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: pageController,
              pages: pages,
            ),
          ),
          CustomButton(
              text: getNextButtonText(currentStepIndex),
              onPressed: () {
                if (!vanadate(currentStepIndex)) return;
                // add order to database
                if (currentStepIndex == 2) {
                  // context
                  //     .read<AddOrderCubit>()
                  //     .addOrder(context.read<OrderEntity>());
                  _processPayment(context);
                }
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  List<String> get steps => [
        'الشحن',
        'العنوان',
        'الدفع',
      ];
  List<Widget> get pages => [
        const ShippingSection(),
        AddressInputSection(
          formKey: formKey,
          autovalidateMode: autovalidateMode,
        ),
        PaymentSection(
          pageController: pageController,
        ),
      ];

  String getNextButtonText(int currentStepIndex) {
    return switch (currentStepIndex) {
      2 => 'الدفع عبر باي بال',
      _ => 'التالي',
    };
  }

  bool vanadate(int index) {
    if (index == 0) {
      return _handleShippingSection();
    } else if (index == 1) {
      return _handleAddressInputSection();
    }
    return true;
  }

  bool _handleAddressInputSection() {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      return true;
    } else {
      buildErrorBar(context, 'جميع الحقول مطلوبة');
      return false;
    }
  }

  bool _handleShippingSection() {
    if (context.read<OrderEntity>().payWithCash != null) {
      return true;
    } else {
      buildErrorBar(context, 'اختر طريقة الدفع');
      autovalidateMode.value = AutovalidateMode.always;
      return false;
    }
  }

  void _processPayment(BuildContext context) {
    var order = context.read<OrderEntity>();
    PaypalPaymentEntity payPalPayment = PaypalPaymentEntity.fromEntity(order);
    log(payPalPayment.toJson().toString());
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext ctx) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: CLIENT_ID,
        secretKey: SECRET_KEY,
        transactions: [payPalPayment.toJson()],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          buildSuccessBar(ctx, 'تم الدفع بنجاح');
          Navigator.pop(ctx);
          context.read<AddOrderCubit>().addOrder(order);
        },
        onError: (error) {
          log("onError", error: error);
          Navigator.pop(ctx);
          buildErrorBar(ctx, 'حدث خطأ');
        },
        onCancel: () {
          log('cancelled:');
          buildErrorBar(ctx, 'تم الإلغاء');
        },
      ),
    ));
  }
}
