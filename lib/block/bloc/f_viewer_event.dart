part of 'f_viewer_bloc.dart';

abstract class FViewerEvent {}

// class LoadDataEvent extends FViewerEvent {}

// class LoadInitialDataEvent extends FViewerEvent {}

class SearchImagesEvent extends FViewerEvent {
  final String query;

  SearchImagesEvent(this.query);
}
