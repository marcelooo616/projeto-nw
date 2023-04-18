import 'package:flutter/material.dart';
import 'package:projeto_nw/data/repository/ensaio_repository.dart';
import 'package:projeto_nw/entities/ensaio.dart';


class AdicionarEnsaioScreen extends StatefulWidget {
  @override
  _AdicionarEnsaioScreenState createState() => _AdicionarEnsaioScreenState();
}

class _AdicionarEnsaioScreenState extends State<AdicionarEnsaioScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores dos campos de texto
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _horarioController = TextEditingController();
  final TextEditingController _participantesController =
  TextEditingController();
  final TextEditingController _repertorioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Ensaio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: InputDecoration(
                  labelText: 'Título',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dataController,
                decoration: InputDecoration(
                  labelText: 'Data',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _horarioController,
                decoration: InputDecoration(
                  labelText: 'Horário',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _participantesController,
                decoration: InputDecoration(
                  labelText: 'Participantes',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _repertorioController,
                decoration: InputDecoration(
                  labelText: 'Repertório',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Cria um objeto Ensaio a partir dos dados preenchidos
                    final ensaio = Ensaio(
                      titulo: _tituloController.text,
                      data: _dataController.text,
                      horario: _horarioController.text,
                      participantes:
                      _participantesController.text.split(',').toList(),
                      repertorio: _repertorioController.text.split(',').toList(),
                    );

                    // Adiciona o ensaio ao banco de dados
                    EnsaioDatabase.instance.adicionarEnsaio(ensaio);

                    // Fecha a tela e retorna para a tela anterior
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();



                  }
                },
                child: Text('Adicionar Ensaio'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
