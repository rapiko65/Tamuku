import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('guest.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE guests (
        id $idType,
        name $textType,
        address $textType,
        date $textType
      )
    ''');
  }

  Future<int> addGuest(String name, String address, String date) async {
    final db = await instance.database;

    return await db.insert('guests', {
      'name': name,
      'address': address,
      'date': date,
    });
  }

  Future<List<Map<String, dynamic>>> getGuests() async {
    final db = await instance.database;

    return await db.query('guests', orderBy: 'id DESC');
  }

  Future<Map<String, int>> getGuestCountPerDay() async {
    final db = await instance.database;

    final List<Map<String, dynamic>> result = await db.rawQuery('''
      SELECT strftime('%Y-%m-%d', date) as day, COUNT(*) as count
      FROM guests
      GROUP BY strftime('%Y-%m-%d', date)
      ORDER BY day ASC
    ''');

    return {for (var row in result) row['day']: row['count']};
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
