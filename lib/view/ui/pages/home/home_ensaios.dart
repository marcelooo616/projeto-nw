import 'package:flutter/material.dart';
import 'package:projeto_nw/models/data/repository/ensaio_repository.dart';
import 'package:projeto_nw/models/entities/ensaio.dart';
import 'package:projeto_nw/util/color/app_colors.dart';

class MostrarEnsaioScreen extends StatefulWidget {


  @override
  _MostrarEnsaioScreenState createState() => _MostrarEnsaioScreenState();
}

class _MostrarEnsaioScreenState extends State<MostrarEnsaioScreen> {
  List<Ensaio> _listaEnsaio = [];

  @override
  void initState() {
    super.initState();
    _buscarEnsaio();
  }

  Future<void> _buscarEnsaio() async {
    print('lisssssssss');
    final List<Ensaio> listaEnsaio =
    await EnsaioRepository.instance.buscarTodosEnsaio();
    setState(() {
      _listaEnsaio = listaEnsaio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        title: const Text('Todos os Ensaios'),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: _listaEnsaio.length,
            itemBuilder: (BuildContext context, int index) {
              final Ensaio ensaio = _listaEnsaio[index];
              return ListTile(
                title: Text(ensaio.titulo!),
                subtitle: Text('${ensaio.data} - ${ensaio.horario}'),
                trailing: IconButton(
                  icon:const Icon(Icons.delete),
                  onPressed: () async {
                    await EnsaioRepository.instance.deletarEnsaio(ensaio.id!);
                    _buscarEnsaio();
                  },
                ),
              );

            },
          ),

        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/adicionar_ensaio');
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}
