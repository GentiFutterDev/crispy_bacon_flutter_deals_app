import 'dart:async';
import 'package:crispy_bacon_flutter_deals_app/core/utils/app_colors.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/entities/price_range.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/presentation/bloc/deals_bloc.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/presentation/widgets/deal_card_widget.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/presentation/widgets/error_with_retry_widget.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/presentation/widgets/price_filter_dialog_widget.dart';
import 'package:crispy_bacon_flutter_deals_app/features/theme/presentation/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DealsListScreen extends StatefulWidget {
  const DealsListScreen({super.key});

  @override
  State<DealsListScreen> createState() => _DealsListScreenState();
}

class _DealsListScreenState extends State<DealsListScreen> {
  late ScrollController _scrollController;
  int _currentPage = 1;
  final int _pageSize = 20;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    context.read<DealsBloc>().add(LoadDealsEvent(page: _currentPage, pageSize: _pageSize));
  }

  void _onScroll() {
    final threshold = MediaQuery.of(context).size.height * 0.2;

    if (_scrollController.position.pixels >
        _scrollController.position.maxScrollExtent - threshold) {
      // Cancel any active debounce timer
      if (_debounce?.isActive ?? false) _debounce!.cancel();

      // Set up a debounce timer
      _debounce = Timer(const Duration(milliseconds: 500), () {
        final state = context.read<DealsBloc>().state;

        if (state is DealsLoaded && state.hasMore) {
          _currentPage++;
          context.read<DealsBloc>().add(
            LoadDealsEvent(page: _currentPage, pageSize: _pageSize),
          );
        }
      });
    }
  }

  bool _isFilterActive(DealsState state) {
  if (state is DealsLoaded && state.priceRange != null) {
    final range = state.priceRange!;
    return !(range.minPrice == 0 && range.maxPrice == 30);
  }
  return false;
}

  @override
  void dispose() {
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Best Deal Games'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleThemeEvent());
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: BlocBuilder<DealsBloc, DealsState>(
        builder: (context, state) {
          final isFilterActive = _isFilterActive(state);
          
          String filterRange = '';
          if (state is DealsLoaded && state.priceRange != null) {
            final range = state.priceRange!;
            filterRange = '€${range.minPrice.toStringAsFixed(0)} - €${range.maxPrice.toStringAsFixed(0)}';
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: isFilterActive ? AppColors.grey : AppColors.yellow,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: InkWell(
                onTap: () {
                  _showPriceFilterDialog(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Filter',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    if (isFilterActive)
                      Text(
                        filterRange,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    if (!isFilterActive)
                      const Icon(Icons.sort, color: Colors.black87),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Find the best prices on digital deals.\nWe have just what you’re looking for!',
              style: TextStyle(fontSize: 16.sp, height: 1.5.h),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: BlocBuilder<DealsBloc, DealsState>(
                builder: (context, state) {
                  if (state is DealsLoading && _currentPage == 1) {
                    return const Center(child: CircularProgressIndicator(color: AppColors.yellow,));
                  } else if (state is DealsError) {
                    return ErrorWithRetry(
                      message: state.message,
                      currentPage: _currentPage,
                      pageSize: _pageSize,
                    );
                  } else if (state is DealsLoaded || state is DealsLoadingMore) {
                    final deals = state is DealsLoaded
                        ? state.filteredDeals
                        : (state as DealsLoadingMore).existingDeals;

                    final hasMore = state is DealsLoaded ? state.hasMore : true;

                    if (deals.isEmpty) {
                      return state is DealsLoadingMore
                          ? const Center(
                              child: CircularProgressIndicator(color: AppColors.yellow),
                            )
                          : const Center(
                              child: Text('No deals found.'),
                            );
                    }

                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: deals.length + (hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index >= deals.length) {
                          return const Center(child: CircularProgressIndicator(color: AppColors.yellow,));
                        }
                        final deal = deals[index];
                        return DealCard(deal: deal);
                      },
                    );
                  } else {
                    return const Center(child: Text('Something unexpected happened.'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showPriceFilterDialog(BuildContext parentContext) {
  final currentState = parentContext.read<DealsBloc>().state;

  final PriceRange priceRange = (currentState is DealsLoaded && currentState.priceRange != null)
      ? currentState.priceRange!
      : PriceRange(minPrice: 0, maxPrice: 30);

  showModalBottomSheet(
    context: parentContext,
    builder: (BuildContext context) {
      return PriceFilterDialog(
        priceRange: priceRange,
        onApply: (double minPrice, double maxPrice) {
          parentContext.read<DealsBloc>().add(
            ApplyPriceFilterEvent(
              PriceRange(minPrice: minPrice, maxPrice: maxPrice),
            ),
          );
          Navigator.pop(context);
        },
      );
    },
  );
}
