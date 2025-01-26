import 'dart:async';
import 'package:crispy_bacon_flutter_deals_app/features/deals/presentation/bloc/deals_bloc.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/presentation/widgets/deal_card_widget.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/presentation/widgets/error_with_retry_widget.dart';
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
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DealsError) {
                    return ErrorWithRetry(
                      message: state.message,
                      currentPage: _currentPage,
                      pageSize: _pageSize,
                    );
                  } else if (state is DealsLoaded || state is DealsLoadingMore) {
                    final deals = state is DealsLoaded
                        ? state.deals
                        : (state as DealsLoadingMore).existingDeals;

                    final hasMore = state is DealsLoaded
                        ? state.hasMore
                        : true; 

                    if (deals.isEmpty) {
                      return state is DealsLoadingMore
                          ? const Center(
                              child: CircularProgressIndicator(),
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
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        final deal = deals[index];
                        return DealCard(deal: deal);
                      },
                    );
                  } else {
                    return ErrorWithRetry(
                      message: 'Something unexpected happened. Please try again.',
                      currentPage: _currentPage,
                      pageSize: _pageSize,
                    );
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
