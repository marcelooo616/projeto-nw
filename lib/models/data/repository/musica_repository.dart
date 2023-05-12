
import 'package:projeto_nw/models/data/database/musica_campos.dart';
import 'package:projeto_nw/models/data/database/musica_database_helper.dart';
import 'package:projeto_nw/models/interfaces/manipulador_repository.dart';
import 'package:projeto_nw/models/entities/musica.dart';
import 'package:sqflite/sqflite.dart';

class MusicaRepository {
  /*
  *
  * Classe responsavel pela operações de CRUD
  *
  *
  * */

  static final MusicaRepository instance = MusicaRepository._init();
  MusicaRepository._init();
  final musicaHelper = MusicaDatabaseHelper.instance;
  static final MusicaDatabaseHelper _databaseHelper = MusicaDatabaseHelper.instance;

  Future<Musica?> adicionarMusica(Musica musica) async {
    final Database db = await musicaHelper.database;
    await db.insert(MusicaDatabaseHelper.instance.tabelaMusicas, musica.toMap());
  }



 /* Future<List<Musica>> listaTodasAsMusicas() async {
    print('musicassss');
    final Database db = await musicaHelper.database;
    // Buscar todos os ensaios na tabela.
    final List<Map<String, dynamic>> maps = await db.query(MusicaDatabaseHelper.instance.tabelaMusicas,);
    // Converter os mapas em objetos Ensaio e retorná-los como uma lista.
    return List.generate(maps.length, (i) {
      return Musica.fromMap(maps[i]);
    });
  }*/

  @override
  Future<List<Musica>> adicionarItem({
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
      final db = await  musicaHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        tabela ?? MusicaDatabaseHelper.instance.tabelaMusicas,

      );
      print('object');
      return List.generate(maps.length, (index) => Musica.fromMap(maps[index]));
    } catch (e) {
      print('object');
      print('Erro ao buscar objetos: $e');
      throw Exception('Erro ao buscar objetos');
    }
  }

  @override
  Future<List<Musica>> retornarTodos({
    String? tabela,
    List<String>? colunas,
    String? clausulaWhere,
    List<dynamic>? valoresWhere,
    String? clausulaOrderBy,
    int? limite,
  }) async {
    try {

      final db = await musicaHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        tabela ?? MusicaDatabaseHelper.instance.tabelaMusicas,
        columns: colunas,
        where: clausulaWhere,
        whereArgs: valoresWhere,
        orderBy: clausulaOrderBy,
        limit: limite,
      );
      print('object');
      return List.generate(maps.length, (index) => Musica.fromMap(maps[index]));
    } catch (e) {
      print('object');
      print('Erro ao buscar objetos: $e');
      throw Exception('Erro ao buscar objetos');
    }
  }

  @override
  Future<List<Musica>> buscaComFiltro({
    String? tabela,
    List<String>? colunas,
    String? clausulaWhere,
    List<dynamic>? valoresWhere,
    String? clausulaOrderBy,
    int? limite,
  }) async {
    try {
      final db = await  musicaHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
          tabela ?? MusicaDatabaseHelper.instance.tabelaMusicas,
          columns: colunas,
          where: clausulaWhere,
          whereArgs: valoresWhere,
          orderBy: clausulaOrderBy,
          limit: limite
      );
      return List.generate(maps.length, (index) => Musica.fromMap(maps[index]));
    } catch (error) {
      print('Erro ao buscar objetos: $error');
      throw Exception('Erro ao buscar objetos');
    }

  }


  Future<List<Musica>> listaFiltrada(String lista) async {
    final Database db = await musicaHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(MusicaDatabaseHelper.instance.tabelaMusicas);
    List<int> ids = lista.split(',').map((id) => int.parse(id)).toList();
    List<Map<String, dynamic>> musicasFiltradas = maps.where((musica) => ids.contains(musica['id'])).toList();
    return List.generate(musicasFiltradas.length, (i) {
      return Musica.fromMap(musicasFiltradas[i]);
    });
  }


  Future<void> atualizarContadores(List<int> idsMusicas) async {
    final db = await _databaseHelper.database;
    final batch = db.batch();

    for (final idMusica in idsMusicas) {
      batch.rawUpdate('UPDATE ${MusicaDatabaseHelper.instance.tabelaMusicas} SET ${MusicaCampos.contador} = ${MusicaCampos.contador} + 1 WHERE ${MusicaCampos.id} = ?', [idMusica]);
    }

    await batch.commit(noResult: true);
  }

  Future<List<Musica>> buscarMusicasPorIds(List<int> ids) async {
    final Database db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      _databaseHelper.tabelaMusicas,
      where: '${MusicaCampos.id} IN (${ids.map((id) => '?').join(', ')})',
      whereArgs: ids,
    );
    return List.generate(maps.length, (i) {
      return Musica.fromMap(maps[i]);
    });
  }

  Future<void> deletarMusica(int id)async{
    final Database db = await musicaHelper.database;
    await db.delete(
      MusicaDatabaseHelper.instance.tabelaMusicas,
      where: '${MusicaCampos.id} = ?',
      whereArgs: [id],
    );
  }



}