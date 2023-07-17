import 'package:dio/dio.dart';
// import 'package:flickr_viewer/repositories/images_repository.dart';
import 'package:flickr_viewer/repositories/models/photo.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

part 'f_viewer_event.dart';
part 'f_viewer_state.dart';

const apiUrl = 'https://www.flickr.com/services/rest/';

// EventTransformer<E> debounceDroppable<E>(Duration duration) {
//   return (events, mapper) {
//     return droppable<E>().call(events.debounce(duration), mapper);
//   };
// }

class FViewerBloc extends Bloc<FViewerEvent, FViewerState> {
  FViewerBloc() : super(FViewerState()) {
    // on<LoadInitialDataEvent>(_onInit);
    on<SearchImagesEvent>(_onSearch);
  }

  final _httpClient = Dio();

  _onSearch(SearchImagesEvent event, Emitter<FViewerState> emit) async {
    if (event.query.length < 3) return;

    final response = await _httpClient.get(apiUrl, queryParameters: {
      'method': 'flickr.photos.search',
      'api_key': 'cdd6dc75933ebb336809503bd381e5ea',
      'tags': event.query,
      'format': 'json',
      'nojsoncallback': 1
    });

    final data = response.data as Map<String, dynamic>;
    final photoData = data['photos'] as Map<String, dynamic>;
    final imageList = photoData['photo'] as List;
    final result = imageList.map((item) {
      return Photo(
        title: item['title'],
        url:
            'https://farm${item['farm']}.staticflickr.com/${item['server']}/${item['id']}_${item['secret']}.jpg',
      );
    }).toList();

    emit(FViewerState(images: result));
  }
}

// class FViewerBloc extends Bloc<FViewerEvent, FViewerState> {
//   FViewerBloc({required ImagesRepository imagesRepository})
//       : super(FViewerInitialState()) {
//     on<SearchImagesEvent>(_onSearch);
    // on<DataLoadedState
  // }

  // final ImagesRepository _imagesRepository = ImagesRepository();
  // final ImagesRepository _imagesRepository;
  // FViewerBloc({required ImagesRepository imagesRepository})
  // : _imagesRepository = imagesRepository,
  // super(FViewerState()) {
  // super(FViewerInitial()) {
  // FViewerBloc() : super(FViewerState()) {
  // on<LoadData>((event, emit) async {
  //   try {
  //     final imageList = await _imagesRepository.getImages();
  //     emit(FViewerDataLoaded(imageList: imageList));
  //   } catch (e) {
  //     emit(FViewerDataLoadedFailure(error: e));
  //   }
  // });

// }

  // _onSearch(SearchImagesEvent event, Emitter<FViewerState> emit) async {
  //   // emit(DataLoadingState());
  //   final imagesList = await _imagesRepository.getImages();
  //   emit(DataLoadedState(imagesList: imagesList));
  // }
// }

  // late final ImagesRepository _imagesRepository;
// }
