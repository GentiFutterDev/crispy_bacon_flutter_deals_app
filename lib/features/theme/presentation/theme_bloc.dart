import 'package:crispy_bacon_flutter_deals_app/core/theme_data.dart';
import 'package:crispy_bacon_flutter_deals_app/features/theme/domain/theme_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository themeRepository;

  ThemeBloc(this.themeRepository) : super(LightThemeState()) {
    
    on<InitializeThemeEvent>((event, emit) async {
      final savedTheme = await themeRepository.getSavedTheme();
      if (savedTheme == 'dark') {
        emit(DarkThemeState());
      } else {
        emit(LightThemeState());
      }
    });

    on<ToggleThemeEvent>((event, emit) async {
      if (state is LightThemeState) {
        emit(DarkThemeState());
        await themeRepository.saveTheme('dark');
      } else {
        emit(LightThemeState());
        await themeRepository.saveTheme('light');
      }
    });

    add(InitializeThemeEvent());
  }
}
