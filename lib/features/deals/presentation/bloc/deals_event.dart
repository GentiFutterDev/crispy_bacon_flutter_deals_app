part of 'deals_bloc.dart';

abstract class DealsEvent extends Equatable {
  const DealsEvent();

  @override
  List<Object?> get props => [];
}

class LoadDealsEvent extends DealsEvent {
  final int page;
  final int pageSize;

  const LoadDealsEvent({required this.page, required this.pageSize});

  @override
  List<Object?> get props => [page, pageSize];
}

class ToggleLikeDealEvent extends DealsEvent {
  final String dealId;

  const ToggleLikeDealEvent({required this.dealId});

  @override
  List<Object?> get props => [dealId];
}
