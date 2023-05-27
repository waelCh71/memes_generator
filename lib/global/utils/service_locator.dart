import 'package:get_it/get_it.dart';
import 'package:meme_generator/core/network/dio_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/main_page/data_source/remote_data_source.dart';
import '../../features/main_page/model/memes_model.dart';
import '../../features/main_page/repositry/meme_repostry.dart';
import '../../features/main_page/state_managment/bloc/meme_bloc.dart';
import '../../features/settings/data/local_data_sources.dart';
import '../../features/settings/repostry/theme_repostry.dart';
import '../../features/settings/view_model/bloc/theme_bloc.dart';
import '../themes/dark_theme.dart';
import '../themes/light_theme.dart';

final sl = GetIt.instance;

void setup() async {
  //! Dio Inject
  
  sl.registerLazySingleton<DioInstance>(
    () => DioInstance(),
  );

  //! Memes Setup
  sl.registerLazySingleton<MemesWebServices>(
    () => MemesWebServices(sl()),
  );
  sl.registerLazySingleton<MemeRepositry>(
    () => MemeRepositry(memesWebServices: sl()),
  );
  sl.registerLazySingleton<MemeBloc>(
    () => MemeBloc(memeRepositry: sl()),
  );
  sl.registerLazySingleton<MemesModel>(() => MemesModel());

  //! SharedPreference Setup
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //! Theme Setup
  sl.registerLazySingleton<UseThemePreferance>(
    () => UseThemePreferance(preferences: sl()),
  );
  sl.registerLazySingleton<ThemeRepostry>(
    () => ThemeRepostry(sl()),
  );
  sl.registerLazySingleton<ThemeBloc>(
    () => ThemeBloc(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton<DarkTheme>(
    () => DarkTheme(),
  );
  sl.registerLazySingleton<LightTheme>(
    () => LightTheme(),
  );
}
