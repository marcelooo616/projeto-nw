

class Musica{
  int? id;
  String? titulo;
  String? autor;
  String? tom;
  int? idCantorSolo;
  int? contador;

  Musica({this.id, this.titulo, this.autor, this.tom, this.idCantorSolo, this.contador});


  factory Musica.fromMap(Map<String, dynamic> map){
    return Musica(
        id: (map['id']),
        titulo: (map['titulo']),
        autor: (map['autor']),
        tom: (map['tom']),
      idCantorSolo: (map['idCantorSolo']),
      contador: (map['contador'])
    );
  }

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'id': id,
      'titulo': titulo,
      'autor': autor,
      'tom': tom,
      'idCantorSolo': idCantorSolo,

    };
  }
}