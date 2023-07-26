part of './gallery_bloc.dart';

abstract class GalleryState extends Equatable {
  GalleryState();
}

class GalleryInitial extends GalleryState {
  final String? error;

  GalleryInitial({this.error});

  @override
  List<Object?> get props => [error];
  // @override
  // List<Object?> get props => [];
}

class GalleryLoadInProgress extends GalleryState {
  @override
  List<Object?> get props => [];
}

class GalleryLoadSuccessState extends GalleryState {
  final List<ImageModelBase> images;

  GalleryLoadSuccessState(this.images);

  @override
  List<Object?> get props => [images];
}

// TODO delete?
class GalleryLoadFailure extends GalleryState {
  @override
  List<Object?> get props => [];
}

// class GridCount extends GalleryState {
//   final int count;
//
//   GridCount(this.count);
//
//   @override
//   List<Object?> get props => [count];
// }

class RegisteringServicesState extends GalleryState {
  @override
  List<Object?> get props => [];

}
