import 'package:flutter/material.dart';
import 'package:projeto_nw/models/data/repository/cantor_repository.dart';
import 'package:projeto_nw/models/entities/cantor.dart';
import 'package:projeto_nw/view/ui/widgets/widget_card_menbro.dart';
import 'package:projeto_nw/util/color/app_colors.dart';


class CantoresPageScreen extends StatefulWidget {


  @override
  State<CantoresPageScreen> createState() => _CantoresPageScreenState();
}

class _CantoresPageScreenState extends State<CantoresPageScreen> {

  List<Cantor> _cantores = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buscarTodosOsCantores();
  }

  Future<void> _buscarTodosOsCantores() async{
    final List<Cantor> listaDeCantores =
        await CantorRepository.instance.retornarTodos();
    setState(() {
      _cantores = listaDeCantores;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Cantores'),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: AppColors.primaryColor
        ),
        child: ListView(
          children: [

            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              /*  Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.1 ,
                  child:  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/adicionar_cantor');
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
                            Text('Adicionar Menbro', textAlign: TextAlign.left),
                          ],
                        )
                    ),
                  ),
                ),*/
              ],
            ),
          /*  Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _cantores.length,
                  itemBuilder: (context, index) {
                    final cantor = _cantores[index];
                    return CardMenbro(
                      nome: cantor.nome,
                      classificacaoVocal: cantor.classificacaoVocal,
                      idade: cantor.idade,
                      tomDeCanto: cantor.tomCanto,
                    );
                  },
                ),
              ),
            ),*/
           /* CarouselSlider(
                items: _cantores
                    .map((element) => CardMenbro(
                  tomDeCanto: element.tomCanto,
                  idade: element.idade ,
                  classificacaoVocal: element.classificacaoVocal,
                  nome:element.nome,
                ))
                    .toList(),
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  initialPage: 2,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) {
                    // Ação a ser executada quando a página é alterada
                    print("MUDOU $reason");
                  },
                  scrollDirection: Axis.horizontal,
                )),*/

            SizedBox(height: 50,),
            Container(
              height: 700,
              child: ListView.builder(
                itemCount: _cantores.length,
                  itemBuilder: (context, index){
                  final cantores = _cantores[index];
                  return Dismissible(
                    key: Key(cantores.id.toString()),
                    direction: DismissDirection.startToEnd,
                    background: Container(
                      color: Colors.red,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                                size: 35,
                              ),
                              Text('Deletar', style: TextStyle(color: AppColors.backgroundColor, fontFamily: 'Varela', fontSize: 15),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    onDismissed: (direction) async{
                      await CantorRepository.instance.deletarItem(
                        valoresWhere: [cantores.id],
                      );
                      setState(() {
                        print('[LOG] APAGANDO O MUSICA ID - ${cantores.id}');
                        _buscarTodosOsCantores();
                      }

                      );

                    },
                    child: CardMenbro(
                      nome: cantores.nome ,
                      classificacao: cantores.classificacaoVocal,
                    ),
                  );
                  }
              ),
            ),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.backgroundDarkGreen,
        onPressed: () {
          Navigator.pushNamed(context, '/adicionar_cantor');
        },
        child: const Icon(
          Icons.add,
          color: AppColors.primaryColor,
        ),
      ),
      
    );
  }
}
