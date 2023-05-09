
import 'package:projeto_nw/data/database/musica_campos.dart';
import 'package:projeto_nw/data/database/musica_database_helper.dart';
import 'package:projeto_nw/entities/musica.dart';
import 'package:sqflite/sqflite.dart';

class MusicaRepository{
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



  Future<List<Musica>> listaTodasAsMusicas() async {
    print('musicassss');
    final Database db = await musicaHelper.database;
    // Buscar todos os ensaios na tabela.
    final List<Map<String, dynamic>> maps = await db.query(MusicaDatabaseHelper.instance.tabelaMusicas,);
    // Converter os mapas em objetos Ensaio e retorná-los como uma lista.
    return List.generate(maps.length, (i) {
      return Musica.fromMap(maps[i]);
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