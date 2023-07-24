import 'dart:core';

class ImageModel {
  final String id;
  final String fullUrl;
  final String title;

  ImageModel({
    required this.id,
    required this.fullUrl,
    required this.title,
  });

  // factory ImageModel.fromJSON(Map<String,dynamic> json) {
  factory ImageModel.fromJson(Map<String,dynamic> json) {
    return ImageModel(
      id: json['id'],
      title: json['title'],
      fullUrl: json.containsKey('full_url') ? json['full_url'] : 'https://farm${json['farm']}.staticflickr.com/${json['server']}/${json['id']}_${json['secret']}.jpg',
      // url: 'https://farm${json['farm']}.staticflickr.com/${json['server']}/${json['id']}_${json['secret']}.jpg',
    );
  }

  Map<String,dynamic> toJSON(){
    return {
      'id': id,
      'title': title,
      'full_url': fullUrl,
    };
  }
}
