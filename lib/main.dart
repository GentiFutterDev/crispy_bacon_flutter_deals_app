import 'package:crispy_bacon_flutter_deals_app/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dependency_injection/configure_dependencies.dart';
import 'features/theme/presentation/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  final settingsBox = await Hive.openBox('settings');

  getIt.registerSingleton<Box>(settingsBox);

  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ThemeBloc>(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Deals App',
            theme: themeState.themeData,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
