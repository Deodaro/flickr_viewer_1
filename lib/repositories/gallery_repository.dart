import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flickr_viewer/models/image_model_base.dart';

class GalleryRepository {
  final apiUrl = 'https://www.flickr.com/services/rest/';
  final _httpClient = Dio();

  Future<List<ImageModelBase>> search(String query) async {
    final response = await _httpClient.get(apiUrl, queryParameters: {
      'method': 'flickr.photos.search',
      'api_key': 'cdd6dc75933ebb336809503bd381e5ea',
      'tags': query,
      'per_page': 40,
      'format': 'json',
      'nojsoncallback': 1
    });

    return (response.data['photos']?['photo'] as List)
        .map((json) => ImageModelBase.fromJson(json))
        .toList();
  }
}
