import 'package:flutter/material.dart';
import 'dart:math';

class ModulacaoScreen extends StatefulWidget {
  @override
  _ModulacaoScreenState createState() => _ModulacaoScreenState();
}

class _ModulacaoScreenState extends State<ModulacaoScreen> {
  List<String> keys = [
    "C",
    "C#",
    "D",
    "Eb",
    "E",
    "F",
    "F#",
    "G",
    "Ab",
    "A",
    "Bb",
    "B"
  ];

  List<List<String>> chordds = [
    ["Cmaj7", "Dm7", "Em7", "Fmaj7", "G7", "Am7", "Bm7b5"],
    ["C#maj7", "D#m7", "Fm7", "F#maj7", "G#7", "A#m7", "Cm7b5"],
    ["Dmaj7", "Em7", "F#m7", "Gmaj7", "A7", "Bm7", "C#m7b5"],
    ["Emaj7", "F#m7", "G#m7", "Amaj7", "B7", "C#m7", "D#m7b5/G"],
    ["Fmaj7", "Gm7", "Am7", "Bbmaj7", "C7", "Dm7", "Em7b5"],
    ["F#maj7", "G#m7", "A#m7", "Bmaj7", "C#7", "D#m7", "Fm7b5"],
    ["Gmaj7", "Am7", "Bm7", "Cmaj7", "D7", "Em7", "F#m7b5"],
    ["Abmaj7", "Bbm7", "Cm7", "Dbmaj7", "Eb7", "Fm7", "Gm7b5"],
    ["Amaj7", "Bm7", "C#m7", "Dmaj7", "E7", "F#m7", "G#m7b5"],
    ["Bbmaj7", "Cm7", "Dm7", "Ebmaj7", "F7", "Gm7", "Am7b5"],
    ["Bmaj7", "C#m7", "D#m7", "Emaj7", "F#7", "G#m7", "A#m7b5"]
  ];

  List<List<String>> chords = [
    ["Cmaj7", "Dm7", "Em7", "Fmaj7", "G7", "Am7", "Bm7b5", "Cmaj9", "Dm11", "Em13"],
    ["C#maj7", "D#m7", "Fm7", "F#maj7", "G#7", "A#m7", "Cm7b5", "C#maj9", "D#m11", "Fm13"],
    ["Dmaj7", "Em7", "F#m7", "Gmaj7", "A7", "Bm7", "C#m7b5", "Dmaj9", "Em11", "F#m13"],
    ["Emaj7", "F#m7", "G#m7", "Amaj7", "B7", "C#m7", "D#m7b5/G", "Emaj9", "F#m11", "G#m13"],
    ["Fmaj7", "Gm7", "Am7", "Bbmaj7", "C7", "Dm7", "Em7b5", "Fmaj9", "Gm11", "Am13"],
    ["F#maj7", "G#m7", "A#m7", "Bmaj7", "C#7", "D#m7", "Fm7b5", "F#maj9", "G#m11", "A#m13"],
    ["Gmaj7", "Am7", "Bm7", "Cmaj7", "D7", "Em7", "F#m7b5", "Gmaj9", "Am11", "Bm13"],
    ["Abmaj7", "Bbm7", "Cm7", "Dbmaj7", "Eb7", "Fm7", "Gm7b5", "Abmaj9", "Bbm11", "Cm13"],
    ["Amaj7", "Bm7", "C#m7", "Dmaj7", "E7", "F#m7", "G#m7b5", "Amaj9", "Bm11", "C#m13"],
    ["Bbmaj7", "Cm7", "Dm7", "Ebmaj7", "F7", "Gm7", "Am7b5", "Bbmaj9", "Cm11", "Dm13"],
    ["Bmaj7", "C#m7", "D#m7", "Emaj7", "F#7", "G#m7", "A#m7b5", "Bmaj9", "C#m11", "D#m13"]
  ];

  List<List<String>> bassNotes = [
    ["C", "D", "E", "F", "G", "A", "B"],
    ["C#", "D#", "F", "F#", "G#", "A#", "C"],
    ["D", "E", "F#", "G", "A", "B", "C#"],
    ["Eb", "F", "G", "Ab", "Bb", "C", "D"],
    ["E", "F#", "G#", "A", "B", "C#", "D#"],
    ["F", "G", "A", "Bb", "C", "D", "E"],
    ["F#", "G#", "A#", "B", "C#", "D#", "F"],
    ["Ab", "Bb", "C", "Db", "Eb", "F", "G"],
    ["A", "B", "C#", "D", "E", "F#", "G#"],
    ["Bb", "C", "D", "Eb", "F", "G", "A"],
    ["B", "C#", "D#", "E", "F#", "G#", "A#"]
  ];

  List<List<String>> chordVoicings = [
    ["Cmaj7", "Dm7/G", "G7alt", "A7alt", "Dmaj7"],
    ["C#maj7", "D#m7/G#", "G#7alt", "A#7alt", "D#maj7"],
    ["Dmaj7", "Em7/A", "A7alt", "B7alt", "Emaj7"],
    ["Emaj7", "F#m7/B", "B7alt", "C#7alt", "F#maj7"],
    ["Fmaj7", "Gm7/C", "C7alt", "D7alt", "Gmaj7"],
    ["F#maj7", "G#m7/C#", "C#7alt", "D#7alt", "G#maj7"],
    ["Gmaj7", "Am7/D", "D7alt", "E7alt", "Amaj7"],
    ["Abmaj7", "Bbm7/Eb", "Eb7alt", "F7alt", "Bbmaj7"],
    ["Amaj7", "Bm7/E", "E7alt", "F#7alt", "Bmaj7"],
    ["Bbmaj7", "Cm7/F", "F7alt", "G7alt", "Cmaj7"],
    ["Bmaj7", "C#m7/F#", "F#7alt", "G#7alt", "C#maj7"]
  ];


  String fromKey = "";
  String toKey = "";
  List<String> modulatedChords = [];





  List<dynamic> generateRandomModulation(String fromKey, String toKey) {
    final fromIndex = keys.indexOf(fromKey);
    final toIndex = keys.indexOf(toKey);

    if (fromIndex == -1 || toIndex == -1) {
      return [];
    }

    final modulationTechniques = [
      '2-5-1 (Jazz)',
      '1-5',
      'Direct Modulation',
    ];

    final styleVariations = [
      'Pop',
      'Jazz',
      'Rock',
      'Soul',
    ];

    final progression = [];
    int currentIndex = fromIndex;

    while (currentIndex != toIndex) {
      // Escolhe aleatoriamente uma técnica de modulação e uma variação de estilo
      final randomTechnique = modulationTechniques[Random().nextInt(modulationTechniques.length)];
      final randomStyle = styleVariations[Random().nextInt(styleVariations.length)];

      switch (randomTechnique) {
        case '2-5-1 (Jazz)':
        // Adiciona o acorde 2-5-1 (ciclo de terças) com variações de jazz e estilo
          progression.add(chords[currentIndex][1] + ' ' + randomStyle);
          progression.add(chords[currentIndex][4] + ' ' + randomStyle);
          progression.add(chords[currentIndex][0] + ' ' + randomStyle);
          currentIndex = (currentIndex + 1) % keys.length; // Avança 1 posição no ciclo de terças
          break;
        case '1-5':
        // Adiciona o acorde 1-5 com variação de estilo
          progression.add(chords[currentIndex][0] + ' ' + randomStyle);
          progression.add(chords[currentIndex][4] + ' ' + randomStyle);
          currentIndex = (currentIndex + 1) % keys.length; // Avança 1 posição no ciclo de terças
          break;
        case 'Direct Modulation':
        // Adiciona o acorde de modulação direta com variação de estilo
          progression.add(chords[currentIndex][0] + ' ' + randomStyle);
          currentIndex = toIndex; // Atingiu o acorde de destino, encerra a progressão
          break;
      }
    }

    // Adiciona o acorde de destino
    progression.add(chords[toIndex][0] + ' ' + styleVariations[Random().nextInt(styleVariations.length)]);

    return progression;
  }







  List<Widget> buildKeyButtons() {
    return keys.map((String key) {
      return ElevatedButton(
        onPressed: () {
          setState(() {
            fromKey = key;
          });
        },
        style: ElevatedButton.styleFrom(
          primary: fromKey == key ? Colors.blue : null,
        ),
        child: Text(key),
      );
    }).toList();
  }

  void modulateChordss() {
    if (fromKey.isEmpty || toKey.isEmpty) {
      return;
    }

    setState(() {
      final fromIndex = keys.indexOf(fromKey);
      final toIndex = keys.indexOf(toKey);

      if (fromIndex == -1 || toIndex == -1) {
        modulatedChords = [];
      } else {
        modulatedChords = [];
        int currentIndex = fromIndex;
        modulatedChords.add(chordVoicings[currentIndex][0]);

        int chordCount = 0;
        while (currentIndex != toIndex && chordCount < 4) {
          // Avança 2 posições no ciclo de quintas para o acorde dominante (5)
          currentIndex = (currentIndex + 2) % keys.length;
          modulatedChords.add(chordVoicings[currentIndex][0]);

          // Avança 1 posição no ciclo de quintas para o acorde tônica (1)
          currentIndex = (currentIndex + 1) % keys.length;
          modulatedChords.add(chordVoicings[currentIndex][0]);

          chordCount += 2; // Dois acordes foram adicionados (dominante e tônica)
        }

        modulatedChords.add(chordVoicings[toIndex][0]);
      }
    });

  }





  /* List<dynamic> modulateChordss(List<String> keys, String fromKey, String toKey) {
    if (keys.isEmpty) {
      return [];
    }

    final fromIndex = keys.indexOf(fromKey);
    final toIndex = keys.indexOf(toKey);

    if (fromIndex == -1 || toIndex == -1) {
      return [];
    }

    final modulatedChords = [];
    int currentIndex = fromIndex;
    modulatedChords.add(chords[currentIndex][0]);

    while (currentIndex != toIndex) {
      currentIndex = (currentIndex + 1) % keys.length;
      modulatedChords.add(chords[currentIndex][0]);

      // Check if there are variations available
      if (chords[currentIndex].length > 1) {
        // Add variations (9, 11, 13) to the modulated chord list
        modulatedChords.add(chords[currentIndex][7]); // Variation with 9
        modulatedChords.add(chords[currentIndex][8]); // Variation with 11
        modulatedChords.add(chords[currentIndex][9]); // Variation with 13
      }
    }

    return modulatedChords;
  }


  List<Widget> buildKeyButtons() {
    return keys.map((String key) {
      return ElevatedButton(
        onPressed: () {
          setState(() {
            fromKey = key;
          });
        },
        style: ElevatedButton.styleFrom(
          primary: fromKey == key ? Colors.blue : null,
        ),
        child: Text(key),
      );
    }).toList();
  }
  void modulateChords() {
    if (fromKey.isEmpty || toKey.isEmpty) {
      return;
    }

    setState(() {
      final fromIndex = keys.indexOf(fromKey);
      final toIndex = keys.indexOf(toKey);

      if (fromIndex == -1 || toIndex == -1) {
        modulatedChords = [];
      } else {
        modulatedChords = [];
        int currentIndex = fromIndex;
        modulatedChords.add(chords[currentIndex][0]);

        int chordCount = 0;
        while (currentIndex != toIndex && chordCount < 4) {
          currentIndex = (currentIndex + 7) % 12; // Avança 7 posições no ciclo de quintas
          modulatedChords.add(chords[currentIndex][0]);
          chordCount++;
        }

        modulatedChords.add(chords[toIndex][0]);
      }
    });
  }*/


  /* void modulateChords() {
    if (fromKey.isEmpty || toKey.isEmpty) {
      return;
    }

    setState(() {
      final fromIndex = keys.indexOf(fromKey);
      final toIndex = keys.indexOf(toKey);

      if (fromIndex == -1 || toIndex == -1) {
        modulatedChords = [];
      } else {
        modulatedChords = [];
        int currentIndex = fromIndex;
        modulatedChords.add(chords[currentIndex][0]);

        while (currentIndex != toIndex) {
          currentIndex = (currentIndex + 1) % keys.length;
          modulatedChords.add(chords[currentIndex][1]);
        }

        modulatedChords.add(chords[toIndex][0]);
      }
    });
  }*/

  /*void modulateChords() {
    if (fromKey.isEmpty || toKey.isEmpty) {
      return;
    }

    setState(() {
      final fromIndex = keys.indexOf(fromKey);
      final toIndex = keys.indexOf(toKey);

      if (fromIndex == -1 || toIndex == -1) {
        modulatedChords = [];
      } else {
        modulatedChords = [];
        int currentIndex = fromIndex;
        modulatedChords.add(keys[currentIndex]);

        while (currentIndex != toIndex) {
          currentIndex = (currentIndex + keys.length - 1) % keys.length;
          modulatedChords.add(keys[currentIndex]);
        }
      }
    });
  }*/


  /*void modulateChords() {
    if (fromKey.isEmpty || toKey.isEmpty) {
      return;
    }

    setState(() {
      final fromIndex = keys.indexOf(fromKey);
      final toIndex = keys.indexOf(toKey);

      if (fromIndex == -1 || toIndex == -1) {
        modulatedChords = [];
      } else {
        modulatedChords = [];
        int currentIndex = fromIndex;
        modulatedChords.add(keys[currentIndex]);

        int count = 1; // Contador para controlar o número de acordes adicionados

        while (currentIndex != toIndex && count < 5) {
          currentIndex = (currentIndex + 1) % keys.length;
          modulatedChords.add(keys[currentIndex]);
          count++;
        }
      }
    });
  }*/

  List<String> modulationTechniques = [
    'cycleOfFifths',
    'cycleOfFourths',
    'cycleOfThirds',
    'relatedChords',
    'secondaryDominants',
    'modalInterchange',
    'pivotChords',
    'chromaticModulation',
  ];

  String randomModulationTechnique() {
    final random = Random();
    final index = random.nextInt(modulationTechniques.length);
    return modulationTechniques[index];
  }

  List<dynamic> modulateChords(String fromKey, String toKey) {
    if (fromKey.isEmpty || toKey.isEmpty) {
      return [];
    }

    final fromIndex = keys.indexOf(fromKey);
    final toIndex = keys.indexOf(toKey);

    if (fromIndex == -1 || toIndex == -1) {
      return [];
    }

    final modulatedChords = [];
    int currentIndex = fromIndex;
    modulatedChords.add(chordVoicings[currentIndex][0]);

    String modulationTechnique = randomModulationTechnique();

    while (currentIndex != toIndex && modulatedChords.length < 5) {
      if (modulationTechnique == 'cycleOfFifths') {
        currentIndex = (currentIndex + 7) % keys.length;
      } else if (modulationTechnique == 'cycleOfFourths') {
        currentIndex = (currentIndex + 5) % keys.length;
      } else if (modulationTechnique == 'cycleOfThirds') {
        currentIndex = (currentIndex + 4) % keys.length;
      } else if (modulationTechnique == 'relatedChords') {
        // Implemente aqui a lógica para acordes relacionados

      } else if (modulationTechnique == 'secondaryDominants') {
        // Implemente aqui a lógica para dominantes secundários
      } else if (modulationTechnique == 'modalInterchange') {
        // Implemente aqui a lógica para empréstimo modal
      } else if (modulationTechnique == 'pivotChords') {
        // Implemente aqui a lógica para acordes pivô
      } else if (modulationTechnique == 'chromaticModulation') {
        // Implemente aqui a lógica para modulação cromática
      }

      modulatedChords.add(chordVoicings[currentIndex][0]);
      modulationTechnique = randomModulationTechnique();
    }

    modulatedChords.add(chordVoicings[toIndex][0]);

    return modulatedChords;
  }



  @override
  Widget build(BuildContext context) {
    List<dynamic> randomModulation = generateRandomModulation("C", "Eb");
    print(randomModulation);
    return Scaffold(
      appBar: AppBar(
        title: Text('Modulation App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Tom inicial:',
            style: TextStyle(fontSize: 18),
          ),
          Container(
            height: 200,
            child: ListView(
              children: buildKeyButtons(),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Tom de destino:',
            style: TextStyle(fontSize: 18),
          ),
          Container(
            height: 200,
            child: ListView(
              children: [
                for (String key in keys)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        toKey = key;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: toKey == key ? Colors.blue : null,
                    ),
                    child: Text(key),
                  ),
              ],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: modulateChordss,
            child: Text('Modular'),
          ),
          SizedBox(height: 16),
          Text(
            'Modulated Chords:',
            style: TextStyle(fontSize: 18),
          ),
          Text(modulatedChords.toString()),
        ]),
      ),
    );
  }

  List<String> modulateKey(List<String> keys, List<List<String>> chords,
      List<List<String>> bassNotes, String fromKey, String toKey) {
    if (keys.isEmpty || chords.isEmpty || bassNotes.isEmpty) {
      return []; // Retorna lista vazia se as listas de acordes estiverem vazias
    }
    ;
    int fromIndex = keys.indexOf(fromKey);
    int toIndex = keys.indexOf(toKey);

    List<String> modulatedChords = [];
    print(modulatedChords.length);

    if (fromIndex == -1 || toIndex == -1) {
      return modulatedChords; // Retorna lista vazia se as tonalidades não forem encontradas
    }

    int currentIndex = fromIndex;
    modulatedChords.add(
        chords[currentIndex][0]); // Adiciona o acorde da tonalidade de partida
    print(modulatedChords);
    while (currentIndex != toIndex) {
      currentIndex = (currentIndex + 4) %
          12; // Avança 4 posições no ciclo de terças (intervalo de uma quarta)
      modulatedChords
          .add(chords[currentIndex][0]); // Adiciona o próximo acorde modulado
    }

    return modulatedChords;
  }
}
