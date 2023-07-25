part of './favs_bloc.dart';

abstract class FavsEvent extends Equatable {
  const FavsEvent();
}
// = login
class FavsLoading extends FavsEvent {
  FavsLoading();

  @override
  List<Object?> get props => [];
}

// class AddFav extends FavsState {
//   @override
//   List<Object?> get props => [];
// }

class FavAdded extends FavsEvent {
  ImageModel favImage;

  FavAdded(this.favImage);

  @override
  List<Object?> get props => [favImage];
}

class FavRemoved extends FavsEvent {
  int id;

  FavRemoved(this.id);

  @override
  List<Object?> get props => [id];
}
