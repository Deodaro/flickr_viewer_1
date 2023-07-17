part of 'f_viewer_bloc.dart';

class FViewerState {
  final List<Photo> images;
  // final bool isLoading;

  FViewerState({
    this.images = const [],
    // this.isLoading = false,
  });
}

// class FViewerInitialState extends FViewerState {}

// class DataLoadingState extends FViewerState {}

// class FViewerDataLoaded extends FViewerState {
//   FViewerDataLoaded({
//     required this.imageList,
//   });

//   final List<Photo> imageList;
// }

// class DataLoadedState extends FViewerState {
//   DataLoadedState({
//     required this.imagesList,
//   });

//   final List<Photo> imagesList;
// }

// class FViewerDataLoadedFailure extends FViewerState {
//   FViewerDataLoadedFailure({
//     required this.error,
//   });

//   final Object? error;
// }
