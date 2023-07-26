import 'package:equatable/equatable.dart';
import 'package:flickr_viewer/models/image_model_base.dart';
import 'package:flickr_viewer/repositories/favs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favs_event.dart';

part './favs_state.dart';

class FavsBloc extends Bloc<FavsEvent, FavsState> {
  final FavsRepository _favsRepo;

  FavsBloc(this._favsRepo) : super(RegistrationState()) {
    on<RegistrationEvent>((event, emit) async {
      await _favsRepo.init();
      emit(AllFavsLoading());
    });

    on<FavsLoadingEvent>((event, emit) {
      final images = _favsRepo.getAllFavImages();
      emit(AllFavsLoadSuccess(images));
    });

    on<FavAddedEvent>((event, emit) async {
      _favsRepo.addFavImage(event.favImage);
      add(FavsLoadingEvent());
    });

    on<FavRemoved>((event, emit) async {
      _favsRepo.removeFavImage(event.id);
    });
  }
}
