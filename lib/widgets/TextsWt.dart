import 'package:flutter/material.dart';
import '../styles.dart';

class TextsWt {
  Widget textAlingLeft(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "$text:",
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: StylesApp.primaryColor),
          )),
    );
  }
}
