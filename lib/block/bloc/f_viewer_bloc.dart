import 'package:dio/dio.dart';
import 'package:flickr_viewer/repositories/models/photo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'f_viewer_event.dart';
part 'f_viewer_state.dart';

const apiUrl = 'https://www.flickr.com/services/rest/';

class FViewerBloc extends Bloc<FViewerEvent, FViewerState> {
  FViewerBloc() : super(FViewerState()) {
    // on<LoadInitialDataEvent>(_onInit);
    on<SearchImagesEvent>(_onSearch);

    on<ShowSettingsEvent>(
        (ShowSettingsEvent event, Emitter<FViewerState> emit) {
      if (state.isShowSettings == true) {
        emit(FViewerState(isShowSettings: false));
      } else {
        emit(FViewerState(isShowSettings: true));
      }
    });

    on<SetColunmsEvent>((SetColunmsEvent event, Emitter<FViewerState> emit) {
      emit(FViewerState(columnsCount: event.value));
    });
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
