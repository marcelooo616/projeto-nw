
import 'package:sqflite/sqflite.dart';

abstract class ManipuladorRepository<T> {
/*
* A função retornarTodos é uma função abstrata que recebe vários parâmetros opcionais e retorna uma lista de objetos do tipo T.

Aqui está a explicação dos parâmetros:

tabela (opcional): especifica a tabela do banco de dados da qual você deseja buscar os dados. Se não for fornecido, pode ser usado um valor padrão.
colunas (opcional): uma lista de nomes de colunas específicas que você deseja retornar. Se não for fornecido, serão retornadas todas as colunas.
clausulaWhere (opcional): uma cláusula WHERE personalizada para filtrar os dados. Você pode especificar condições para limitar os resultados
* com base em certos critérios.
valoresWhere (opcional): uma lista de valores correspondentes aos marcadores de posição na cláusula WHERE. Esses valores são usados para substituir os
* marcadores de posição e executar a consulta corretamente.
clausulaOrderBy (opcional): especifica a ordenação dos resultados com base em uma
* coluna específica. Você pode ordenar os resultados em ordem crescente ou decrescente.
limite (opcional): especifica o número máximo de resultados que você deseja retornar.
*
* */
  Future<List<T>> retornarTodos({
    String? tabela,
    List<String>? colunas,
    String? clausulaWhere,
    List<dynamic>? valoresWhere,
    String? clausulaOrderBy,
    int? limite,
  });

  Future<List<T>> buscaComFiltro({
    String? tabela,
    List<String>? colunas,
    String? clausulaWhere,
    List<dynamic>? valoresWhere,
    String? clausulaOrderBy,
    int? limite,
  });

  Future<T> buscaPorId({
    String? tabela,
    List<String>? colunas,
    String? clausulaWhere,
    List<dynamic>? valoresWhere,
    String? clausulaOrderBy,
    int? limite,
  });

  Future<List<T>> buscaPorListaDeIds({
    String? tabela,
    List<String>? colunas,
    String? clausulaWhere,
    List<dynamic>? valoresWhere,
    String? clausulaOrderBy,
    int? limite,
    List<int>? ids
  });

  Future<T> adicionarItem(T item);

  Future<void> deletarItem({
    String? clausulaWhere,
    List<dynamic>? valoresWhere,
  });

  Future<T> atualizarItem({
    T? item,
    String? clausulaWhere,
    List<dynamic>? valoresWhere,
  });


}
