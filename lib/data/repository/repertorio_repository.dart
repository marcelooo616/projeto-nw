import 'package:projeto_nw/data/database/repertorio_campos.dart';
import 'package:projeto_nw/data/database/repertorio_database_helper.dart';
import 'package:projeto_nw/entities/repetorio.dart';
import 'package:sqflite/sqflite.dart';

class RepertorioRepository {
  static final RepertorioRepository instance = RepertorioRepository._init();
  RepertorioRepository._init();

  final helper = RepertorioDatabaseHelper.instance;

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