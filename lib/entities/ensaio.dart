import 'package:flutter/material.dart';
/*
*   Definir as informações que serão armazenadas para cada ensaio, como data, hora, local, nome dos participantes, repertório, etc.
*   Criar uma classe Ensaio que representa cada ensaio e que tenha as propriedades correspondentes às informações definidas no passo 1.
   Definir uma classe EnsaioRepository para realizar as operações de CRUD (create, read, update, delete) no banco de dados local.
*  Implementar os métodos da classe EnsaioRepository, utilizando o pacote sqflite para interagir com o banco de dados.
   Criar uma classe EnsaioModel que represente os dados dos ensaios a serem exibidos na tela.
*  Criar uma tela para exibir a lista de ensaios, utilizando a classe EnsaioModel para obter os dados a serem exibidos.
  Implementar a lógica para adicionar, editar e excluir ensaios na tela de lista de ensaios, utilizando a classe EnsaioRepository para realizar as operações no banco de dados.
*
* */
class Ensaio {
  int? id;
  String? titulo;
  String? data;
  String? horario;
  List<String>? participantes;
  List<String>? repertorio;


  Ensaio(
      {this.id,
      this.titulo,
      this.data,
      this.horario,
      this.participantes,
      this.repertorio});

  factory Ensaio.fromMap(Map<String, dynamic> map) {
    return Ensaio(
      id: map['id'],
      titulo: map['titulo'],
      data: map['data'],
      horario: map['horario'],
      participantes: List<String>.from(map['participantes'].split(',')),
      repertorio: List<String>.from(map['repertorio'].split(',')),
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'titulo': titulo,
      'data': data,
      'horario': horario,
      'participantes': participantes?.join(','),
      'repertorio': repertorio?.join(','),
    };
  }







}