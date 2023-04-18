import 'package:flutter/material.dart';
import 'package:projeto_nw/data/repository/ensaio_repository.dart';
import 'package:projeto_nw/entities/ensaio.dart';
import 'package:projeto_nw/util/app_colors.dart';



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
    final List<Ensaio> listaEnsaio =
    await EnsaioDatabase.instance.buscarTodosEnsaio();
    setState(() {
      _listaEnsaio = listaEnsaio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos os Ensaios'),
      ),
      body: ListView.builder(
        itemCount: _listaEnsaio.length,
        itemBuilder: (BuildContext context, int index) {
          final Ensaio ensaio = _listaEnsaio[index];
          return ListTile(
            title: Text(ensaio.titulo!),
            subtitle: Text('${ensaio.data} - ${ensaio.horario}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await EnsaioDatabase.instance.deletarEnsaio(ensaio.id!);
                _buscarEnsaio();
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/adicionar_ensaio');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
