import 'package:equatable/equatable.dart';
import 'package:flickr_viewer/models/image_model.dart';
import 'package:flickr_viewer/repositories/gallery_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gallery_event.dart';

part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  // GalleryBloc({
  //   required this.galleryRepository,
  // }) : super(GalleryInitial()) {
  //   on<SearchStarted>(_onSearch);
  // }

  final GalleryRepository _galleryRepository;

  GalleryBloc(this._galleryRepository) : super(GalleryInitial()) {
    on<SearchStarted>((SearchStarted event, emitter) async {
      try {
        final List<ImageModel> imageList =
            await _galleryRepository.search(event.query);
        emit(GalleryLoadSuccess(imageList));
      } catch (_) {
        emit(GalleryLoadFailure());
      }
    });

    // _onSearch(SearchStarted event, Emitter<GalleryState> emit) async {
    //   try {
    //     final List<ImageModel> imageList = await _galleryRepository.search(event.query);
    //     emit(GalleryLoadSuccess(imageList);
    //   } catch (_) {
    //     emit(GalleryLoadFailure());
    //   }
    // }
  }
}
