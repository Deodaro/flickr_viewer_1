// import 'package:meta/meta.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flickr_viewer/models/image_model_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryRepository {
  final apiUrl = 'https://www.flickr.com/services/rest/';
  final _httpClient = Dio();

  Future<List<ImageModelBase>> search(String query) async {
    // const testUrl = 'https://www.flickr.com/services/rest/?api_key=cdd6dc75933ebb336809503bd381e5ea&tags=island&per_page=10&format=json&method=flickr.photos.search';

    final response = await _httpClient.get(apiUrl, queryParameters: {
      'method': 'flickr.photos.search',
      'api_key': 'cdd6dc75933ebb336809503bd381e5ea',
      'tags': query,
      'per_page': 10,
      'format': 'json',
      'nojsoncallback': 1
    });

    // final response = await _httpClient.get(testUrl);

    return (response.data['photos']?['photo'] as List)
        .map((json) => ImageModelBase.fromJson(json))
        .toList();
  }
}
