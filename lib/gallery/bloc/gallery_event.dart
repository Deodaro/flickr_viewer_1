part of './gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  GalleryEvent();
}

class SearchStartEvent extends GalleryEvent {
  final String query;

  SearchStartEvent(this.query);

  @override
  List<Object?> get props => [query];
}

// class ImagesLoaded extends GalleryEvent {
//   @override
//   List<Object?> get props => [];
// }

// class ToggleGridEvent extends GalleryEvent {
//   final int value;
//
//   ToggleGridEvent(this.value);
//
//   @override
//   List<Object?> get props => [value];
// }

class RegisterServicesEvent extends GalleryEvent {
  @override
  List<Object?> get props => [];
}
