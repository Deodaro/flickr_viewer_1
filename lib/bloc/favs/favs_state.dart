part of 'favs_bloc.dart';

abstract class FavsState {}

class FavsInitial extends FavsState {}

class FavsLoadSuccess extends FavsState {
  List<ImageModel> favImages;

  FavsLoadSuccess({required this.favImages});
}

class FavAddSuccess extends FavsState {
  ImageModel favImage;

  FavAddSuccess({required this.favImage});
}
