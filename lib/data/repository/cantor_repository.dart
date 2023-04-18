import 'package:flutter/cupertino.dart';
import 'package:projeto_nw/data/database/cantor_database_helper.dart';
import 'package:projeto_nw/entities/cantor.dart';
import 'package:sqflite/sqflite.dart';

class CantorRepository {
  /*
  *
  * Classe responsavel pela operações de CRUD
  *
  *
  * */

  static final CantorRepository instance = CantorRepository._init();
  CantorRepository._init();

  static final CantorDatabaseHelper cantorHelper = CantorDatabaseHelper.instance;
  //static final CantorDatabaseHelper _databaseHelper = CantorDatabaseHelper.instance;

Future<Cantor> adicionarCantor(Cantor cantor) async{
  final Database db = await cantorHelper.database;
  await db.insert(CantorDatabaseHelper.instance.tabelaCantor, cantor.toMap());
  return cantor;
}

  Future<List<Cantor>> buscarTodosOsCantores() async {
    final Database db = await cantorHelper.database;
    // Buscar todos os ensaios na tabela.
    final List<Map<String, dynamic>> maps = await db.query(CantorDatabaseHelper.instance.tabelaCantor);
    // Converter os mapas em objetos Ensaio e retorná-los como uma lista.
    return List.generate(maps.length, (i) {
      return Cantor.fromMap(maps[i]);
    });
  }


}