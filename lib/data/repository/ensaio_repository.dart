



import 'package:projeto_nw/data/database/ensaio_campos.dart';
import 'package:projeto_nw/data/database/ensaio_database_helper.dart';
import 'package:projeto_nw/entities/ensaio.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class EnsaioDatabase {

  /*
  *
  * Classe responsavel pela operações de CRUD
  *
  *
  * */
  static final EnsaioDatabase instance = EnsaioDatabase._init();
  EnsaioDatabase._init();
  final helper = EnsaioDatabaseHelper.instance;

  Future<Ensaio?> adicionarEnsaio(Ensaio ensaio) async {
    final Database db = await helper.database;
    await db.insert(EnsaioDatabaseHelper.instance.tableEnsaio, ensaio.toMap());
  }

  Future<void> deletarEnsaio(int id) async {
    final Database db = await helper.database;
    await db.delete(
      EnsaioDatabaseHelper.instance.tableEnsaio,
      where: '${EnsaioFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<List<Ensaio>> buscarTodosEnsaio() async {
    final Database db = await helper.database;
    // Buscar todos os ensaios na tabela.
    final List<Map<String, dynamic>> maps = await db.query(EnsaioDatabaseHelper.instance.tableEnsaio,);
    // Converter os mapas em objetos Ensaio e retorná-los como uma lista.
    return List.generate(maps.length, (i) {
      return Ensaio.fromMap(maps[i]);
    });
  }

  Future<Map<String, dynamic>> buscarEnsaioPorId(int id) async {
    final Database db = await helper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      EnsaioDatabaseHelper.instance.tableEnsaio,
      where: '${EnsaioFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    }
    throw Exception("Ensaio não encontrado");
  }




}
