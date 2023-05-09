import 'package:flutter/material.dart';
import 'package:projeto_nw/entities/evento.dart';
import 'package:projeto_nw/util/app_colors.dart';
class CardEvento extends StatelessWidget {
  String? titulo;
  String? tipo;
  String? data;
  Evento? evento;


  CardEvento({this.titulo, this.tipo, this.data, this.evento});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/detalhesEvento', arguments: evento);
        print(evento!.toMap());
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 50),
        decoration: BoxDecoration(
            color: AppColors.backgroundColorCard,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          direction: Axis.horizontal,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.backgroundColor
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: AssetImage('assets/images/evento.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 200,
              height: 150,
              padding: EdgeInsets.only(bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Titulo: $titulo', style: TextStyle(color: AppColors.backgroundColor, fontFamily: 'Varela'),),
                  Text('Tipo: $tipo', style: TextStyle(color: AppColors.backgroundColor, fontFamily: 'Varela'),),
                  Text('Data: $data', style: TextStyle(color: AppColors.backgroundColor, fontFamily: 'Varela'),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
