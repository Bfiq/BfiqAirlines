import 'package:flutter/material.dart';

class StylesApp {
  //Colores de la App
  static const primaryColor = Color.fromRGBO(26, 52, 90, 1);
  static const primaryLigthColor = Color.fromRGBO(159, 175, 187, 1);
  static const secondColor = Color.fromRGBO(128, 188, 195, 1);
  static const secondLigthColor = Color.fromRGBO(218, 236, 238, 1);

  //Estilos de los textos

  //Estilo de botones
  ButtonStyle selectedButton = const ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(secondColor),
      textStyle: MaterialStatePropertyAll(TextStyle(color: primaryColor)));
}
