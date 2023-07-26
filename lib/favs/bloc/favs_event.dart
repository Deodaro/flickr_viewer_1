part of './favs_bloc.dart';

abstract class FavsEvent extends Equatable {
  const FavsEvent();
}

class RegistrationEvent extends FavsEvent {
  @override
  List<Object?> get props => [];
}

class FavsLoadingEvent extends FavsEvent {
  const FavsLoadingEvent();

  @override
  List<Object?> get props => [];
}

// class AddFav extends FavsState {
//   @override
//   List<Object?> get props => [];
// }

class FavAddedEvent extends FavsEvent {
  ImageModelBase favImage;

  FavAddedEvent(this.favImage);

  @override
  List<Object?> get props => [favImage];
}

class FavRemoved extends FavsEvent {
  int id;

  FavRemoved(this.id);

  @override
  List<Object?> get props => [id];
}
