import 'package:flickr_viewer/models/image_model.dart';
import 'package:flickr_viewer/repositories/gallery_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc({
    required this.galleryRepository,
  }) : super(GalleryInitial()) {
    on<SearchStarted>(_onSearch);
  }

  final GalleryRepository galleryRepository;

  _onSearch(SearchStarted event, Emitter<GalleryState> emit) async {
    try {
      final List<ImageModel> imageList = await galleryRepository.search(event.query);
      emit(GalleryLoadSuccess(images: imageList));
    } catch (_) {
      emit(GalleryLoadFailure());
    }
  }
}