// import 'package:flickr_viewer/widgets/image_card.dart';
// import 'package:flickr_viewer/block/bloc/f_viewer_bloc.dart';
import 'package:flickr_viewer/block/bloc/f_viewer_bloc.dart';
// import 'package:flickr_viewer/repositories/images_repository.dart';
// import 'package:flickr_viewer/repositories/models/photo.dart';
// import 'package:flickr_viewer/widgets/content_area.dart';
import 'package:flickr_viewer/widgets/image_card.dart';
// import 'package:flickr_viewer/widgets/search_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class GalleryScreen extends StatefulWidget {
//   const GalleryScreen({super.key});

//   @override
//   State<GalleryScreen> createState() => _GalleryScreenState();
// }

// class _GalleryScreenState extends State<GalleryScreen> {
//   // List<Photo> _imageList = <Photo>[];

//   // final bloc = FViewerBloc();

//   final _columnsNumber = 2;

//   bool _isSearch = false;

//   @override
//   void initState() {
//     // _loadData();
//     // bloc.add(SearchImagesEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final bloc = FViewerBloc();
//     // bloc.add(SearchImagesEvent());

//     return BlocProvider<FViewerBloc>(
//       // create: (context) => bloc,
//       create: (context) => FViewerBloc();
//       child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//             title: !_isSearch ? const Text('Gallery') : _searchTextField(),
//             actions: !_isSearch
//                 ? [
//                     IconButton(
//                       icon: const Icon(Icons.search),
//                       onPressed: () {
//                         // _bloc.add() заменить setState на обращения к блок
//                         setState(() {
//                           _isSearch = true;
//                         });
//                       },
//                     )
//                   ]
//                 : [
//                     IconButton(
//                       icon: const Icon(Icons.clear),
//                       onPressed: () {
//                         setState(() {
//                           _isSearch = false;
//                         });
//                       },
//                     )
//                   ],
//           ),
//           body: BlocBuilder<FViewerBloc, FViewerState>(
//             // bloc: bloc,
//             builder: (context, state) {
//               // final bloc = BlocProvider.of<FViewerBloc>(context);

//               if (state is DataLoadedState) {
//                 return GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: _columnsNumber,
//                   ),
//                   itemCount: state.imagesList.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       padding: const EdgeInsets.all(8),
//                       child: ImageCard(
//                         photo: state.imagesList[index],
//                       ),
//                     );
//                   },
//                 );
//               }
//               if (state is FViewerDataLoadedFailure) {
//                 return const Center(
//                   child: Text('Something went wrong...'),
//                 );
//               }

//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             },
//           )),
//     );
//   }
// }

// class SearchLine extends SearchDelegate {
//   final List<String> tags;
//   final List<String> suggestions;

//   SearchLine({this.tags, this.suggestions});

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         icon: const Icon(Icons.arrow_back),
//         onPressed: () {
//           close(context, null);
//         });
//   }

//   // @override
//   // Widget buildResults(BuildContext context) {
//   //   List<String> matchQuery = [];
//   //   for (var item in tags) {
//   //     if (item.toLowerCase().contains(query.toLowerCase())) {
//   //       matchQuery.add(item);
//   //     }
//   //   }
//   //   // todo проверить
//   //   return ListView.builder(
//   //     itemCount: matchQuery.length,
//   //     itemBuilder: (context, index) {
//   //       String result = matchQuery[index];
//   //       return ListTile(
//   //         title: Text(result),
//   //       );
//   //     },
//   //   );
//   // }

//   @override
//   Widget buildResults(BuildContext context) {
//     final List<String>
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var item in keywords) {
//       if (item.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(item);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         String result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }
// }

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      // autofocus: true,
      // textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        hintText: 'Search',
        filled: true,
        prefixIcon: Icon(Icons.search),
        border: InputBorder.none,
      ),
      onSubmitted: (value) {
        context.read<FViewerBloc>().add(SearchImagesEvent(value));
      },
    );
  }
}
// для вызова поиска
// onPressed: () {
//   BlocProvider.of<FViewerBloc>(context).add(event)
// }

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final images = context.select((FViewerBloc bloc) => bloc.state.images);
    // bool _isSearch = false;
    // bool isSearch = context.select((FViewerBloc bloc) => bloc.state.isSearch);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: SearchTextField(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/favorites',
                );
              },
              icon: const Icon(Icons.bookmarks)),
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   onPressed: () {
          //     // _bloc.add() заменить setState на обращения к блок
          //     // setState(() {
          //     // context.read<FViewerBloc>().add()
          //     _isSearch = true;

          //     // });
          //   },
          // )
        ],
      ),
      body: (images.isNotEmpty)
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: ImageCard(
                    photo: images[index],
                  ),
                );
              },
            )
          : const Center(child: Text('+')),

      // if (state is FViewerDataLoadedFailure) {
      //   return const Center(
      //     child: Text('Something went wrong...'),
      //   );
      // }

      // return const Center(
      //   child: CircularProgressIndicator(),
      // );
    );
  }
}
