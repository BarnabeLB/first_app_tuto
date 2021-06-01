import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}
// void main() => runApp(MyApp()); fonctionne aussi en dart.

/*StatefulWidget peut-être rebuild à la différence de State*/
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState(); //_blabalbla the line indicate that these function car only be used inside the main dart file
  }
}

/*State Widget est persistant, ainsi quand sera commandé la reconstruction du programme, cette classe là ne sera pas touchée*/
class _MyAppState extends State<MyApp> {
  var _questionIndex =
      0; // une variable dans une classe est nommée une property

  void _answerQuestion() {
    setState(() {
      //setstate update ce widget en particulier et "rerender" cette partie là donc de l'application
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex); // une fonction dans une classe est nommée une method
  }

  @override // A utiliser quand on complète une méthode qui existe déjà dans la classe que l'on veut étendre, ici ce n'est pas nécéssaire car StatelessWidget override de base, mais c'est
  // laBonnePratique à avoir. En l'indiquant ici on se rapelle que l'on overrite pas accidentellement.
  Widget build(BuildContext context) {
    //le programme execute build lorsqu'il doit réafficher à l'écran l'interface
    var questions = [
      {
        'questionText': "Quelle est ta couleur préférée ?",
        "answers": ["Noir", "Rouge", "Bleu", "Jaune"],
      },
      // {} marche à la place de Map()
      {
        'questionText': "Quelle est ton animal préféré  ?",
        "answers": ["Chat", "Chien", "Pigeon", "Elephant"],
      },
      //[] = liste en dart, fonctionne comme un array[], son index de la même manière commence à 0
      {
        'questionText': "Quel est ta célébrité préférée ?",
        "answers": [
          "Céline Dion",
          "Brad Pitt",
          "Jacques Chirac",
          "René la taupe"
        ],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first App"),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex][
                  "questionText"], // le Widget prend la valeur de la variable questions[] à l'index 0
            ),
            ...(questions[_questionIndex]["answers"] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
