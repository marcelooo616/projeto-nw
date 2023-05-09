import 'package:flutter/material.dart';
import 'package:projeto_nw/entities/evento.dart';
import 'package:projeto_nw/ui/widgets/widget_logo_marca.dart';
class DetalhesEvento extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Evento evento = ModalRoute.of(context)?.settings.arguments as Evento;
    return Scaffold(
      appBar: AppBar(title: LogoNewWine(),),
      body: Center(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Text('${evento.titulo}'),
            Text('${evento.tipo}'),
            Text('${evento.data}'),
            Text('${evento.endereco}'),
            Text('${evento.participantes}'),
            Text('${evento.repertorio}'),
          ],
        ),
      ),
    );
  }
}
