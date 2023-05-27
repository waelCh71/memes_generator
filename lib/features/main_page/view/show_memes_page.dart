import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../../global/themes/colors.dart';
import '../../settings/view_model/bloc/theme_bloc.dart';
import '../state_managment/bloc/meme_bloc.dart';
import 'widgets/main_page_first_run.dart';
import 'widgets/main_page_showing_meme.dart';
import 'widgets/offline_widget.dart';

class ShowMemesRandomly extends StatefulWidget {
  final bool boolTheme;

  const ShowMemesRandomly({super.key, required this.boolTheme});

  @override
  State<ShowMemesRandomly> createState() => _ShowMemesRandomlyState();
}

class _ShowMemesRandomlyState extends State<ShowMemesRandomly> {
  bool checkImageAnimation = false;
  bool _checkFirstTime = true;
  bool _connected = true;
  dynamic _icon = const Text(" OK! ");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Memes"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(
                Icons.sunny,
              ),
              onPressed: () {
                // sl.get<ThemeBloc>().setTheme(!widget.boolTheme);
                // sl.get<ThemeBloc>().add(ThemeChanged());
                BlocProvider.of<ThemeBloc>(context).setTheme(!widget.boolTheme);
                BlocProvider.of<ThemeBloc>(context).add(ThemeChanged());
              })
        ],
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          _connected = connected;
          if (connected) {
            return _checkFirstTime
                ? const MainPageBody()
                : StartGeneratingMemes(checkimage: checkImageAnimation);
          } else {
            return OfllineWidget(
              booltheme: widget.boolTheme,
            );
          }
        },
        child: const CircularProgressIndicator(
          color: myRed,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeFloatButton,
        child: _icon,
      ),
    );
  }

  void changeFloatButton() {
    //sl.get<MemeBloc>().add(MemeChanged());

    if (_connected) {
      BlocProvider.of<MemeBloc>(context).add(MemeChanged());
      setState(() {
        checkImageAnimation = true;
        _checkFirstTime = false;
        _icon = const Icon(Icons.skip_next);
      });
    }
  }
}
