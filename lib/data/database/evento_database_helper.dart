import 'package:flutter/material.dart';
import 'package:projeto_nw/data/database/evento_campos.dart';
import 'package:projeto_nw/interfaces/manipulador_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class EventoDatabaseHelper implements ManipuladorDatabase {
  static final EventoDatabaseHelper instance = EventoDatabaseHelper._init();
  EventoDatabaseHelper._init();

  static const int _versao = 3;

  Database? _database;
  final tabelaEvento = 'evento';

  @override
  Future<Database> initDB()async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'evento.tb');

    return await openDatabase(
      path,
      version: _versao,
      onCreate: criarTabela,
      onUpgrade: atualizarTabela,
    );
  }

  @override
  Future<void> criarTabela(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    await db.execute('''
      CREATE TABLE $tabelaEvento (
        ${EventoCampos.id} $idType,
        ${EventoCampos.titulo} $textType,
        ${EventoCampos.data} $textType,
        ${EventoCampos.tipo} $textType,
        ${EventoCampos.horario} $textType,
        ${EventoCampos.endereco} $textType,
        ${EventoCampos.participantes} $textType,
        ${EventoCampos.repertorio} $textType
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
    print('adddddd');
    final db = await database;
    return await db.insert(tabelaEvento, row);
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
  Future<void> atualizarTabela(Database db, int oldVersion, int newVersion) async {
    /*
    * Este método é chamado automaticamente pelo sistema quando a versão do banco de dados é atualizada.
    * Basicamente, ele verifica se a versão antiga do banco de dados é menor que a nova versão e,
    * em caso afirmativo, exclui o banco de dados antigo e cria um novo com a nova versão. Para isso,
    * ele utiliza o método "deleteDatabase" para excluir o banco de dados antigo e "criarTabela"
    * para criar o novo banco de dados com a nova versão.
    *
    * */

    if (oldVersion < newVersion) {
      print('ATUALIZANDO TABELA EVENTO!!!!!!!!!!!');
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'evento.tb');
      await deleteDatabase(path);
      await criarTabela(db, newVersion);
    }
  }

  @override
  Future<Database?> dropDB() async {
    final db = await database;
    await db.close();
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'evento.tb');
    await deleteDatabase(path);
    return null;
  }

  @override
  Future<void> close() async {
    final db = await database;
    await db.close();
  }


}