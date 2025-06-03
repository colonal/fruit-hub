import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/shipping_address_entity.dart';

class AddressInputSection extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> autovalidateMode;
  const AddressInputSection(
      {required this.formKey, required this.autovalidateMode, super.key});

  @override
  State<AddressInputSection> createState() => _AddressInputSectionState();
}

class _AddressInputSectionState extends State<AddressInputSection>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    ShippingAddressEntity? address =
        context.read<OrderInputEntity>().shippingAddress;
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: widget.autovalidateMode,
        builder: (context, value, child) {
          return Form(
            key: widget.formKey,
            child: child!,
          );
        },
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: "الاسم كامل",
              keyboardType: TextInputType.text,
              onSaved: (value) {
                address.name = value!;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: "البريد الإلكتروني",
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) {
                address.email = value!;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: "العنوان",
              keyboardType: TextInputType.text,
              onSaved: (value) {
                address.address = value!;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: "المدينه",
              keyboardType: TextInputType.text,
              onSaved: (value) {
                address.city = value!;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: "رقم الطابق , رقم الشقه ..",
              keyboardType: TextInputType.text,
              onSaved: (value) {
                address.floor = value!;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: "رقم الهاتف",
              keyboardType: TextInputType.phone,
              onSaved: (value) {
                address.phone = value!;
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
