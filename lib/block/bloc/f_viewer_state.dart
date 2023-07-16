part of 'f_viewer_bloc.dart';

class FViewerState {}

class FViewerInitial extends FViewerState {}

class FViewerDataLoading extends FViewerState {}

class FViewerDataLoaded extends FViewerState {
  FViewerDataLoaded({
    required this.imageList,
  });

  final List<Photo> imageList;
}

class FViewerDataLoadedFailure extends FViewerState {
  FViewerDataLoadedFailure({
    required this.error,
  });

  final Object? error;
}
