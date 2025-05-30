import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/repos/orders/orders_repos.dart';
import '../../../domain/entities/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  final OrdersRepos ordersRepos;
  AddOrderCubit({required this.ordersRepos}) : super(AddOrderInitial());

  void addOrder(OrderEntity order) async {
    emit(AddOrderLoading());
    final result = await ordersRepos.addOrders(order: order);
    result.fold(
      (failure) => emit(AddOrderFailure(error: failure.message)),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
