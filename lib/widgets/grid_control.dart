import 'package:flickr_viewer/gallery/bloc/gallery_bloc.dart';
import 'package:flickr_viewer/repositories/favs_repository.dart';
import 'package:flickr_viewer/repositories/gallery_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_state_button/multi_state_button.dart';

class GridControl extends StatelessWidget {
  GridControl({Key? key}) : super(key: key);

  // final int _columnsCount = 2;

  static const String _oneColumn = "OneColumn";
  static const String _twoColumns = "TwoColumns";
  static const String _fourColumns = "FourColumns";
  final MultiStateButtonController multiStateButtonController =
      MultiStateButtonController(initialStateName: _twoColumns);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryBloc(
        RepositoryProvider.of<GalleryRepository>(context),
        RepositoryProvider.of<FavsRepository>(context),
      ),
      child: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          return MultiStateButton(
            multiStateButtonController: multiStateButtonController,
            buttonStates: [
              ButtonState(
                stateName: _oneColumn,
                child: const Icon(Icons.looks_one_rounded),
                color: Colors.transparent,
                onPressed: () {
                  // BlocProvider.of<GalleryBloc>(context).add(ToggleGridEvent(2));
                  multiStateButtonController.setButtonState = _twoColumns;
                },
              ),
              ButtonState(
                stateName: _twoColumns,
                child: const Icon(Icons.looks_two_rounded),
                color: Colors.transparent,
                onPressed: () {
                  // BlocProvider.of<GalleryBloc>(context).add(ToggleGridEvent(4));
                  multiStateButtonController.setButtonState = _fourColumns;
                },
              ),
              ButtonState(
                stateName: _fourColumns,
                child: const Icon(Icons.looks_4_rounded),
                color: Colors.transparent,
                onPressed: () {
                  // BlocProvider.of<GalleryBloc>(context).add(ToggleGridEvent(2));
                  multiStateButtonController.setButtonState = _oneColumn;
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
