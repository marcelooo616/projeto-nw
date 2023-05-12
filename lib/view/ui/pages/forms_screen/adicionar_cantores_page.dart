import 'package:flutter/material.dart';
import 'package:projeto_nw/controller/cantor_controller.dart';
import 'package:projeto_nw/models/data/repository/cantor_repository.dart';


class AdicionarCantorPage extends StatefulWidget {
  @override
  _AdicionarCantorPageState createState() => _AdicionarCantorPageState();
}

class _AdicionarCantorPageState extends State<AdicionarCantorPage> {
  final _formKey = GlobalKey<FormState>();

  final CantorRepository _cantorRepository = CantorRepository.instance;


  @override
  Widget build(BuildContext context) {
    final CantorController _cantorController = CantorController(_formKey, _cantorRepository);
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Cantor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o nome do cantor';
                  }
                  return null;
                },
                onSaved: (value) {
                  _cantorController.setNome(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Idade',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira a idade do cantor';
                  }
                  return null;
                },
                onSaved: (value) {
                  _cantorController.setIdade(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tom de Canto',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o tom de canto do cantor';
                  }
                  return null;
                },
                onSaved: (value) {
                  _cantorController.setTomCanto(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Classificação Vocal',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira a classificação vocal do cantor';
                  }
                  return null;
                },
                onSaved: (value) {
                  _cantorController.setClassificacaoVocal(value!);
                },
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    _cantorController.salvarCantor(context);
                    },
                  child: Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
