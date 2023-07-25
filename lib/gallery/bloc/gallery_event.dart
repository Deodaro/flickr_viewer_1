part of './gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  GalleryEvent();
}

// class ImagesLoading extends GalleryEvent {}
//
// class GalleryInitial extends GalleryEvent {
//   @override
//   List<Object?> get props => [];
// }

class SearchStarted extends GalleryEvent{
  final String query;

  SearchStarted(this.query);

  @override
  List<Object?> get props => [query];
}

class ImagesLoaded extends GalleryEvent {
  // final List<ImageModel> images;
  //
  // ImagesLoaded
  //
  @override
  List<Object?> get props => [];
}
