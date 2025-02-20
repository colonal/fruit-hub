part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

final class CartInitialState extends CartState {}

final class CartItemAddedState extends CartState {}

final class CartItemRemovedState extends CartState {}
