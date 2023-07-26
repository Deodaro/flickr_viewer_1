part of './favs_bloc.dart';

abstract class FavsState extends Equatable {
  const FavsState();
}

class RegistrationState extends FavsState {
  @override
  List<Object?> get props => [];
}

class AllFavsLoading extends FavsState {
  @override
  List<Object?> get props => [];
}

class AllFavsLoadSuccess extends FavsState {
  final List<ImageModelBase> favImages;

  const AllFavsLoadSuccess(this.favImages);

  @override
  List<Object?> get props => [favImages];
}


class AddFavSuccess extends FavsState {
  final ImageModelBase favImage;

  AddFavSuccess(this.favImage);

  @override
  List<Object?> get props => [favImage];
}


// class RegisteringServicesState extends FavsState {
//   @override
//   List<Object?> get props => [];
// }
