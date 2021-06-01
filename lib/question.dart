import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String
      questionText; // dit à dart que la valeur ne changera pas après l'initialisation du constructeur

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      // contient un child(=Content), et potentiellement un padding, une border, et un margin
      width: double.infinity,
      margin: EdgeInsets.all(10), // on ajoute 10px de marge au container
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
