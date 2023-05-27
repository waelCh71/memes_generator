import '../data_source/remote_data_source.dart';
import '../model/memes_model.dart';

class MemeRepositry {
  final MemesWebServices memesWebServices;
  MemeRepositry({
    required this.memesWebServices,
  });
  Future<MemesModel> getMeme() async {
    final meme = await memesWebServices.getMeme();
    return meme;
  }
}
// final meme = await get(Uri.parse("${baseURL}meme"));

    // final activity = memes.memesModelFromJson(meme.body);