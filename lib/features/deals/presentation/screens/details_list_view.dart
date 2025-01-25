import 'package:crispy_bacon_flutter_deals_app/features/deals/presentation/bloc/deals_bloc.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/presentation/screens/deals_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class DealsListView extends StatelessWidget {
  const DealsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetIt.instance<DealsBloc>(),
        child: const DealsListScreen(),
      ),
    );
  }
}
