import 'package:flutter/material.dart';
import 'package:projeto_nw/models/entities/repetorio.dart';

import 'package:projeto_nw/util/color/app_colors.dart';
class CardRepertorio extends StatelessWidget {
  String? titulo;
  String? descricao;
  Color? primeiraCorTema;
  Color? segundaCorTema;
  String? rota;
  Repertorio? playlist;
 // Color? terceiraCorTema;
 // Color? quartaCorTema;


  CardRepertorio(
      {this.titulo, this.descricao, this.primeiraCorTema, this.segundaCorTema, this.rota, this.playlist});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){print('INDO PARA A DESCRIÇÃO DA PLAYLIST ${playlist?.toMap()}'); Navigator.pushNamed(context, rota!, arguments: playlist);},
      borderRadius: BorderRadius.circular(10),
      splashColor: AppColors.backgroundDarkGreen,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          //color: AppColors.backgroundDark2
        ),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: const Color(0xFF85FFBD),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:  [
                      primeiraCorTema!,
                      segundaCorTema!,
                     // terceiraCorTema!,
                     // quartaCorTema!,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 8, right: 0),
                  child:  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 16),
                      children: [
                        TextSpan(text: 'PLAY', style: TextStyle(fontSize: 40, fontFamily: 'Lato', fontWeight: FontWeight.bold)),
                        WidgetSpan(child: Divider(height:5,color: AppColors.backgroundDark,thickness: 15,indent: 10, endIndent: 40),),
                        TextSpan(text: '\n LIST ', style: TextStyle(fontSize: 40, fontFamily: 'Lato', fontWeight: FontWeight.bold,)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: 175,
             // color: AppColors.primaryColor,
              child:Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(titulo!.toUpperCase(), style: TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.bold),),
                  Text('DESCRIÇÃO: ${descricao!}', style: TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.bold, fontSize: 10),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
