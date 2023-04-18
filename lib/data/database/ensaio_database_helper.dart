
import 'package:projeto_nw/data/database/ensaio_campos.dart';
import 'package:projeto_nw/interfaces/manipulador_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class EnsaioDatabaseHelper implements ManipuladorDatabase {
  static final EnsaioDatabaseHelper instance = EnsaioDatabaseHelper._();

  Database? _database;
  final tableEnsaio = 'ensaios';

  EnsaioDatabaseHelper._();

  @override
  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'ensaios.db');

    return await openDatabase(path, version: 1, onCreate: criarTabela);
  }

  @override
  Future<void> criarTabela(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    await db.execute('''
      CREATE TABLE $tableEnsaio (
        ${EnsaioFields.id} $idType,
        ${EnsaioFields.titulo} $textType,
        ${EnsaioFields.data} $textType,
        ${EnsaioFields.horario} $textType,
        ${EnsaioFields.participantes} $textType,
        ${EnsaioFields.repertorio} $textType
      )
    ''');
  }

  @override
  void onCreate(Database db, int version) {}

  @override
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database!;
  }

  @override
  Future<int> insert(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert(tableEnsaio, row);
  }

  @override
  Future<int> delete(String table, String where, List<dynamic> whereArgs) async {
    final db = await database;
    return await db.delete(table, where: where, whereArgs: whereArgs);
  }

  @override
  Future<int> update(String table, Map<String, dynamic> row, String where,List<dynamic> whereArgs) async {
    final db = await database;
    return await db.update(table, row, where: where, whereArgs: whereArgs);
  }

  @override
  Future<List<Map<String, dynamic>>> query(String table) async {
    final db = await database;
    return await db.query(table);
  }

  @override
  Future<void> atualizarTabela(Database db, int oldVersion, int newVersion) async {}

  @override
  Future<Database?> dropDB() async {
    final db = await database;
    await db.close();
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'ensaios.db');
    await deleteDatabase(path);
    return null;
  }

  @override
  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}

