import 'package:crispy_bacon_flutter_deals_app/features/deals/presentation/screens/details_list_view.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/entities/deal_entity.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/presentation/screens/deal_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const DealsListView(),
    ),
    GoRoute(
      path: '/deal-details',
      name: 'dealDetails',
      pageBuilder: (context, state) {
        final deal = state.extra as Deal;

        return CustomTransitionPage(
          key: state.pageKey,
          child: DealDetailsScreen(deal: deal),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 800),
        );
      },
    ),
  ],
);
