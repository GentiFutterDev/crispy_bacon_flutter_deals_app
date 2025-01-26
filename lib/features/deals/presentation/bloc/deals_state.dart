part of 'deals_bloc.dart';

sealed class DealsState {}

class DealsInitial extends DealsState {}

class DealsLoading extends DealsState {}

class DealsLoadingMore extends DealsState {
  final List<Deal> existingDeals;

  DealsLoadingMore({required this.existingDeals});
}

class DealsLoaded extends DealsState {
  final List<Deal> deals;
  final bool hasMore;

  DealsLoaded(this.deals, {this.hasMore = true});
}

class DealsError extends DealsState {
  final String message;

  DealsError(this.message);
}
