part of './gallery_bloc.dart';

abstract class GalleryState extends Equatable {
  GalleryState();
}

class GalleryInitial extends GalleryState {
  GalleryInitial();

  @override
  List<Object?> get props => [];
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

class GalleryLoadFailure extends GalleryState {
  @override
  List<Object?> get props => [];
}

class RegisteringServicesState extends GalleryState {
  @override
  List<Object?> get props => [];
}
