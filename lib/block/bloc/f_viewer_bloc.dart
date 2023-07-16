import 'package:flickr_viewer/repositories/images_repository.dart';
import 'package:flickr_viewer/repositories/models/photo.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

part 'f_viewer_event.dart';
part 'f_viewer_state.dart';

class FViewerBloc extends Bloc<FViewerEvent, FViewerState> {
  final ImagesRepository _imagesRepository = ImagesRepository();

  FViewerBloc() : super(FViewerInitial()) {
    //  регистрация обработчика ивента
    on<LoadData>((event, emit) async {
      try {
        final imageList = await _imagesRepository.getImages();
        emit(FViewerDataLoaded(imageList: imageList));
      } catch (e) {
        emit(FViewerDataLoadedFailure(error: e));
      }
    });
  }
}
