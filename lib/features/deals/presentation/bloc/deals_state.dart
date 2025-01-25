part of 'deals_bloc.dart';

sealed class DealsState {}

class DealsInitial extends DealsState {}

class DealsLoading extends DealsState {}

class DealsLoaded extends DealsState {
  final List<Deal> deals;

  DealsLoaded(this.deals);
}

class DealsError extends DealsState {
  final String message;

  DealsError(this.message);
}
