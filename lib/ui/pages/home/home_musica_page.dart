import 'package:flutter/material.dart';
import 'package:projeto_nw/data/repository/cantor_repository.dart';
import 'package:projeto_nw/data/repository/musica_repository.dart';
import 'package:projeto_nw/entities/cantor.dart';
import 'package:projeto_nw/entities/musica.dart';
import 'package:projeto_nw/ui/widgets/widget_card_comum.dart';
import 'package:projeto_nw/ui/widgets/widget_card_musica.dart';
import 'package:projeto_nw/ui/widgets/widget_logo_marca.dart';
import 'package:projeto_nw/util/app_colors.dart';



class MusicasPage extends StatefulWidget {

  @override
  _MusicasPageState createState() => _MusicasPageState();
}

class _MusicasPageState extends State<MusicasPage> {
  List<Musica> _musicas = [];
  List<Cantor> _cantores = [];

  @override
  void initState() {
    super.initState();
    _buscarTodasMusicas();
    _buscarTodosOsCantores();
  }

  Future<void> _buscarTodasMusicas() async {
    final List<Musica> listaDeEnsaio =
    await MusicaRepository.instance.buscarTodosEnsaio();
    setState(() {
      _musicas = listaDeEnsaio;
    });
  }
  Future<void> _buscarTodosOsCantores() async {
    final List<Cantor> listaDeCantores =
    await CantorRepository.instance.buscarTodosOsCantores();
    setState(() {
      _cantores = listaDeCantores;
    });
  }
  //  List<Cantor> cantoresFiltrados = _cantores.where((cantor) => cantor.id == 1).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: LogoNewWine(), ),
      body: Container(
        decoration: BoxDecoration(
           color: AppColors.primaryColor
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CardComum(
                  width: 200,
                  heigth: 50,
                  padding: EdgeInsets.only(left: 20),
                  titulo: 'Ola! Boa tarde',
                  backgroundColor: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  fontSize: 25,
                  color: AppColors.backgroundColor,
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardComum(
                  width: 150,
                  heigth: 100,
                  titulo: 'Menos Utiliz..',
                  backgroundColor: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(15),
                  fontSize: 17,
                  fontWeigth: FontWeight.bold,

                ),
                CardComum(

                  width: 150,
                  heigth: 100,
                  titulo: 'Mais Utilz...',
                  backgroundColor: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(15),
                  fontSize: 17,
                  fontWeigth: FontWeight.bold,

                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/adicionar_cifra');
                  },
                  child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.article_sharp, size: 50),
                          SizedBox(height: 10),
                          Text('Cifras', textAlign: TextAlign.left),
                        ],
                      )
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/adicionar_musica');
                  },
                  child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_box, size: 50),
                          SizedBox(height: 10),
                          Text('Adicionar Musica', textAlign: TextAlign.left),
                        ],
                      )
                  ),
                ),
              ],
            ),

            SizedBox(height: 75,),
            Container(
              width:200,
              height: 450,
              child: Card(
                color: AppColors.primaryColor,
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _musicas.length,
                    itemBuilder: (context, index){
                      final musica = _musicas[index];
                    return   CardMusica(
                      tomDaMusica: musica.tom ,
                      nomeDoAutor: musica.autor,
                      nomeDaMusica: musica.titulo ,
                      idCantor: musica.idCantorSolo ,
                    );
                   }),
              ),
            ),
           SizedBox(height: 100,),




        ],
        ),
      ),


    );


  }
}

