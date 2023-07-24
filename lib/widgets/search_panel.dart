// import 'package:flickr_viewer/bloc/f_viewer_bloc.dart';
// import 'package:flickr_viewer/bloc/f_viewer_event.dart';
import 'package:flickr_viewer/bloc/gallery/gallery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPanel extends StatelessWidget {
  const SearchPanel({super.key});

  @override
  Widget build(BuildContext context) {
    // is BlocBuilder needed?
    return BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          return TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search',
            filled: true,
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            context.read<GalleryBloc>().add(SearchStarted(value));
          },
          );
        },

    );
  }
}


//     // return BlocBuilder<FViewerBloc, FViewerState>(
//       builder: (context, state) {
//         return TextField(
//           autofocus: true,
//           decoration: const InputDecoration(
//             hintText: 'Search',
//             filled: true,
//             prefixIcon: Icon(Icons.search),
//             border: InputBorder.none,
//           ),
//           onSubmitted: (value) {
//             // context.read<FViewerBloc>().add(LoadImagesEvent(value));
//           },
//         );
//       };
//     // );
//
//     // return TextField(
//     //   autofocus: true,
//     //   decoration: const InputDecoration(
//     //     hintText: 'Search',
//     //     filled: true,
//     //     prefixIcon: Icon(Icons.search),
//     //     border: InputBorder.none,
//     //   ),
//     //   onSubmitted: (value) {
//     //     // context.read<FViewerBloc>().add(LoadImagesEvent(value));
//     //   },
//     // );
//   }
// }