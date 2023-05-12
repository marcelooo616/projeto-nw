
import 'package:projeto_nw/models/data/database/cantor_campos.dart';
import 'package:projeto_nw/models/data/database/cantor_database_helper.dart';
import 'package:projeto_nw/models/data/database/musica_campos.dart';
import 'package:projeto_nw/models/interfaces/manipulador_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MusicaDatabaseHelper implements ManipuladorDatabase {
  static final MusicaDatabaseHelper instance = MusicaDatabaseHelper._init();
  Database? _database;

  static const int _version = 7;

  MusicaDatabaseHelper._init();

  final tabelaMusicas = 'musicas';

  /*
  * Para atualizar a estrutura do banco de dados, você precisa fazer as seguintes alterações:
  * Alterar a versão do banco de dados no código, aumentando o valor da constante _version.
  * Adicionar a nova coluna que você deseja na tabela existente no método criarTabela.
  * Implementar o método atualizarTabela na classe MusicaDatabaseHelper para fazer as alterações necessárias
  *  na estrutura do banco de dados.
  *
  * O método atualizarTabela será chamado automaticamente quando a versão do banco de dados for atualizada.
  *
  * */

  @override
  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'musicas.db');

    return await openDatabase(
      path,
      version: _version,
      onCreate: criarTabela,
      onUpgrade: atualizarTabela,
    );
  }

  @override
  Future<void> criarTabela(Database db,int version) async {
    final idType = 'INTEGER PRIMARY KEY';
    final integerType = 'INTEGER';
    final textType = 'TEXT NOT NULL';
    final textDefault = 'INTEGER NOT NULL DEFAULT 0';
    await db.execute('''
CREATE TABLE $tabelaMusicas (
  ${MusicaCampos.id} $idType,
  ${MusicaCampos.titulo} $textType,
  ${MusicaCampos.autor} $textType,
  ${MusicaCampos.tom} $textType,
  ${MusicaCampos.idCantorSolo} $integerType,
  ${MusicaCampos.contador} $textDefault,
  FOREIGN KEY (${MusicaCampos.idCantorSolo}) REFERENCES ${CantorDatabase.instance.tabelaCantor}(${CantorCampos.id})
)
    ''');
  }

  @override
  void onCreate(Database db, int version) async {
    await criarTabela(db, 1);
  }

  @override
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }
      return _database!;
  }

  @override
  Future<int> insert(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert(tabelaMusicas, row);
  }

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

  /*@override
  Future<void> atualizarTabela(Database db, int oldVersion, int newVersion) async {
    /*if (oldVersion < newVersion) {
      await db.execute('DROP TABLE IF EXISTS $tabelaMusicas');
      await _onCreate(db, newVersion);
    }*/
  }*/
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
      print('ATUALIZANDO TABELA MUSICA!!!!!!!!!!!');
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'musicas.db');
      await deleteDatabase(path);
      await criarTabela(db, newVersion);
    }
  }




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
