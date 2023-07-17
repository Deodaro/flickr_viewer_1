part of 'f_viewer_bloc.dart';

class FViewerState {
  final List<Photo> images;
  final bool isShowSettings;
  final double columnsCount;

  FViewerState({
    this.images = const [],
    this.isShowSettings = false,
    this.columnsCount = 2,
  });
}
