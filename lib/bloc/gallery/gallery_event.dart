part of 'gallery_bloc.dart';

abstract class GalleryEvent {}

class ImagesLoading extends GalleryEvent {}

class SearchStarted extends GalleryEvent{
  final String query;

  SearchStarted(this.query);
}

class ImagesLoaded extends GalleryEvent {}
