// import 'package:flickr_viewer/bloc/f_viewer_bloc.dart';
// import 'package:flickr_viewer/bloc/f_viewer_event.dart';
// import 'package:flickr_viewer/repositories/images_repository/images_repository.dart';
// import 'package:flickr_viewer/screens/gallery_screen.dart';
// import 'package:flickr_viewer/bloc/favs/favs_bloc.dart';
import 'package:flickr_viewer/bloc/gallery/gallery_bloc.dart';
import 'package:flickr_viewer/repositories/favs_repository.dart';
import 'package:flickr_viewer/repositories/gallery_repository.dart';
import 'package:flickr_viewer/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flickr_viewer/router/router.dart';
import 'package:flickr_viewer/theme/theme.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class FlickrViewerApp extends StatelessWidget {
//   const FlickrViewerApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider(
//       create: (context) => ImagesRepository(),
//       child: MultiBlocProvider(
//         providers: [
//           BlocProvider(
//             create: (context) => FViewerBloc(
//               imagesRepository:
//                   RepositoryProvider.of<ImagesRepository>(context),
//             ),
//           ),
//         ],
//         child: MaterialApp(
//             title: 'Flickr Viewer',
//             theme: darkTheme,
//             home: const Scaffold(
//               body: SafeArea(
//                 child: GalleryScreen(),
//               ),
//             )
//             // routes: routes,
//             ),
//       ),
//     );
//   }
// }
//
// class FlickrViewerApp extends StatelessWidget {
//   const FlickrViewerApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flickr Viewer',
//         theme: darkTheme,
//         home: BlocProvider(
//           create: (context) => FViewerBloc(
//             imagesRepository: RepositoryProvider.of<ImagesRepository>(context),
//           ),
//           child: const GalleryScreen(),
//         ));
//   }
// }

// class FlickrViewerApp extends StatelessWidget {
//   const FlickrViewerApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flickr Viewer',
    //   theme: darkTheme,
    //   home: MultiRepositoryProvider(
     return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<GalleryRepository>(
              create: (context) => GalleryRepository()),
          RepositoryProvider<FavsRepository>(
              create: (context) => FavsRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<GalleryBloc>(
              create: (BuildContext context) => GalleryBloc(
                galleryRepository: context.read<GalleryRepository>(),
              ),
            ),
            // BlocProvider<FavsBloc>(
            //   create: (BuildContext context) => FavsBloc(
            //     // favsRepository: context.read<FavsRepository>(),
            //   ),
            // ),
          ],
          child: MaterialApp(
            title: 'Flickr Viewer',
              theme: darkTheme,
            home: const HomePage(),
          ),
          // const HomePage(),
        ),
      // );
    );
  }
}
