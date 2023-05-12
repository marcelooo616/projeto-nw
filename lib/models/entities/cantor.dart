class Cantor{
  int? id;
  String? nome;
  String? idade;
  String? tomCanto;
  String? classificacaoVocal;

  Cantor(
      {this.id, this.nome, this.idade, this.tomCanto, this.classificacaoVocal});


  factory Cantor.fromMap(Map<String, dynamic> map){
    return Cantor(
      id: (map['id']),
      nome: (map['nome']),
      idade: (map['idade']),
      tomCanto: (map['tomCanto']),
      classificacaoVocal: (map['classificacaoVocal'])
    );
  }

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'idade': idade,
      'tomCanto': tomCanto,
      'classificacaoVocal': classificacaoVocal
    };
  }
}