import 'package:projeto_nw/models/data/database/ensaio_campos.dart';
import 'package:projeto_nw/models/data/database/ensaio_database_helper.dart';
import 'package:projeto_nw/models/entities/ensaio.dart';
import 'package:projeto_nw/models/interfaces/manipulador_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class EnsaioRepository  {
  @override
  late Database database;

  /*
  *
  * Classe responsavel pela operações de CRUD
  *
  *
  * */
  static final EnsaioRepository instance = EnsaioRepository._init();

  EnsaioRepository._init();

  final helper = EnsaioDatabase.instance;

  Future<Ensaio> adicionarEnsaio(Ensaio ensaio) async {
    try {
      final db = await helper.database;
      await db.insert(
        EnsaioDatabase.instance.tableEnsaio,
        ensaio.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return ensaio;
    } catch (e) {
      // Tratar erros ou exceções, se necessário
      print('Erro ao adicionar cantor: $e');
      throw Exception('Erro ao adicionar o cantor');
    }
  }

  Future<void> s(int id) async {
    final Database db = await helper.database;
    await db.delete(
      EnsaioDatabase.instance.tableEnsaio,
      where: '${EnsaioCampos.id} = ?',
      whereArgs: [id],
    );
  }

  Future<void> deletarEnsaio(int id) async {
    try {
      final db = await helper.database;
      await db.delete(
        EnsaioDatabase.instance.tableEnsaio,
        where: '${EnsaioCampos.id} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Erro ao deletar o ensaio: $e');
      throw Exception('Erro ao deletar o ensaio');
    }
  }

  Future<void> atualizarEnsaio(Ensaio ensaio) async {
    try {
      final db = await helper.database;
      await db.update(
        EnsaioDatabase.instance.tableEnsaio,
        ensaio.toMap(),
        where: '${EnsaioCampos.id} = ?',
        whereArgs: [ensaio.id],
      );
    } catch (e) {
      print('Erro ao atualizar o ensaio: $e');
      throw Exception('Erro ao atualizar o ensaio');
    }
  }

  Future<List<Ensaio>> buscarTodosEsnsaio() async {
    final Database db = await helper.database;
    // Buscar todos os ensaios na tabela.
    final List<Map<String, dynamic>> maps = await db.query(
      EnsaioDatabase.instance.tableEnsaio,
    );
    // Converter os mapas em objetos Ensaio e retorná-los como uma lista.
    return List.generate(maps.length, (i) {
      return Ensaio.fromMap(maps[i]);
    });
  }

  /* @override
  Future<List<Ensaio>> retornarTodos() async {
    try {
      final List<Map<String, dynamic>> maps = await database.query(EnsaioDatabase.instance.tableEnsaio);
      return List.generate(maps.length, (index) => Ensaio.fromMap(maps[index]));
    } catch (e) {
      print('Erro ao buscar todos os ensaios: $e');
      throw Exception('Erro ao buscar todos os ensaios');
    }
  }

  @override
  Future<List<Ensaio>> retoxrnarTodos() async {
      final Database db = await helper.database;
      final List<Map<String, dynamic>> maps = await db.query(EnsaioDatabase.instance.tableEnsaio);
      return List.generate(maps.length, (index) => Ensaio.fromMap(maps[index]));

  }*/

 /* @override
  Future<Ensaio> adicionarItem({
    String? tabela,
    Object? item,
    List<String>? colunas,
    String? clausulaWhere,
    List<dynamic>? valoresWhere,
    String? clausulaOrderBy,
    int? limite,
  }) async {
    try {
      print('object');
      final db = await helper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        tabela ?? EnsaioDatabase.instance.tableEnsaio,

      );
      print('object');
     // return List.generate(maps.length, (index) => Ensaio.fromMap(maps[index]));
    } catch (e) {
      print('object');
      print('Erro ao buscar objetos: $e');
      throw Exception('Erro ao buscar objetos');
    }
  }*/

  @override
  Future<List<Ensaio>> retornarTodos({
    String? tabela,
    List<String>? colunas,
    String? clausulaWhere,
    List<dynamic>? valoresWhere,
    String? clausulaOrderBy,
    int? limite,
  }) async {
    try {
      print('object');
      final db = await helper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        tabela ?? EnsaioDatabase.instance.tableEnsaio,
        columns: colunas,
        where: clausulaWhere,
        whereArgs: valoresWhere,
        orderBy: clausulaOrderBy,
        limit: limite,
      );
      print('object');
      return List.generate(maps.length, (index) => Ensaio.fromMap(maps[index]));
    } catch (e) {
      print('object');
      print('Erro ao buscar objetos: $e');
      throw Exception('Erro ao buscar objetos');
    }
  }

  @override
  Future<List<Ensaio>> buscaComFiltro({
    String? tabela,
    List<String>? colunas,
    String? clausulaWhere,
    List<dynamic>? valoresWhere,
    String? clausulaOrderBy,
    int? limite,
  }) async {
    try {
      final db = await helper.database;
      final List<Map<String, dynamic>> maps = await db.query(
          tabela ?? EnsaioDatabase.instance.tableEnsaio,
          columns: colunas,
          where: clausulaWhere,
          whereArgs: valoresWhere,
          orderBy: clausulaOrderBy,
          limit: limite);
      return List.generate(maps.length, (index) => Ensaio.fromMap(maps[index]));
    } catch (error) {
      print('Erro ao buscar objetos: $error');
      throw Exception('Erro ao buscar objetos');
    }
  }

  Future<List<Ensaio>> buscarTodosEnsaio() async {
    try {
      final db = await helper.database;
      final List<Map<String, dynamic>> maps =
          await db.query(EnsaioDatabase.instance.tableEnsaio);
      return List.generate(maps.length, (index) => Ensaio.fromMap(maps[index]));
    } catch (e) {
      print('Erro ao buscar todos os ensaios: $e');
      throw Exception('Erro ao buscar todos os ensaios');
    }
  }

  Future<Map<String, dynamic>> buscarEnsaioPorId(int id) async {
    try {
      final db = await helper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        EnsaioDatabase.instance.tableEnsaio,
        where: '${EnsaioCampos.id} = ?',
        whereArgs: [id],
      );
      if (maps.isNotEmpty) {
        return maps.first;
      }
      throw Exception("Ensaio não encontrado");
    } catch (e) {
      print('Erro ao buscar o ensaio por ID: $e');
      throw Exception('Erro ao buscar o ensaio por ID');
    }
  }
}
