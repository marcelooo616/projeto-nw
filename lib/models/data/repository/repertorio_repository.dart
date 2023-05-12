import 'package:projeto_nw/models/data/database/repertorio_campos.dart';
import 'package:projeto_nw/models/data/database/repertorio_database_helper.dart';

import 'package:projeto_nw/models/interfaces/manipulador_repository.dart';
import 'package:projeto_nw/models/entities/repetorio.dart';
import 'package:sqflite/sqflite.dart';

class RepertorioRepository {
  static final RepertorioRepository instance = RepertorioRepository._init();
  RepertorioRepository._init();

  final helper = RepertorioDatabaseHelper.instance;

  @override
  Future<List<Repertorio>> retornarTodos({String? tabela, List<String>? colunas, String? clausulaWhere, List<dynamic>? valoresWhere, String? clausulaOrderBy, int? limite,}) async {
    try {
      print('object');
      final db = await helper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        tabela ?? RepertorioDatabaseHelper.instance.tabelaRepertorio,
        columns: colunas,
        where: clausulaWhere,
        whereArgs: valoresWhere,
        orderBy: clausulaOrderBy,
        limit: limite,
      );
      print('object');
      return List.generate(maps.length, (index) => Repertorio.fromMap(maps[index]));
    } catch (e) {
      print('object');
      print('Erro ao buscar objetos: $e');
      throw Exception('Erro ao buscar objetos');
    }
  }

  @override
  Future<List<Repertorio>> buscaComFiltro({String? tabela, List<String>? colunas, String? clausulaWhere, List<dynamic>? valoresWhere, String? clausulaOrderBy, int? limite,}) async {
    try {
      final db = await  helper.database;
      final List<Map<String, dynamic>> maps = await db.query(
          tabela ?? RepertorioDatabaseHelper.instance.tabelaRepertorio,
          columns: colunas,
          where: clausulaWhere,
          whereArgs: valoresWhere,
          orderBy: clausulaOrderBy,
          limit: limite
      );
      return List.generate(maps.length, (index) => Repertorio.fromMap(maps[index]));
    } catch (error) {
      print('Erro ao buscar objetos: $error');
      throw Exception('Erro ao buscar objetos');
    }

  }

  Future<Repertorio?> adicionarPlaylist(Repertorio repertorio) async {
    final Database db = await helper.database;
    print('ADD PLAYLIST');
    await db.insert(RepertorioDatabaseHelper.instance.tabelaRepertorio, repertorio.toMap());
    print('[LOG - playlist ${repertorio.toMap()}');
  }

  Future<void> deletarPlaylist(int id) async {
    final Database db = await helper.database;
    await db.delete(
      RepertorioDatabaseHelper.instance.tabelaRepertorio,
      where: '${RepertorioCampos.id} = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<Repertorio>> adicionarItem({
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
        tabela ?? RepertorioDatabaseHelper.instance.tabelaRepertorio,

      );
      print('object');
      return List.generate(maps.length, (index) => Repertorio.fromMap(maps[index]));
    } catch (e) {
      print('object');
      print('Erro ao buscar objetos: $e');
      throw Exception('Erro ao buscar objetos');
    }
  }



  Future<List<Repertorio>> buscarTodasPlaylist() async {
    final Database db = await helper.database;
    // Buscar todos os ensaios na tabela.
    final List<Map<String, dynamic>> maps = await db.query(RepertorioDatabaseHelper.instance.tabelaRepertorio,);
    // Converter os mapas em objetos Ensaio e retorná-los como uma lista.

    return List.generate(maps.length, (i) {
      print('LOG - repertrio ${Repertorio.fromMap(maps[i]).playlist}');
      return Repertorio.fromMap(maps[i]);
    });
  }

  Future<Map<String, dynamic>> buscarPlaylistPorId(int id) async {
    final Database db = await helper.database;
    final List<Map<String, dynamic>> maps = await db.query(
        RepertorioDatabaseHelper.instance.tabelaRepertorio,
      where: '${RepertorioCampos.id} = ?',
      whereArgs: [id],
    ) ;
    if (maps.isNotEmpty){
      return maps.first;
    }
    throw Exception("Playlist Nã encontrada");
  }
}