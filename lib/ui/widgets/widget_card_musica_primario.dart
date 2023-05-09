import 'package:flutter/material.dart';
import 'package:projeto_nw/data/database/cantor_database_helper.dart';
import 'package:projeto_nw/entities/cantor.dart';
import 'package:projeto_nw/entities/musica.dart';
import 'package:projeto_nw/util/app_colors.dart';

class CardMusicaPrimario extends StatelessWidget {

  Musica? musica;

  String? nomeDaMusica;
  String? nomeDoAutor;
  String? tomDaMusica;
  int? idCantor;

  CardMusicaPrimario({this.nomeDaMusica, this.nomeDoAutor, this.tomDaMusica, this.idCantor});

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
          child: ListTile(
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
              future: CantorDatabaseHelper.instance.getCantorById(idCantor!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final cantor = snapshot.data;
                  return Text('Solo: ${cantor?.nome }',style: TextStyle(color: AppColors.backgroundColor, fontFamily: 'Varela') ,textAlign: TextAlign.end,);
                } else if (snapshot.hasError) {
                  return Text('Erro ao carregar o nome do cantor');
                } else {
                  return Text('Carregando...');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
