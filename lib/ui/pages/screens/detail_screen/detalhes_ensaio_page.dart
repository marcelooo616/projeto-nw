import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_nw/entities/ensaio.dart';
import 'package:projeto_nw/ui/widgets/widget_logo_marca.dart';
import 'package:projeto_nw/util/app_colors.dart';
class DetalhesEnsaio extends StatelessWidget {

  final Ensaio? ensaio;


  DetalhesEnsaio({this.ensaio});

  @override
  Widget build(BuildContext context) {

    List<String> listaDeParticipantes = ensaio!.participantes!;
    List<String> repertorio = ensaio!.repertorio!;



    List<String> widgetsDosParticipantes = listaDeParticipantes!.map((participante) {
    return participante;
    }).toList();

    List<String> widgetsDoRepertorio = repertorio!.map((repertorio) {
      return repertorio;
    }).toList();



    return Scaffold(
      appBar: AppBar( title: LogoNewWine(),),
      body: ListView(
        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
        children: [
          // titulo
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text(ensaio!.titulo!.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),)
              ],
            ),
          ),
          // informaçõe do ensaio hoda, data
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    color: AppColors.accentColor,
                    elevation: 2,
                    child: ListTile(
                      title: Text(ensaio!.data!),
                      subtitle:Text(ensaio!.horario!) ,
                    )

                  ),
                ),
                Expanded(
                  child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      color: AppColors.accentColor,
                      elevation: 2,
                      child: ListTile(
                        title: Text(ensaio!.data!),
                        subtitle:Text(ensaio!.horario!) ,
                      )

                  ),
                )
              ],
            ),
          ),
          //lista dos participantes
         Container(
           width:200,
           height: 300,
           child: Card(
             margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
             color: AppColors.greyColor,
             child: ListView.builder(
               itemCount: widgetsDosParticipantes.length,
               itemBuilder: (BuildContext context, int index) {
                 return ListTile(
                   title: Text(widgetsDosParticipantes[index]),
                   subtitle: Text("Musico"),
                 );
               },
             ),
           ),
         ),
         Container(
            width:200,
            height: 300,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              color: AppColors.greyColor,
              child: ListView.builder(
                itemCount: widgetsDoRepertorio.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(widgetsDoRepertorio[index]),
                    subtitle: Text("Workship"),
                  );
                },
              ),
            ),
          )
        ],
      )
    );
  }
}
