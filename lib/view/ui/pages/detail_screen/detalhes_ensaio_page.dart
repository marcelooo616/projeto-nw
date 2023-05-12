//import 'dart:convert';
//import 'dart:io';

//import 'dart:io';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:projeto_nw/models/data/repository/cantor_repository.dart';
import 'package:projeto_nw/models/data/repository/musica_repository.dart';
import 'package:projeto_nw/models/entities/cantor.dart';
import 'package:projeto_nw/models/entities/ensaio.dart';
import 'package:projeto_nw/models/entities/musica.dart';

import 'package:projeto_nw/view/ui/widgets/widget_card_musica_secundario.dart';
import 'package:projeto_nw/view/ui/widgets/widget_logo_marca.dart';
import 'package:projeto_nw/util/color/app_colors.dart';

class DetalhesEnsaio extends StatefulWidget {

  final Ensaio? ensaio;


  DetalhesEnsaio({this.ensaio});

  @override
  State<DetalhesEnsaio> createState() => _DetalhesEnsaioState();
}

class _DetalhesEnsaioState extends State<DetalhesEnsaio> {
  @override
  Widget build(BuildContext context) {
    List<String> listaDeParticipantes = widget.ensaio!.participantes!;
    List<int> listaDeParticipantesInt = listaDeParticipantes.map((participante) => int.parse(participante)).toList();

    List<String> repertorio = widget.ensaio!.repertorio!;
    List<int> listaInt = repertorio.map((e) => int.parse(e)).toList();


   /* Future<String> gerarJsonDoEnsaio(int id) async {
      try {
        print('dddd');
        final ensaio = await EnsaioRepository.instance.buscarEnsaioPorId(id);
        final jsonEnsaio = json.encode(ensaio);
        return jsonEnsaio;
      } catch (e) {
        // Tratar o erro de ensaio não encontrado
        throw Exception("Ensaio não encontrado");
      }
    }

    Future<void> compartilharJsonDoEnsaio(int id) async {
      final jsonEnsaio = await gerarJsonDoEnsaio(id);
      if (jsonEnsaio == null) {
        throw Exception("Json do ensaio não encontrado");
      }

      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/ensaio.json');
      await tempFile.writeAsString(jsonEnsaio);

      await Share.shareFiles([tempFile.path], text: 'Compartilhamento do ensaio');
    }

    Future<void> _compartilharEnsaio() async {
      await compartilharJsonDoEnsaio(widget.ensaio!.id!);
    }*/

  /*  Future<String> gerarCsvDoEnsaio(int id) async {
      final ensaio = await EnsaioDatabase.instance.buscarEnsaioPorId(id);
      if (ensaio == null) {
        throw Exception("Ensaio não encontrado");
      }
      final csvEnsaio = gerarCsvDoEnsaio(id);
      return csvEnsaio;
    }*/


   /* Future<String> gerarJsonDoEnsaio(int id) async {
      try {
        final ensaio = await EnsaioDatabase.instance.buscarEnsaioPorId(id);
        final jsonEnsaio = json.encode(ensaio);
        return jsonEnsaio;
      } catch (e) {
        // Tratar o erro de ensaio não encontrado
        throw Exception("Ensaio não encontrado");
      }
    }

    Future<void> compartilharJsonDoEnsaio(int id) async {
      final jsonEnsaio = await gerarJsonDoEnsaio(id);
      if (jsonEnsaio == null) {
        throw Exception("Json do ensaio não encontrado");
      }

      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/ensaio.json');
      await tempFile.writeAsString(jsonEnsaio);

      Share.shareFiles([tempFile.path], text: 'Compartilhamento do ensaio');
    }



    Future<void> _compartilharEnsaio() async {
      final jsonEnsaio = await gerarJsonDoEnsaio(widget.ensaio!.id!);
      if (jsonEnsaio == null) {
        return;
      }
     await Share.share(jsonEnsaio, subject: 'Ensaio');
    }
*/

   /* Future<String> gerarJsonDoEnsaio(int id) async {
      try {
        final ensaio = await EnsaioDatabase.instance.buscarEnsaioPorId(id);
        final jsonEnsaio = gerarCsvDoEnsaio(widget.ensaio!.id!);
        return jsonEnsaio;
      } catch (e) {
        // Tratar o erro de ensaio não encontrado
        throw Exception("Ensaio não encontrado");
      }
    }
    Future<void> _compartilharEnsaio() async {
      final jsonEnsaio = await gerarJsonDoEnsaio(widget.ensaio!.id!);
      if (jsonEnsaio == null) {
        return;
      }
      Share.share(jsonEnsaio, subject: 'Ensaio');
    }*/

    /*Future<void> _compartilharEnsaio() async {
      final csvEnsaio = await gerarCsvDoEnsaio(widget.ensaio!.id!);
      if (csvEnsaio == null) {
        return;
      }

      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/ensaio.csv');
      await tempFile.writeAsString(csvEnsaio);

      Share.shareFiles([tempFile.path], subject: 'Ensaio', text: 'Compartilhando ensaio em formato CSV');
    }*/



    /*  List<String> widgetsDosParticipantes = listaDeParticipantes!.map((participante) {
    return participante;
    }).toList();

    List<String> widgetsDoRepertorio = repertorio!.map((repertorio) {
      return repertorio;
    }).toList();
    List<int> listarep = widgetsDoRepertorio.map((e) => int.parse(e)).toList();*/

    print(listaDeParticipantesInt);
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar( title: LogoNewWine(),),
      body: ListView(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        children: [
          // titulo
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text(widget.ensaio!.titulo!.toUpperCase(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.backgroundColor),),)
              ],
            ),
          ),
          ElevatedButton(
            onPressed: (){},
            child: Text('Compartilhar'),
          ),


          // informaçõe do ensaio hoda, data
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 85,
                    decoration: const BoxDecoration(
                      color: AppColors.backgroundDarkGreen,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Data', style: TextStyle(fontSize: 20),),
                        Text('Horario', style: TextStyle(fontSize: 20)),
                      ],
                    )
                  ),
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(15),
                      height: 85,
                      decoration: const BoxDecoration(
                          color: AppColors.backgroundDarkGreen,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )
                      ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(widget.ensaio!.data!,style: TextStyle(fontSize: 20)),
                          Text(widget.ensaio!.horario!, style: TextStyle(fontSize: 20)),
                        ],
                      )
                  ),
                ),

              ],
            ),
          ),
          //lista dos participantes
          SizedBox(height: 25,),
          Container(
            child: Text('Escala cantores ', style: TextStyle(color: AppColors.backgroundDarkGreen, fontSize: 20, fontFamily: 'Lato', fontWeight: FontWeight.w500),),
          ),
          SizedBox(height: 15,),
         Container(
           width:200,
           height: 300,
           child: Card(
             margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
             color: AppColors.greyColor,
             child: FutureBuilder<List<Cantor>>(
               future: CantorRepository.instance.buscaPorListaDeIds(ids: listaDeParticipantesInt),
               builder: (context, snapshot) {
                 if (snapshot.connectionState == ConnectionState.waiting) {
                   return SizedBox();
                 }
                 if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
                   return Text('Erro ao buscar o cantor');
                 }
                 final cantor = snapshot.data!;

                 return ListView.builder(
                   itemCount: cantor?.length,
                   itemBuilder:(context, index) {
                     final solo = cantor?[index];
                     return InkWell(
                       onTap: (){},
                       splashColor: AppColors.backgroundDarkGreen,
                       child: Container(
                         margin: EdgeInsets.only(top: 10, bottom: 10),
                         child: ListTile(
                           hoverColor: Colors.black,
                           title: Text('${solo?.nome}', style: TextStyle(fontFamily: 'Montserrat'),),
                           subtitle: Text('${solo?.classificacaoVocal}', style: TextStyle(fontFamily: 'Montserrat')),
                         ),
                       ),
                     );
                   }
                 );

               },
             ),
           ),
         ),
          SizedBox(height: 15,),
          Container(
            child: Text('Repertorio do ensaio', style: TextStyle(color: AppColors.backgroundDarkGreen, fontSize: 20,fontFamily: 'Lato', fontWeight: FontWeight.w500),),
          ),
          SizedBox(height: 15,),
         Container(
            width:200,
            height: 500,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              color: AppColors.backgroundDark2,
              child: FutureBuilder<List<Musica>>(
                future: MusicaRepository.instance.buscarMusicasPorIds(listaInt),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Erro ao buscar as músicas'));
                  }
                  final musicas = snapshot.data;
                  return ListView.builder(
                    itemCount: musicas?.length,
                    itemBuilder: (context, index) {
                      final musica = musicas?[index];
                      return FutureBuilder<List<Cantor>>(
                        future: CantorRepository.instance.buscaPorListaDeIds(ids: [musica!.idCantorSolo!]),

                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return SizedBox();
                          }
                          if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
                            return Text('Erro ao buscar o cantor');
                          }
                          final cantor = snapshot.data!.first;

                          return Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            child: InkWell(
                              onTap: (){},
                              splashColor: AppColors.backgroundDarkGreen,
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: CardMusicaSecundario(
                                      nomeDaMusica: musica?.titulo,
                                      autor: musica?.autor,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height * 0.1 +90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.shade800,
                                    ),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Solo:\ ${cantor.nome?.split(' ')[0]}',  style: const TextStyle (
                                              color:  AppColors.backgroundColor,
                                            fontFamily: 'Montserrat',
                                            fontSize: 15
                                          ),),
                                          Text('${cantor.classificacaoVocal}', style: const TextStyle(
                                              color: AppColors.backgroundColor,
                                              fontSize: 15,
                                              fontFamily: 'Montserrat'
                                          ),),
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: AppColors.backgroundDarkGreen,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text('Tom:\ ${musica?.tom} ',style: const TextStyle(
                                              color: AppColors.primaryColor,
                                              fontFamily: 'Montserrat',
                                              fontSize: 17
                                          ),),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
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
