import 'package:equatable/equatable.dart';
import 'package:flickr_viewer/models/image_model_base.dart';
import 'package:flickr_viewer/repositories/favs_repository.dart';
import 'package:flickr_viewer/repositories/gallery_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gallery_event.dart';

part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GalleryRepository _galleryRepository;
  final FavsRepository _favsRepository;

  GalleryBloc(this._galleryRepository, this._favsRepository)
      : super(RegisteringServicesState()) {
    on<SearchStartEvent>((event, emit) async {
      emit(GalleryLoadInProgress());
      try {
        final List<ImageModelBase> imageList =
            await _galleryRepository.search(event.query);
        emit(GalleryLoadSuccessState(imageList));
      } catch (_) {
        emit(GalleryLoadFailure());
      }
    });

    on<RegisterServicesEvent>((event, emit) async {
      await _favsRepository.init();

      emit(GalleryInitial());
    });
  }
}
