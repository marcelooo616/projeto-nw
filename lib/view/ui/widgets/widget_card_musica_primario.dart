import 'package:flutter/material.dart';

import 'package:projeto_nw/models/data/repository/cantor_repository.dart';
import 'package:projeto_nw/models/entities/cantor.dart';
import 'package:projeto_nw/models/entities/musica.dart';
import 'package:projeto_nw/util/color/app_colors.dart';

class CardMusicaPrimario extends StatelessWidget {

  Musica? musica;


  String? nomeDaMusica;
  String? nomeDoAutor;
  String? tomDaMusica;
  String? tomDaSolo;
  int? idCantor;


  CardMusicaPrimario({this.nomeDaMusica, this.nomeDoAutor, this.tomDaMusica, this.idCantor, this.tomDaSolo});



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
       // color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(10)
      ),
      
      child: InkWell(
        onTap: (){
          print("djflhsdlfglsdfgsd");
        },
        borderRadius: BorderRadius.circular(10),
        splashColor: AppColors.accentColor,
        child:Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFF353840),
            
          ),

          child: Column(
            children: [
              ListTile(
                title: Text(nomeDaMusica!,style: TextStyle(color: AppColors.backgroundColor, fontFamily: 'Varela')),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage('assets/images/cd.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                subtitle: Text(nomeDoAutor!,style: TextStyle(color: AppColors.backgroundColor,  fontFamily: 'Varela'),),
                trailing: FutureBuilder<Cantor?>(

                  future: CantorRepository.instance.buscaPorId(clausulaWhere: 'id = ?', valoresWhere: [idCantor]),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final cantor = snapshot.data;

                      String primeiraPalavra = cantor!.nome!;
                      String nomecantor = primeiraPalavra.split(' ')[0];
                      return Text('Solo: ${nomecantor}',style: TextStyle(color: AppColors.backgroundColor, fontFamily: 'Varela') ,textAlign: TextAlign.end,);
                    } else if (snapshot.hasError) {
                      return Text('Erro ao carregar o nome do cantor');
                    } else {
                      return Text('Carregando...');
                    }
                  },
                ),
              ),
              Container(
                width: 400,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.backgroundDarkGreen,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft:Radius.circular(15) )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Tom da musica: ${tomDaMusica!}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'varela'),),
                    FutureBuilder<Cantor?>(
                      future: CantorRepository.instance.buscaPorId(clausulaWhere: 'id = ?', valoresWhere: [idCantor]),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final cantor = snapshot.data;
                          return  Container( 
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundDark,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              
                              child: Text('Tom do solo: ${cantor!.tomCanto!}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'varela', color: AppColors.backgroundColor),));
                        } else if (snapshot.hasError) {
                          return Text('Erro ao carregar o nome do cantor');
                        } else {
                          return Text('Carregando...');
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
