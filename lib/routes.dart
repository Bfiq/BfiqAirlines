import 'package:bfiq_airlines/Screens/screens.dart';
import 'package:flutter/material.dart';

class RoutesApp {
  static const initialRoute = "/home"; //Futuramente sera un Login

  Map<String, Widget Function(BuildContext)> routes = {
    '/home': (p0) => const HomeScreen(),
    '/flights': (p0) => const FlightsScreen(),
  };
}
