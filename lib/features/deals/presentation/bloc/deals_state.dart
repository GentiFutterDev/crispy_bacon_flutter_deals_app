part of 'deals_bloc.dart';

sealed class DealsState {}

class DealsInitial extends DealsState {}

class DealsLoading extends DealsState {}

class DealsLoadingMore extends DealsState {
  final List<Deal> existingDeals;

  DealsLoadingMore({required this.existingDeals});
}

class DealsLoaded extends DealsState {
  final List<Deal> unfilteredDeals; 
  final List<Deal> filteredDeals;   
  final bool hasMore;               
  final PriceRange? priceRange;     

  DealsLoaded({
    required this.unfilteredDeals,
    required this.filteredDeals,
    this.hasMore = true,
    this.priceRange,
  });
}

class DealsError extends DealsState {
  final String message;

  DealsError(this.message);
}