part of 'gallery_bloc.dart';

abstract class GalleryState {}

class GalleryInitial extends GalleryState {}

class GalleryLoadInProgress extends GalleryState {}

class GalleryLoadSuccess extends GalleryState {
  List<ImageModel> images;

  GalleryLoadSuccess({required this.images});
}

class GalleryLoadFailure extends GalleryState {}


