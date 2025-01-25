import 'package:crispy_bacon_flutter_deals_app/features/deals/presentation/bloc/deals_bloc.dart';
import 'package:crispy_bacon_flutter_deals_app/features/theme/presentation/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DealsListScreen extends StatefulWidget {
  const DealsListScreen({super.key});

  @override
  State<DealsListScreen> createState() => _DealsListScreenState();
}

class _DealsListScreenState extends State<DealsListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DealsBloc>().add(const LoadDealsEvent(page: 1, pageSize: 200));
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find the best prices on digital deals.\nWe have just what you’re looking for!',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<DealsBloc, DealsState>(
                builder: (context, state) {
                  if (state is DealsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DealsLoaded) {
                    if (state.deals.isEmpty) {
                      return const Center(
                        child: Text('No deals found.'),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.deals.length,
                      itemBuilder: (context, index) {
                        final deal = state.deals[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    deal.thumbnail ?? '',
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        deal.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: List.generate(5, (starIndex) {
                                          return Icon(
                                            starIndex <
                                                    (deal.rating ?? 0).ceil()
                                                ? Icons.star
                                                : Icons.star_border,
                                            color: Colors.yellow,
                                            size: 16,
                                          );
                                        }),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "\$${deal.price.toStringAsFixed(2)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: const EdgeInsets.all(4.0),
                                  child: const Icon(
                                    Icons.thumb_up,
                                    color: Colors.yellow,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is DealsError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  return const Center(child: Text('Unknown state.'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
