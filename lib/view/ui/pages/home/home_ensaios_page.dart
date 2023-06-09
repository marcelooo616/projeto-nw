import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_nw/models/data/repository/ensaio_repository.dart';
import 'package:projeto_nw/models/entities/ensaio.dart';
import 'package:projeto_nw/view/ui/pages/detail_screen/detalhes_ensaio_page.dart';
import 'package:projeto_nw/view/ui/pages/forms_screen/adicionar_ensaio_page.dart';


import 'package:projeto_nw/view/ui/widgets/widget_card_ensaio.dart';
import 'package:projeto_nw/view/ui/widgets/widget_logo_marca.dart';
import 'package:projeto_nw/util/color/app_colors.dart';

class EnsaioPage extends StatefulWidget {
  @override
  State<EnsaioPage> createState() => _EnsaioPageState();
}


class _EnsaioPageState extends State<EnsaioPage> {
  List<Ensaio> _listaDeEnsaio = [];

  @override
  void initState() {
    super.initState();
    _buscarTodosEnsaio();
  }

  Future<void> _buscarTodosEnsaio() async {
    final List<Ensaio> listaDeEnsaio =
        await EnsaioRepository.instance.retornarTodos();
    setState(() {
      _listaDeEnsaio = listaDeEnsaio;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        title: LogoNewWine(),
      ),
      body: ListView.builder(
        padding:const EdgeInsets.fromLTRB(15, 20, 15, 20),
        itemCount: _listaDeEnsaio.length,
        itemBuilder: (BuildContext context, int index) {
          final Ensaio ensaio = _listaDeEnsaio[index];
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalhesEnsaio(ensaio: ensaio),
                ),
              );
            },
            child: CardEnsaio(
              titulo: ensaio.titulo,
              data: ensaio.data,
              ensaioId: ensaio.id,
              horario: ensaio.horario,
              onPressed: () async{
                await EnsaioRepository.instance.deletarEnsaio(ensaio.id!);
                _buscarTodosEnsaio();
              },
            ),
          );
        },

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.backgroundDarkGreen,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AdicionarEnsaioScreen();
          }));
        },
        child:const Icon(Icons.add, color: AppColors.primaryColor,),
      ),
    );
  }
}
