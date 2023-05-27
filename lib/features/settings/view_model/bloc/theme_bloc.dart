import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repostry/theme_repostry.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepostry repository;
  //final  themeRepostry=locator.get<ThemeRepostry>().getTheme();

  ThemeBloc({required this.repository}) : super(ThemeInitial()) {
    on<ThemeChanged>((event, emit) async {
      final themeBool = await repository.getTheme();
      emit(AppTheme(themeBool));
    });
  }

  void setTheme(bool a) {
    repository.setTheme(a);
  }

  // ThemeBloc({

  //   required this.repository,
  // }) : super(ThemeInitial());
  // late bool booltheme = false;
  // bool getTheme() {
  //   sl.get<ThemeRepostry>().getTheme().then((booltheme) {
  //     emit(AppTheme(booltheme));
  //     booltheme = booltheme;
  //   });
  //   return booltheme;
  // }

}
