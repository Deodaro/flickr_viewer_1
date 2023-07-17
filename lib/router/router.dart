import 'package:flickr_viewer/screens/gallery_screen.dart';
import 'package:flickr_viewer/screens/full_view_screen.dart';
import 'package:flickr_viewer/screens/favorites_screen.dart';

final routes = {
  '/': (context) => const GalleryScreen(),
  '/full': (context) => const FullViewScreen(),
  '/favorites': (context) => const FavoritesScreen(),
};
