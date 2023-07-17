import 'package:flickr_viewer/screens/gallery_screen.dart';
import 'package:flickr_viewer/screens/info_screen.dart';
import 'package:flickr_viewer/screens/favorites_screen.dart';

final routes = {
  '/': (context) => const GalleryScreen(),
  '/info': (context) => const InfoScreen(),
  '/favorites': (context) => const FavoritesScreen(),
};
