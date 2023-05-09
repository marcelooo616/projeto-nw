import 'package:flutter/material.dart';
import 'package:projeto_nw/util/app_colors.dart';

class CardMenbroINT extends StatelessWidget {
  String? nome;
  String? tomDeCanto;
  String? idade;
  String? classificacaoVocal;


  CardMenbroINT({this.nome, this.tomDeCanto, this.idade, this.classificacaoVocal});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 180,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(

      ),
      child: Card(
        color: AppColors.secondaryColor,
        elevation: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage('assets/images/nw.jpg'),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.1 + 50,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor, // cor da bolinha
                          shape: BoxShape.circle, // forma da bolinha
                        ),
                      ),
                      SizedBox(width: 10), // espaço entre a bolinha e o texto
                      Text('Nome: $nome', style: TextStyle(color: AppColors.backgroundColor),),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor, // cor da bolinha
                          shape: BoxShape.circle, // forma da bolinha
                        ),
                      ),
                      SizedBox(width: 10), // espaço entre a bolinha e o texto
                      Text('Idade:\ $idade', style: TextStyle(color: AppColors.backgroundColor),),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor, // cor da bolinha
                          shape: BoxShape.circle, // forma da bolinha
                        ),
                      ),
                      SizedBox(width: 10), // espaço entre a bolinha e o texto
                      Text('Tom de canto:\ $tomDeCanto', style: TextStyle(color: AppColors.backgroundColor),),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,// cor da bolinha
                          shape: BoxShape.circle, // forma da bolinha
                        ),
                      ),
                      SizedBox(width: 10), // espaço entre a bolinha e o texto
                      Text('Classificaçõa:\ $classificacaoVocal', style: TextStyle(color: AppColors.backgroundColor),),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
