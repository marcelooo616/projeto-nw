import 'package:path/path.dart';
import 'package:projeto_nw/models/interfaces/manipulador_database.dart';
import 'package:projeto_nw/models/data/database/cantor_campos.dart';
import 'package:sqflite/sqflite.dart';

class CantorDatabase implements ManipuladorDatabase {
  static final CantorDatabase instance = CantorDatabase._init();

  CantorDatabase._init();

  Database? _database;

  final tabelaCantor = 'cantor';

  @override
  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'cantor.tb');
    return await openDatabase(path, version: 1, onCreate: onCreate);
  }

  @override
  Future<void> criarTabela(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    await db.execute('''
        CREATE TABLE $tabelaCantor (
        ${CantorCampos.id} $idType,
        ${CantorCampos.nome} $textType,
        ${CantorCampos.idade} $textType,
        ${CantorCampos.tomCanto} $textType,
        ${CantorCampos.classificacaoVocal} $textType
        )
    ''');
  }

  @override
  void onCreate(Database db, int version) async {
    await criarTabela(db, 1);
  }

  @override
  Future<Database> get database async {
    if (_database == null){
      _database = await initDB();
    }
      return _database!;
  }

  @override
  Future<int> insert(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert(tabelaCantor, row);
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
  Future<void> atualizarTabela(Database db,int oldVersion, int newVersion) async {}

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
    db.close();
  }





}