import 'package:projeto_nw/models/data/database/cantor_campos.dart';
import 'package:projeto_nw/models/data/database/cantor_database_helper.dart';
import 'package:projeto_nw/models/entities/cantor.dart';
import 'package:projeto_nw/models/interfaces/manipulador_repository.dart';
import 'package:sqflite/sqflite.dart';

class CantorRepository implements ManipuladorRepository<Cantor>{
  /*
  *
  * Classe responsavel pela operações de CRUD
  *
  *
  * */

  static final CantorRepository instance = CantorRepository._init();
  CantorRepository._init();

  static final CantorDatabase cantorHelper = CantorDatabase.instance;
  //static final CantorDatabaseHelper _databaseHelper = CantorDatabaseHelper.instance;

  /*Future<Cantor> adicionarCantor(Cantor cantor) async {
    try {
      final db = await cantorHelper.database;
      await db.insert(
        CantorDatabase.instance.tabelaCantor,
        cantor.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return cantor;
    } catch (e) {
      // Tratar erros ou exceções, se necessário
      print('Erro ao adicionar cantor: $e');
      throw Exception('Erro ao adicionar o cantor');
    }
  }*/

  @override
  Future<Cantor> adicionarItem(Cantor item) async {
    try {
      print('object');
      final db = await  cantorHelper.database;
       await db.insert(
         CantorDatabase.instance.tabelaCantor,
         item.toMap(),
         conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print('object');
      return item;
    } catch (error) {
      print('object');
      print('Erro ao buscar objetos: $error');
      throw Exception('Erro ao buscar objetos');
    }
  }

  @override
  Future<void> deletarItem({String? clausulaWhere,List<dynamic>? valoresWhere,}) async {
    try {
      print('object');
      final db = await  cantorHelper.database;
       await db.delete(
         CantorDatabase.instance.tabelaCantor,
         where: 'id = ?',
         whereArgs: valoresWhere,
      );
    } catch (error) {
      print('Erro ao deletar  objeto: $error');
      throw Exception('Erro ao deletar objetos');
    }
  }

  @override
  Future<List<Cantor>> retornarTodos({String? tabela, List<String>? colunas, String? clausulaWhere, List<dynamic>? valoresWhere, String? clausulaOrderBy, int? limite,}) async {
    try {
      print('object');
      final db = await cantorHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        tabela ?? CantorDatabase.instance.tabelaCantor,
        columns: colunas,
        where: clausulaWhere,
        whereArgs: valoresWhere,
        orderBy: clausulaOrderBy,
        limit: limite,
      );
      print('object');
      return List.generate(maps.length, (index) => Cantor.fromMap(maps[index]));
    } catch (e) {
      print('object');
      print('Erro ao buscar objetos: $e');
      throw Exception('Erro ao buscar objetos');
    }
  }

  @override
  Future<Cantor> atualizarItem({Cantor? item, String? clausulaWhere,List<dynamic>? valoresWhere,}) async {
    try {
      print('object');
      final db = await  cantorHelper.database;
      await db.update(
        CantorDatabase.instance.tabelaCantor,
        item!.toMap(),
        where: 'id = ?',
        whereArgs: valoresWhere,
      );
      return item;
    } catch (error) {
      print('Erro ao deletar  objeto: $error');
      throw Exception('Erro ao deletar objetos');
    }
  }

  @override
  Future<List<Cantor>> buscaComFiltro({String? tabela, List<String>? colunas, String? clausulaWhere, List<dynamic>? valoresWhere, String? clausulaOrderBy, int? limite,}) async {
    try {
      final db = await cantorHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
          tabela ?? CantorDatabase.instance.tabelaCantor,
        columns: colunas,
        where: clausulaWhere,
        whereArgs: valoresWhere,
        orderBy: clausulaOrderBy,
        limit: limite
      );
      return List.generate(maps.length, (index) => Cantor.fromMap(maps[index]));
    } catch (error) {
      print('Erro ao buscar objetos: $error');
      throw Exception('Erro ao buscar objetos');
    }

}

  @override
  Future<Cantor> buscaPorId({String? tabela, List<String>? colunas, String? clausulaWhere, List<dynamic>? valoresWhere, String? clausulaOrderBy, int? limite,}) async {
    try {
      final db = await cantorHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
          tabela ?? CantorDatabase.instance.tabelaCantor,
          columns: colunas,
          where: clausulaWhere,
          whereArgs: valoresWhere,
          orderBy: clausulaOrderBy,
          limit: limite
      );
      return  Cantor.fromMap(maps.first);
    } catch (error) {
      print('Erro ao buscar objetos: $error');
      throw Exception('Erro ao buscar objetos');
    }

  }

  @override
  Future<List<Cantor>> buscaPorListaDeIds({String? tabela, List<String>? colunas, String? clausulaWhere, List<dynamic>? valoresWhere, String? clausulaOrderBy, int? limite, List<int>? ids}) async {
    try {
      final db = await cantorHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
          tabela ?? CantorDatabase.instance.tabelaCantor,
          columns: colunas,
          where:  '${CantorCampos.id} IN (${ids!.map((id) => '?').join(', ')})',
          whereArgs: ids,
          orderBy: clausulaOrderBy,
          limit: limite
      );
      return  List.generate(maps.length, (index) => Cantor.fromMap(maps[index]));
    } catch (error) {
      print('Erro ao buscar objetos: $error');
      throw Exception('Erro ao buscar objetos');
    }

  }

/*Future<void> deletarCantor(int id) async {
    try {
      final db = await cantorHelper.database;
      await db.delete(
        CantorDatabase.instance.tabelaCantor,
        where: '${CantorCampos.id} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Erro ao deletar o ensaio: $e');
      throw Exception('Erro ao deletar o ensaio');
    }
  }

 Future<void> atualizarEnsaio(Cantor cantor) async {
    try {
      final db = await cantorHelper.database;
      await db.update(
        CantorDatabase.instance.tabelaCantor,
        cantor.toMap(),
        where: '${CantorCampos.id} = ?',
        whereArgs: [cantor.id],
      );
    } catch (e) {
      print('Erro ao atualizar o ensaio: $e');
      throw Exception('Erro ao atualizar o ensaio');
    }
  }
  Future<List<Cantor>> buscarTodosOsCantores() async {
    try {
      final db = await cantorHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(CantorDatabase.instance.tabelaCantor);
      return List.generate(maps.length, (index) => Cantor.fromMap(maps[index]));
    } catch (e) {
      print('Erro ao buscar todos os ensaios: $e');
      throw Exception('Erro ao buscar todos os ensaios');
    }
  }

 /Future<List<Cantor>> buscarCantoresPorIds(List<int> ids) async {
    final Database db = await cantorHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      cantorHelper.tabelaCantor,
      where: '${CantorCampos.id} IN (${ids.map((id) => '?').join(', ')})',
      whereArgs: ids,
    );
    return List.generate(maps.length, (index) => Cantor.fromMap(maps[index]));

    }*/
  }



