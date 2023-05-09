import 'package:flutter/material.dart';
import 'package:projeto_nw/data/database/evento_campos.dart';
import 'package:projeto_nw/data/database/evento_database_helper.dart';
import 'package:projeto_nw/entities/evento.dart';
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

  Future<void> deletarEvento(int id) async {
    final Database db = await helper.database;
    await db.delete(
      EventoDatabaseHelper.instance.tabelaEvento,
      where: '${EventoCampos.id} = ?',
      whereArgs: [id],
    );
  }

  Future<List<Evento>> buscarTodosEvento() async {
    final Database db = await helper.database;
    // Buscar todos os ensaios na tabela.
    final List<Map<String, dynamic>> maps = await db.query(EventoDatabaseHelper.instance.tabelaEvento,);
    // Converter os mapas em objetos Ensaio e retorná-los como uma lista.
    return List.generate(maps.length, (i) {
      return Evento.fromMap(maps[i]);
    });
  }


}