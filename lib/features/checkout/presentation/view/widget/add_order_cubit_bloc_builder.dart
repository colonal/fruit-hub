import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/widgets/build_error_bar.dart';
import '../../manger/add_order_cubit/add_order_cubit.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  final Widget child;
  const AddOrderCubitBlocBuilder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderFailure) {
          buildErrorBar(context, state.error);
        } else if (state is AddOrderSuccess) {
          buildSuccessBar(context, 'تم إضافة الطلب بنجاح');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddOrderLoading,
          child: child,
        );
      },
    );
  }
}
