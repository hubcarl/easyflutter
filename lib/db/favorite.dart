import '../framework/database.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteDB extends DatabaseHelper {
  Future<List<Map<String, dynamic>>> getFavoriteList() async {
    Database dbClient = await db;
    return await dbClient.rawQuery('SELECT * FROM easy_favorite');
  }

  Future<int> deleteFavorite(int id) async {
    Database dbClient = await db;
    return await dbClient.rawDelete('DELETE FROM easy_favorite WHERE id = ?', [id]);
  }

  isExist(String url) async {
    Database dbClient = await db;
    List<Map> rows = await dbClient.rawQuery('SELECT * FROM easy_favorite WHERE url = ?', [url]);
    return rows.length > 0;
  }
}