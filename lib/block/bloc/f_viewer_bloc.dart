import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'f_viewer_event.dart';
part 'f_viewer_state.dart';

class FViewerBloc extends Bloc<FViewerEvent, FViewerState> {
  FViewerBloc() : super(FViewerInitial()) {
    //  регистрация обработчика ивента
    on<LoadData>((event, emit) {
      print('data loading...');
    });
  }
}



    // вызовется, когда у блока вызовется какой-либо fviewer event / регистрация обработчика ивента
    // on<LoadData>((event, emit) {
      // при передаче в FViewerBloc этого ивента, затриггерится этот код
      // print('data loading...');
    // });
