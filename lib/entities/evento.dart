

class Evento{
  int? id;
  String? titulo;
  String? tipo;
  String? data;
  String? horario;
  String? endereco;
  String? repertorio;
  String? participantes;

  Evento(
      {
      this.id,
      this.titulo,
      this.tipo,
      this.data,
      this.horario,
      this.endereco,
      this.repertorio,
      this.participantes});

  factory Evento.fromMap(Map<String, dynamic> map){
    return Evento(
      id:map['id'],
      titulo:map['titulo'],
      data:map['data'],
      horario:map['horario'],
      endereco:map['endereco'],
      participantes:map['participantes'],
      repertorio:map['repertorio'],
      tipo:map['tipo'],
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'titulo':titulo,
      'data':data,
      'horario':horario,
      'endereco':endereco,
      'participantes':participantes,
      'repertorio':repertorio,
      'tipo':tipo,
    };
  }
}