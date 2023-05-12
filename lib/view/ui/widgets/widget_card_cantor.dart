import 'package:flutter/material.dart';
class CardCantor extends StatelessWidget {
  String? nome;


  CardCantor({this.nome});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(nome!),
    );
  }
}
