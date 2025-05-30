part of 'add_order_cubit.dart';

class AddOrderState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddOrderInitial extends AddOrderState {}

class AddOrderLoading extends AddOrderState {}

class AddOrderSuccess extends AddOrderState {}

class AddOrderFailure extends AddOrderState {
  final String error;
  AddOrderFailure({required this.error});
}
