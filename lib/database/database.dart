import 'package:news/constants/constants.dart';
import 'package:news/model/database_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBHelper{

  static final DBHelper _dbHelper = DBHelper._init();
  DBHelper._init();
  factory DBHelper() => _dbHelper;

  static Database? _database;
  get database async => _database ??= await initializeDb();

  initializeDb()async{
    var dbPath = await getApplicationDocumentsDirectory();
    String path = join(dbPath.path, "articles.db");
    Database db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version)async{
    return await db.execute('''
    CREATE TABLE articles(
    $kTitle TEXT,
    $kContent TEXT,
    $kUrlToImage TEXT,
    $kPublishedAt TEXT,
    $kName TEXT
    )
    ''');
  }

  insert(DbModel model)async{
    Database db = await database;
    return await db.insert("articles", model.toMap());
  }

  fetch()async{
    Database db = await database;
    List list = await db.query("articles");
    return List.from(list).map((e) => DbModel.fromMap(e)).toList();
  }

  empty()async{
    Database db = await database;
    await db.delete("articles");
  }
}