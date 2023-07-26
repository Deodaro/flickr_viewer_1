// import 'dart:core';
import 'package:hive/hive.dart';
// import 'dart:convert';

// class ImageModel {
//   final int id;
//   final String fullUrl;
//   final String title;
//
//   ImageModel({
//     required this.id,
//     required this.fullUrl,
//     required this.title,
//   });
//
//   // factory ImageModel.fromJSON(Map<String,dynamic> json) {
//   factory ImageModel.fromJson(Map<String,dynamic> json) {
//     return ImageModel(
//       id: json['id'],
//       title: json['title'],
//       fullUrl: json.containsKey('full_url') ? json['full_url'] : 'https://farm${json['farm']}.staticflickr.com/${json['server']}/${json['id']}_${json['secret']}.jpg',
//       // url: 'https://farm${json['farm']}.staticflickr.com/${json['server']}/${json['id']}_${json['secret']}.jpg',
//     );
//   }
//
//   Map<String,dynamic> toJSON(){
//     return {
//       'id': id,
//       'title': title,
//       'full_url': fullUrl,
//     };
//   }
// }

// ImageModel clientFromJson(String str) {
//   final jsonData = json.decode(str);
//   return ImageModel.fromMap(jsonData);
// }
//
// String clientToJson(ImageModel data) {
//   final dyn = data.toMap();
//   return json.encode(dyn);
// }

// class ImageModel {
//   int id;
//   String fullUrl;
//   String title;

  // ImageModel({
  //   required this.id,
  //   required this.fullUrl,
  //   required this.title,
  // });

  // factory ImageModel.fromJson(Map<String,dynamic> json) {
  //   return ImageModel(
  //     // factory ImageModel.fromMap(Map<String, dynamic> json) => ImageModel(
  //     id: json["id"],
  //     fullUrl: 'https://farm${json['farm']}.staticflickr.com/${json['server']}/${json['id']}_${json['secret']}.jpg',
  //     title: json["title"],
  //   );
  // }

  // Map<String, dynamic> toMap() => {
  //   "id": id,
  //   "full_url": fullUrl,
  //   "title": title,
  // };
// }


part 'image_model.g.dart';

@HiveType(typeId: 1)
class ImageModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String fullUrl;
  @HiveField(2)
  final String title;
  @HiveField(3)
  bool isFav = false;

  ImageModel(this.id, this.fullUrl, this.title, this.isFav);
}