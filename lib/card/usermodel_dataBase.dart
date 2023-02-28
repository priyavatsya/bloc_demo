import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/user_model.dart';

class UserDataBase {
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'users.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE planets(id INTEGER PRIMARY KEY , email TEXT NOT NULL,firstName TEXT NOT NULL,lastname TEXT NOT NULL )",
        );
      },
    );
  }

// insert data
  Future<int> insertUsers(List<UserModel> users) async {
    int result = 0;
    final Database db = await initializedDB();
    for (var user in users) {
      result = await db.insert('users', user.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    return result;
  }

// retrieve data
  Future<List<UserModel>> retrieveUsers() async {
    final Database db = await initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query('users');
    return queryResult.map((e) => UserModel.fromJson(e)).toList();
  }

// delete user
  Future<void> deleteUsers(int id) async {
    final db = await initializedDB();
    await db.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
