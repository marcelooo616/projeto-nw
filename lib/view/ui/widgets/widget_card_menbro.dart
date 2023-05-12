import 'package:flutter/material.dart';
import 'package:projeto_nw/util/color/app_colors.dart';

class CardMenbro extends StatelessWidget {

  String? nome;
  String? classificacao;


  CardMenbro({this.nome, this.classificacao});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 50),
          width: 240,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.backgroundDark
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.backgroundDarkGreen,
                      width: 13,
                    ),
                    borderRadius: BorderRadius.circular(100),

                  ),
                child: Icon(Icons.account_circle,size: 130,color: AppColors.backgroundColor,)
              ),
              SizedBox(height: 20,),
              Flex(
                direction: Axis.vertical,
                children: [
                  Text('${nome}', style: TextStyle(color: AppColors.backgroundColor, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Lato'),),
                  Text('${classificacao}', style: TextStyle(color: AppColors.backgroundColor, fontFamily: 'Varela', fontWeight: FontWeight.w400)),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(Icons.check_circle, color: AppColors.backgroundDarkGreen,),
                  )
                ],
              )
            ],
          ),

        ),
      ),
    );
  }
}
