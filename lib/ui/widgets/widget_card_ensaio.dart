import 'package:flutter/material.dart';
import 'package:projeto_nw/util/app_colors.dart';

class CardEnsaio extends StatelessWidget {
  int? ensaioId;
  String? titulo;
  String? data;
  String? horario;

  final VoidCallback? onPressed;


  CardEnsaio(
      {this.ensaioId, this.titulo, this.data, this.horario, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.accentColor,width: 2.0),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(5, 5) ,
            bottomLeft: Radius.elliptical(20, 20),
            topLeft: Radius.elliptical(5, 5) ,
            topRight: Radius.elliptical(20, 20)),
        color: AppColors.accentColor,
      ),
      child: ListTile(
        title: Text(titulo!.toUpperCase()),
        subtitle: Text('${data} - ${horario}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onPressed
        ),
      ),
    );
  }
}
