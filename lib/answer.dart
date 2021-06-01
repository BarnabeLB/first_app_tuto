import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback
      selectHandler; // j'ai remplacé final Function par final VoidCallBack pour que ça fonctionne
  final String answerText;

  Answer(this.selectHandler, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed:
            selectHandler, // sans parenthèse à la fin c'est un pointeur qui est passé à flutter et non une fonction, c'est juste le nom de la fonction et non la fonction
      ),
    );
  }
}
