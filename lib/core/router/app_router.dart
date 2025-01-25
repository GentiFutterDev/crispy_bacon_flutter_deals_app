import 'package:crispy_bacon_flutter_deals_app/features/deals/presentation/screens/details_list_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const DealsListView(),
    ),
  ],
);
