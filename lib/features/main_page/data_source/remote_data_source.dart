import 'package:dio/dio.dart';
import 'package:meme_generator/core/network/dio_instance.dart';

import '../model/memes_model.dart';

class MemesWebServices {
  //Dio dioMemes = DioInstance().webServices();
  final DioInstance dio;

  MemesWebServices(this.dio);

  Future<dynamic> getMeme() async {
    Response response = await dio.webServices().get('meme');
    //debugPrint(response.data.toString());
    final meme = response.data;
    return MemesModel.fromJson(meme);
  }
}
