// import 'package:cached_network_image/cached_network_image.dart';
// // import 'package:flickr_viewer/bloc/gallery/gallery_bloc.dart';
// // import 'package:flickr_viewer/models/image_model.dart';
// // import 'package:flickr_viewer/screens/full_view_screen.dart';
//
// import 'package:flickr_viewer/models/image_model.dart';
// // import 'package:flickr_viewer/screens/full_view_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// //
// // class ImageCard extends StatelessWidget {
// //   const ImageCard({
// //     super.key,
// //     required this.photo
// //   });
// //
// //   final ImageModel photo;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // return Text(photo.title);
// //     return Image.network(photo.url);
// //     return GestureDetector(
// //       onTap: () {
// //         // Navigator.push(
// //         //     context,
// //         //     MaterialPageRoute(
// //         //       builder: (_) => FullViewScreen(
// //         //         photo: photo,
// //         //       ),
// //         //     ),
// //         // );
// //         // Navigator.pushNamed(
// //         //   context,
// //         //   FullViewScreen.routeName,
// //         //   arguments: ScreenArguments(photo.url),
// //         // );
// //       },
// //       child: CachedNetworkImage(
// //         placeholder: (context, url) => const Placeholder(),
// //         imageUrl: photo.url,
// //       ),
// //     );
// //   }
// // }
//
// class ImageCard extends StatelessWidget {
//   // const ImageCard({super.key});
//   const ImageCard({super.key, required this.image});
//
//   final ImageModel image;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder(builder: (context, state) {
//     }
//   })
//   }
//     // return BlocConsumer<GalleryBloc, GalleryState>(
//     //   listener: (context, state) {},
//     //   builder: (context, state) {
//     //     return BlocProvider.value(
//     //       value: BlocProvider.of<GalleryBloc>(context),
//     //       child: FullViewScreen(image: image),
//     //     );
//     //     return BlocBuilder(
//
//         // ) GestureDetector(
//         //   onTap: () {
//         //     Navigator.of(context).push(
//         //       MaterialPageRoute<FullViewScreen>(
//         //         builder: (context) {
//         //           return BlocProvider.value(
//         //             value: BlocProvider.of<GalleryBloc>(context),
//         //             child: FullViewScreen(image: image),
//         //           );
//         //         },
//         //       ),
//         //     );
//             // Navigator.push(
//             //     context,
//             //     MaterialPageRoute(
//             //       builder: (_) => FullViewScreen(
//             //         image: image,
//             //       ),
//             //     ),
//             // );
//           // },
//           // child: CachedNetworkImage(
//           //   placeholder: (context, url) => const Placeholder(),
//           //   imageUrl: image.url,
//           // ),
//         // );
//       // },
//     // );
//   // }
// // }
//     // return const Placeholder();
//     // return GestureDetector(
//     //   onTap: () {
//     //     Navigator.of(context).push(
//     //       MaterialPageRoute<FullViewScreen>(
//     //         builder: (context) {
//     //           return BlocProvider.value(
//     //             value: galleryBloc,
//     //             child: CounterPage(),
//     //           );
//     //         },
//     //       ),
//     //     );
//         // Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //       builder: (_) => FullViewScreen(
//         //         image: image,
//         //       ),
//         //     ),
//         // );
//       // },
//       // child: CachedNetworkImage(
//       //   placeholder: (context, url) => const Placeholder(),
//       //   imageUrl: image.url,
//       // ),
//     // );
//   // }
// // }
