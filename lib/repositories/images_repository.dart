import 'package:flickr_viewer/repositories/models/photo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ImagesRepository {
// добавить номер страницы в параметр
  Future<List<Photo>> getImages() async {
    final tags = 'embroidering';

    final testUrl =
        'https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=cdd6dc75933ebb336809503bd381e5ea&tags=$tags&format=json&nojsoncallback=1';

    final response = await Dio().get(testUrl.toString());
    final data = response.data as Map<String, dynamic>;
    final photoData = data['photos'] as Map<String, dynamic>;
    final imageList = photoData['photo'] as List;

    return imageList.map((item) {
      return Photo(
        title: item['title'],
        url:
            'https://farm${item['farm']}.staticflickr.com/${item['server']}/${item['id']}_${item['secret']}.jpg',
      );
    }).toList();
  }
}