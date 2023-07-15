import 'package:flickr_viewer/repositories/models/photo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FlickrViewerRepository {
  // Future<List<Photo>> getImages() async {
  Future<List<Photo>> getImages() async {
    const testUrl =
        'https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=cdd6dc75933ebb336809503bd381e5ea&user_id=198721410%40N07&per_page=10&format=json&nojsoncallback=1';
    final response = await Dio().get(testUrl);

    // final photosData =
    //     (response.data as Map<String, dynamic>)['photos']['photo'].toList();
    final data = response.data as Map<String, dynamic>;
    final photoData = data['photos'] as Map<String, dynamic>;
    // final imageList = photosData['photo'].toList();
    final imageList = photoData['photo'] as List;
    final theList = imageList.map((item) {
      debugPrint(item['farm'].toString());
      debugPrint(item['server'].toString());
      return Photo(
        title: item['title'],
        url:
            'https://farm${item['farm']}.staticflickr.com/${item['server']}/${item['id']}_${item['secret']}.jpg',
      );
    }).toList();
    // final imageList = photosData
    //     .map((item) => Photo(
    //           title: item.title,
    //         ))
    //     .toList();

    return theList;
  }
}
// 'https://farm' + farmId + '.staticflickr.com/' + serverId + '/' + id + '_' + secret + '.jpg'