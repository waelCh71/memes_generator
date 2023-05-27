import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gallery_saver/gallery_saver.dart';

import '../../../../global/themes/colors.dart';
import '../../../../global/utils/constants.dart';
import '../../state_managment/bloc/meme_bloc.dart';

class StartGeneratingMemes extends StatefulWidget {
  final bool checkimage;

  const StartGeneratingMemes({super.key, required this.checkimage});
  // const StartGeneratingMemes({Key? key}) : super(key: key);

  @override
  State<StartGeneratingMemes> createState() => _StartGeneratingMemesState();
}

class _StartGeneratingMemesState extends State<StartGeneratingMemes>
    with SingleTickerProviderStateMixin {
  late TransformationController controller;
  late AnimationController animationController;
  Animation<Matrix4>? animation;

  @override
  void initState() {
    super.initState();

    controller = TransformationController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() => controller.value = animation!.value);
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemeBloc, MemeState>(
      builder: (context, state) {
        if (state is MemeLoaded) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\nGategory: ${state.meme.category}",
                    style: const TextStyle(fontSize: 25),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 17),
                    child: InteractiveViewer(
                        transformationController: controller,
                        child: FadeInImage.assetNetwork(
                          placeholder: loadingImage,
                          image: state.meme.image ?? "",
                          fit: BoxFit.cover,
                          placeholderFit: BoxFit.none,
                        ),
                        //! ToDOO
                        onInteractionEnd: (_) {
                          resetAnimation();
                        }),
                  ),
                  Text(
                    "\nCaption: ${state.meme.caption}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      saveMeme(state.meme.image.toString());

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Downloaded to Gallery"),
                      ));
                      //showNotification();
                    },
                    icon: const Icon(Icons.download),
                    label: const Text(
                      "Save Meme",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: myRed),
          );
        }
      },
    );
  }

  Future<void> saveMeme(String url) async {
    //final tempDir = await getTemporaryDirectory();
    //final path = '${tempDir.path}/myfile.jpg';

    //await Dio().download(url, path)
    await GallerySaver.saveImage(url);
  }

  void resetAnimation() {
    animation = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceInOut,
    ));
    animationController.forward(from: 0);
  }

  Future<void> showNotification() async {
    final notification = FlutterLocalNotificationsPlugin();
    notification.show(
      0,
      "Meme Saved",
      "Check Gallery to see the Image",
      await notifDetail(),
      payload: "meme",
    );
  }

  Future notifDetail() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        "channel id",
        "channel name",
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }
}
