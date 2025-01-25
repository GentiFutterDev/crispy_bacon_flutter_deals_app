part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class ToggleThemeEvent extends ThemeEvent {
  const ToggleThemeEvent();

  @override
  List<Object?> get props => [];
}

class InitializeThemeEvent extends ThemeEvent {
  const InitializeThemeEvent();

  @override
  List<Object?> get props => [];
}
