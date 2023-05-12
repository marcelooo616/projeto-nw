


class Repertorio{
   int? id;
   String? titulo;
   String? descricao;
   String? primeiraCorTema;
   String? segundaCorTema;
   String? playlist;

   Repertorio({this.id,this.titulo,this.descricao,this.primeiraCorTema,this.segundaCorTema,this.playlist});

   factory Repertorio.fromMap(Map<String, dynamic> map){
      return Repertorio(
         id: map['id'],
         titulo: map['titulo'],
         descricao: map['descricao'],
         primeiraCorTema: map['primeiraCorTema'],
         segundaCorTema: map['segundaCorTema'],
         playlist: map['playlist'],

      );
   }

   Map<String, dynamic> toMap(){
      return {
         'id': id,
         'titulo' : titulo,
         'descricao' : descricao,
         'primeiraCorTema' : primeiraCorTema,
         'segundaCorTema': segundaCorTema,
         'playlist': playlist,
      };
   }




   

}