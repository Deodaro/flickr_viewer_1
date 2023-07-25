part of './favs_bloc.dart';

abstract class FavsState extends Equatable {
  const FavsState();
}

class FavsInitial extends FavsState {
  @override
  List<Object?> get props => [];
}

class AllFavsLoadSuccess extends FavsState {
  final List<ImageModel> favImages;

  AllFavsLoadSuccess(this.favImages);

  @override
  List<Object?> get props => [favImages];
}


class AddFavSuccess extends FavsState {
  final ImageModel favImage;

  AddFavSuccess(this.favImage);

  @override
  List<Object?> get props => [favImage];
}

// class RegisteringServicesState extends FavsState {
//   @override
//   List<Object?> get props => [];
// }
