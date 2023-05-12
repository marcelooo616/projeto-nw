import 'package:flutter/material.dart';
import 'package:projeto_nw/models/data/repository/musica_repository.dart';
import 'package:projeto_nw/models/entities/musica.dart';
import 'package:projeto_nw/models/entities/repetorio.dart';
import 'package:projeto_nw/view/ui/widgets/widget_card_musica_primario.dart';
import 'package:projeto_nw/view/ui/widgets/widget_logo_marca.dart';
import 'package:projeto_nw/util/color/app_colors.dart';
class DetalhesPlaylist extends StatefulWidget {

  @override
  State<DetalhesPlaylist> createState() => _DetalhesPlaylistState();
}

class _DetalhesPlaylistState extends State<DetalhesPlaylist> {
  List<Musica> _musicas = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buscarTodasMusicas();
  }
  Future<void> _buscarTodasMusicas() async {
    final List<Musica> listaDeEnsaio =
    await MusicaRepository.instance.retornarTodos();
    setState(() {
      _musicas = listaDeEnsaio;

    });
  }



  @override
  Widget build(BuildContext context) {
    Repertorio playlist = ModalRoute.of(context)?.settings.arguments as Repertorio;
    List<Musica> objetosFiltrados = _musicas.where((objeto) => playlist.playlist!.contains(objeto.id.toString())).toList();
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(title: LogoNewWine()),
      body: ListView(
        children: [
          Card(
            color: const Color(0xFF85FFBD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 4,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFBDFA16),
                Color(0xFF0DFA),
                  ],
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 16),
                    children: [
                      TextSpan(
                          text: 'Suas musicas ',
                          style: TextStyle(
                              fontSize: 50,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400)),
                      TextSpan(
                          text: '\n Favoritas ',
                          style: TextStyle(
                              fontSize: 60,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w900,
                              color: AppColors.backgroundDark2)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 35,),
          Container(
            alignment: Alignment.center,
            child: Text("${playlist?.titulo}", style: TextStyle(fontSize: 25, fontFamily: 'Varela', fontWeight: FontWeight.w400, color: AppColors.backgroundColor),),
          ),
          SizedBox(height: 25,),
          Flex(
            direction:Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(' Descrição: ${playlist?.descricao}',style: TextStyle(fontSize: 20, fontFamily: 'Varela', fontWeight: FontWeight.w400, color: AppColors.backgroundColor)),
              ),
            ],
          ),
          SizedBox(height: 25,),
          Container(
            height: 500,
            decoration: BoxDecoration(
              color: AppColors.backgroundDark2,
              borderRadius: BorderRadius.horizontal(right: Radius.circular(50), left: Radius.circular(50))
            ),
            child: ListView.builder(
              padding: EdgeInsets.only(left: 20, right: 20, top: 50),
              itemCount: objetosFiltrados.length,
              itemBuilder: (context, index){
                final musica = objetosFiltrados[index];
                return CardMusicaPrimario(
                  nomeDaMusica:'${musica.titulo}' ,
                  tomDaMusica:'${musica.tom}' ,
                  nomeDoAutor:'${musica.autor}' ,
                  idCantor:musica.idCantorSolo ,
                );
              },
             ),
            ),
          ]
      ),
    );
  }
}
