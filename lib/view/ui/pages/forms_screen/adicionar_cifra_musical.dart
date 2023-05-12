import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




import 'package:flutter/material.dart';

class MinhaPagina extends StatefulWidget {
  @override
  _MinhaPaginaState createState() => _MinhaPaginaState();
}

class _MinhaPaginaState extends State<MinhaPagina> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _salvo = false;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _salvarTexto() {
    setState(() {
      _salvo = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      labelText: "Digite um texto",
      border: OutlineInputBorder(),
    );

    final textColor = _salvo ? Colors.green : Colors.black;
    final fontWeight = _salvo ? FontWeight.bold : FontWeight.normal;
    final fontSize = _salvo ? 24.0 : 16.0;

    final text = _textEditingController.text;

    final hasCmChord = text.toLowerCase().contains("cm");

    final textSpan = TextSpan(
      text: text,
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        backgroundColor: hasCmChord ? Colors.orange : null,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Página"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _textEditingController,
            decoration: inputDecoration,
            maxLines: null,
            style: TextStyle(
              color: textColor,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _salvarTexto,
        tooltip: "Salvar",
        child: Icon(Icons.save),
      ),
    );
  }
}







/*class CifraMusicalPage extends StatefulWidget {
  const CifraMusicalPage({Key? key}) : super(key: key);

  @override
  _CifraMusicalPageState createState() => _CifraMusicalPageState();
}

class _CifraMusicalPageState extends State<CifraMusicalPage> {
  final _formKey = GlobalKey<FormState>();
  final _cifraController = TextEditingController();
  bool _formatacaoAtivada = false;
  double _tamanhoFonte = 18.0;
  Color _corNota = Colors.black;
  final _notasMusicais = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];

  @override
  void dispose() {
    _cifraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cifra Musical'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: SizedBox(
                height: 300,
                child: TextFormField(

                  minLines: 1,
                  controller: _cifraController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Digite a cifra',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica de salvar e formatar a cifra musical
                    final cifra = _cifraController.text;
                    final acordes = _identificarAcordes(cifra);
                    final cifraFormatada = _formatarCifra(cifra, acordes);
                    setState(() {
                      _cifraController.text = cifraFormatada.toString();
                    });
                  },
                  child: const Text('Salvar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Limpa o campo de cifra musical
                    setState(() {
                      _cifraController.clear();
                      _tamanhoFonte = 18.0;
                      _corNota = Colors.black;
                    });
                  },
                  child: const Text('Limpar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<String> _identificarAcordes(String cifra) {
    final regex = RegExp(r'[A-G][#b]?(7|maj|min)?');
    final matches = regex.allMatches(cifra);
    final acordes = matches.map((match) => match.group(0)!).toList();
    return acordes;
  }

  Widget _formatarCifra(String cifra, List<String> acordes) {
    final children = <InlineSpan>[];
    int lastMatch = 0;
    final TextStyle boldOrangeStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.orange,
    );
    for (final acorde in acordes) {
      final index = cifra.indexOf(acorde, lastMatch);
      if (index > lastMatch) {
        children.add(TextSpan(text: cifra.substring(lastMatch, index)));
      }
      children.add(TextSpan(
        text: acorde.toUpperCase(),
        style: boldOrangeStyle,
      ));
      lastMatch = index + acorde.length;
    }
    if (lastMatch < cifra.length) {
      children.add(TextSpan(text: cifra.substring(lastMatch)));
    }
    return RichText(text: TextSpan(children: children));
  }


}

*/

