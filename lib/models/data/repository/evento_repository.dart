import 'package:flutter/material.dart';
import 'package:projeto_nw/models/data/database/evento_campos.dart';
import 'package:projeto_nw/models/data/database/evento_database_helper.dart';
import 'package:projeto_nw/models/entities/evento.dart';
import 'package:projeto_nw/models/interfaces/manipulador_repository.dart';
import 'package:sqflite/sqflite.dart';

class EventoRepository {

  static final EventoRepository instance = EventoRepository._init();
  EventoRepository._init();

  final helper = EventoDatabaseHelper.instance;

  Future<Evento?> adicionarEvento(Evento evento) async {
    print('adddddd');
    final Database db = await helper.database;
    print('adddddd');
    await db.insert(EventoDatabaseHelper.instance.tabelaEvento, evento.toMap());
  }

  @override
  Future<List<Evento>> adicionarItem({
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
        tabela ?? EventoDatabaseHelper.instance.tabelaEvento,

      );
      print('object');
      return List.generate(maps.length, (index) => Evento.fromMap(maps[index]));
    } catch (e) {
      print('object');
      print('Erro ao buscar objetos: $e');
      throw Exception('Erro ao buscar objetos');
    }
  }

  Future<void> deletarEvento(int id) async {
    final Database db = await helper.database;
    await db.delete(
      EventoDatabaseHelper.instance.tabelaEvento,
      where: '${EventoCampos.id} = ?',
      whereArgs: [id],
    );
  }
  @override
  Future<List<Evento>> retornarTodos({
    String? tabela,
    List<String>? colunas,
    String? clausulaWhere,
    List<dynamic>? valoresWhere,
    String? clausulaOrderBy,
    int? limite,
  }) async {
    try {
      print('object');
      final db =  await helper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        tabela ?? EventoDatabaseHelper.instance.tabelaEvento,
        columns: colunas,
        where: clausulaWhere,
        whereArgs: valoresWhere,
        orderBy: clausulaOrderBy,
        limit: limite,
      );
      print('object');
      return List.generate(maps.length, (index) => Evento.fromMap(maps[index]));
    } catch (e) {
      print('object');
      print('Erro ao buscar objetos: $e');
      throw Exception('Erro ao buscar objetos');
    }
  }

  @override
  Future<List<Evento>> buscaComFiltro({
    String? tabela,
    List<String>? colunas,
    String? clausulaWhere,
    List<dynamic>? valoresWhere,
    String? clausulaOrderBy,
    int? limite,
  }) async {
    try {
      final db = await  helper.database;
      final List<Map<String, dynamic>> maps = await db.query(
          tabela ?? EventoDatabaseHelper.instance.tabelaEvento,
          columns: colunas,
          where: clausulaWhere,
          whereArgs: valoresWhere,
          orderBy: clausulaOrderBy,
          limit: limite
      );
      return List.generate(maps.length, (index) => Evento.fromMap(maps[index]));
    } catch (error) {
      print('Erro ao buscar objetos: $error');
      throw Exception('Erro ao buscar objetos');
    }

  }

  /*Future<List<Evento>> buscarTodosEvento() async {
    final Database db = await helper.database;
    // Buscar todos os ensaios na tabela.
    final List<Map<String, dynamic>> maps = await db.query(EventoDatabaseHelper.instance.tabelaEvento,);
    // Converter os mapas em objetos Ensaio e retorná-los como uma lista.
    return List.generate(maps.length, (i) {
      return Evento.fromMap(maps[i]);
    });
  }*/


}