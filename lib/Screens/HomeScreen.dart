import 'package:bfiq_airlines/styles.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedButton = 1; // des/habilitar la segunda fecha del formulario
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            //Envolver dentro de un stack para posicionar el texto y las imagenes, posiblemente el mapamundi lo posicione con z index(como capas)
            height:
                MediaQuery.of(context).size.height / 3, //Separar en variable?
            decoration: BoxDecoration(
                color: StylesApp.primaryColor, //Separar los estilos
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: StylesApp.secondLigthColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Gestion de estados para los botones o setState
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          print("opción 1");
                          setState(() {
                            _selectedButton = 1;
                          });
                        },
                        child: _selectedButton == 1
                            ? ButtonsWt().selectedButton("Round Trip")
                            : ButtonsWt()
                                .unselectedButton("Round Trip")), //Ida y vuelta
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          print("opción 2");
                          setState(() {
                            _selectedButton = 2;
                          });
                        },
                        child: _selectedButton == 2
                            ? ButtonsWt().selectedButton("Oneway")
                            : ButtonsWt()
                                .unselectedButton("Oneway")), //Ida y vuelta
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "From:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: StylesApp.primaryColor),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                          fillColor: StylesApp.secondLigthColor,
                          filled: true,
                          iconColor: StylesApp.primaryColor,
                          prefixIcon: const Icon(Icons.flight_takeoff)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "To:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: StylesApp.primaryColor),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      enabled: _selectedButton == 1 ? true : false,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                          fillColor: StylesApp.secondLigthColor,
                          filled: true,
                          iconColor: StylesApp.primaryColor,
                          prefixIcon: const Icon(Icons.flight_land)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
