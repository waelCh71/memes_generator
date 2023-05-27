part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  @override
  List<Object?> get props => [];
}

class AppTheme extends ThemeState {
  final bool booltheme;

  const AppTheme(this.booltheme);

  @override
  List<Object?> get props => [booltheme];
}
