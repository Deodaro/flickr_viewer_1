import 'package:flickr_viewer/models/image_model.dart';
import 'package:flickr_viewer/repositories/favs_repository.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'favs_event.dart';
part 'favs_state.dart';

// class FavsBloc extends Bloc<FavsEvent, FavsState> {
class FavsBloc {

  final FavsRepository favsRepository = FavsRepository();

  // FavsBloc({
  //   required this.favsRepository,
  // }) : super(FavsInitial()) {
  //   getAllFavImages();
  //
  //   on<FavsLoading>(_onFavsLoading);
  //   on<FavAdded>(_onFavAdd);
  // }
  final PublishSubject<List<ImageModel>> _imagesFetcher = PublishSubject<List<ImageModel>>();
  Stream<List<ImageModel>> get allFavImages => _imagesFetcher.stream;

  // FavsBloc({
  //     required this.favsRepository,
  //   }) {
  //   getAllFavImages();
  // }

  FavsBloc(){
    getAllFavImages();
  }

  getAllFavImages() async {
    print('GET ALL');
    List<ImageModel> favImages = await favsRepository.getAllFavImages();
    print(favImages);
    _imagesFetcher.sink.add(favImages);
  }

  addFavImage(ImageModel favImage) async {
    await favsRepository.insertFavImage(favImage);
    getAllFavImages();
  }

  deleteFavImage(int index) async {
    favsRepository.deleteFavImage(index);
    getAllFavImages();
    // emit()
  }

  // final FavsRepository favsRepository;

  // void _onFavAdd(FavAdded event, Emitter<FavsState> emit) {
  //   emit(FavAddSuccess(favImage: event.favImage));
  // }
  //
  // void _onFavsLoading(FavsLoading event, Emitter<FavsState> emit) async {
  //   List<ImageModel> favImages = await favsRepository.getAllFavImages();
  //   emit(FavsLoadSuccess(favImages: favImages));
  // }

}


final favsBloc = FavsBloc();
