import 'package:hive/hive.dart';

part 'image_model_base.g.dart';

@HiveType(typeId: 2)
class ImageModelBase extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String fullUrl;
  @HiveField(2)
  final String title;

  ImageModelBase({
    required this.id,
    required this.fullUrl,
    required this.title,
  });

  factory ImageModelBase.fromJson(Map<String,dynamic> json) {
    return ImageModelBase(
      id: json['id'],
      fullUrl: 'https://farm${json['farm']}.staticflickr.com/${json['server']}/${json['id']}_${json['secret']}.jpg',
      title: json['title'],
    );
  }
}