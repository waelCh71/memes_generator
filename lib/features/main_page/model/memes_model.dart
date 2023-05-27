import 'dart:convert';

class MemesModel {
  int? id;
  String? image;
  String? caption;
  String? category;

  MemesModel({this.id, this.image, this.caption, this.category});

  factory MemesModel.memesModelFromJson(String str) =>
      MemesModel.fromJson(json.decode(str));

  MemesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    caption = json['caption'];
    category = json['category'];
  }
}
