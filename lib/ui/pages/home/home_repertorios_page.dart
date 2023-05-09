import 'package:flutter/material.dart';
import 'package:projeto_nw/data/repository/Repertorio_repository.dart';
import 'package:projeto_nw/entities/repetorio.dart';
import 'package:projeto_nw/ui/pages/screens/forms_screen/adicionar_playlist.dart';
import 'package:projeto_nw/ui/widgets/widget_card_repertorio.dart';
import 'package:projeto_nw/ui/widgets/widget_logo_marca.dart';
import 'package:projeto_nw/util/app_colors.dart';

class RepertorioPage extends StatefulWidget {
  @override
  State<RepertorioPage> createState() => _RepertorioPageState();
}

class _RepertorioPageState extends State<RepertorioPage> {
  List<Repertorio> _playlist = [];

  @override
  void initState() {
    super.initState();
    _buscarEnsaio();
  }

  Future<void> _buscarEnsaio() async {
    final List<Repertorio> listaEnsaio =
        await RepertorioRepository.instance.buscarTodasPlaylist();
    setState(() {
      _playlist = listaEnsaio;
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = _playlist.isNotEmpty ? 'Suas Playlist' : 'lista de playlist vazia';
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        title: LogoNewWine(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: ListView(
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
                      Color(0xFF85FFBD),
                      Color(0xFFFFFB7D),
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
                            text: 'Minhas ',
                            style: TextStyle(
                                fontSize: 50,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: '\n playlist ',
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
            Divider(
              height: 75,
              color: AppColors.greyColor,
              thickness: 1,
            ),
          _playlist.isNotEmpty
              ? Container(
            height: 400,
            child: ListView.builder(
             itemCount: _playlist.length,
              itemBuilder:(BuildContext context, int index){
                final Repertorio playlist = _playlist[index];
                return Dismissible(
                  key: Key(playlist.id.toString()),
                  onDismissed: (direction) async{
                    await RepertorioRepository.instance.deletarPlaylist(playlist.id!);
                    setState(() {
                      print('[LOG] APAGANDO O PLAYLIST ID - ${playlist.id}');
                      _buscarEnsaio();
                    });
                  },
                  child: CardRepertorio(
                    descricao:playlist.descricao,
                    titulo: playlist.titulo,
                    primeiraCorTema:Color(
                        int.parse(playlist.primeiraCorTema!, radix: 16))
                        .withOpacity(1.0),
                    segundaCorTema: Color(
                        int.parse(playlist.segundaCorTema!, radix: 16))
                        .withOpacity(1.0),
                    rota:'/detalhes_playlist' ,
                    playlist:playlist ,
                  )

                );
          },
            ),
          )
              : Text('Que tal adicionar algumas musicas', style: TextStyle(color: AppColors.backgroundColor, fontSize: 25),)
          /*  Container(
              height: 400,
              decoration: BoxDecoration(
                  // color: AppColors.backgroundDark2,
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                  itemCount: _playlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Repertorio playlist = _playlist[index];
                    return CardRepertorio(
                        rota: '/detalhes_playlist',
                        titulo: playlist.titulo,
                        descricao: playlist.descricao,
                        primeiraCorTema: Color(
                                int.parse(playlist.primeiraCorTema!, radix: 16))
                            .withOpacity(1.0),
                        segundaCorTema: Color(
                                int.parse(playlist.segundaCorTema!, radix: 16))
                            .withOpacity(1.0));
                  }),
            ),*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.backgroundDarkGreen,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AdicionarRepertorio();
          }));
        },
        child: const Icon(
          Icons.add,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
