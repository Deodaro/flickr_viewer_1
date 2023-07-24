part of 'favs_bloc.dart';

// @immutable
abstract class FavsEvent {}

class FavsLoading extends FavsEvent {

}

class FavAdded extends FavsEvent {
  ImageModel favImage;
  FavAdded({required this.favImage});
}
// check names
class FavRemoved extends FavsEvent {
  // ImageModel image;
  // FavRemoved({this.image});
} // check names
