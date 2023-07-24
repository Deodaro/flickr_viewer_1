import 'package:flickr_viewer/database/database_controller.dart';
import 'package:flickr_viewer/models/image_model.dart';

class FavsRepository{
  final DatabaseController dbController = DatabaseController();

  Future getAllFavImages() => dbController.getAllFavImages();

  Future insertFavImage(ImageModel favImage) => dbController.createFavImage(favImage);

  Future deleteFavImage(int index) => dbController.deleteFavImage(index);
}
