part of './gallery_bloc.dart';

abstract class GalleryState extends Equatable {}

class GalleryInitial extends GalleryState {
  @override
  List<Object?> get props => [];
}

class GalleryLoadInProgress extends GalleryState {
  @override
  List<Object?> get props => [];
}

class GalleryLoadSuccess extends GalleryState {
  final List<ImageModel> images;

  GalleryLoadSuccess(this.images);
  @override
  List<Object?> get props => [images];
}

class GalleryLoadFailure extends GalleryState {
  @override
  List<Object?> get props => [];
}


