import 'package:flutter/material.dart';
import '../styles.dart';

class ButtonsWt {
  Widget selectedButton(String text) {
    return Container(
      decoration: const BoxDecoration(
          color: StylesApp.secondColor,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: Text(text,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
    );
  }

  Widget unselectedButton(String text) {
    return Container(
      child: Center(
        child: Text(text,
            style: const TextStyle(
                color: StylesApp.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
    );
  }
}
