part of 'f_viewer_bloc.dart';

abstract class FViewerEvent {}

class SearchImagesEvent extends FViewerEvent {
  final String query;

  SearchImagesEvent(this.query);
}

class ShowSettingsEvent extends FViewerEvent {}

class SetColunmsEvent extends FViewerEvent {
  final double value;

  SetColunmsEvent(this.value);
}
