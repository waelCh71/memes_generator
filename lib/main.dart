import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_generator/global/themes/colors.dart';

import 'features/main_page/state_managment/bloc/meme_bloc.dart';
import 'features/main_page/view/show_memes_page.dart';
import 'features/settings/view_model/bloc/theme_bloc.dart';
import 'global/themes/dark_theme.dart';
import 'global/themes/light_theme.dart';
import 'global/utils/service_locator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl.get<ThemeBloc>()..add(ThemeChanged()),
        ),
        BlocProvider(
          create: (context) => sl.get<MemeBloc>()..add(MemeChanged()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is AppTheme) {
            state.booltheme
                ? theme = sl.get<DarkTheme>().getDarkTheme()
                : theme = sl.get<LightTheme>().getLightTheme();
            return MaterialApp(
              title: "Memes",
              theme: theme,
              home: ShowMemesRandomly(
                boolTheme: state.booltheme,
              ),
            );
          } else {
            return const CircularProgressIndicator(
              color: myRed,
            );
          }
        },
      ),
    );
  }
}
