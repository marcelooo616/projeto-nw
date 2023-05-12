import 'package:sqflite/sqflite.dart';
abstract class ManipuladorDatabase {

  Future<Database> initDB(); // para inicializar o banco de dados.

  Future<void> criarTabela(Database db, int version); //para criar uma tabela no banco de dados.
  void onCreate(Database db, int version);// chamado quando o banco de dados é criado pela primeira vez.

  Future<Database> get database; //para obter uma instância do banco de dados.

  Future<int> insert(Map<String, dynamic> row);// para inserir um registro na tabela.

  Future<int> delete(String table, String where, List<dynamic> whereArgs); //utilizado para excluir registros de uma tabela do banco de dados.

  Future<int> update(String table, Map<String, dynamic> row, String where,List<dynamic> whereArgs);

  Future<List<Map<String, dynamic>>> query(String table); //utilizado para fazer uma consulta

  // método opcional
  Future<void> atualizarTabela(Database db,int oldVersion, int newVersion) async {} // para atualizar as tabelas se necessario.

  Future<Database?> dropDB();//para excluir o banco de dados.

  Future<void> close();


}