import 'package:flickr_viewer/database/database.dart';
import 'package:flickr_viewer/models/image_model.dart';

class DatabaseController{
  final dbClient = DatabaseProvider.dbProvider;

  Future<int> createFavImage(ImageModel favImage) async {
    // Map<String,dynamic> res = {
    //   'id': favImage.id,
    //   'fullUrl': favImage.fullUrl,
    //   'title': favImage.title,
    // };
    final db = await dbClient.db;
    var result = db.insert("imagesTable", favImage.toJSON());
    return result;
  }

  Future<List<ImageModel>> getAllFavImages({List<String>? columns}) async {
    final db = await dbClient.db;
    var result = await db.query("imagesTable",columns: columns);
    List<ImageModel> favImages = result.isNotEmpty ? result.map((item) => ImageModel.fromJson(item)).toList() : [];
    return favImages;
  }

  Future<int> deleteFavImage(int id) async {
    final db = await dbClient.db;
    var result = await db.delete("imagesTable", where: 'id = ?', whereArgs: [id]);

    return result;
  }
}
