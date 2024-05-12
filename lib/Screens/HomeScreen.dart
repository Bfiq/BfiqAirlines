import 'package:bfiq_airlines/styles.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedButton = 1;
  final _formKey = GlobalKey<FormState>();
  final _fromCity = TextEditingController();
  final _toCity = TextEditingController();
  var _dateDepart = TextEditingController();
  var _dateReturn = TextEditingController();
  DateTime? dateDepart;

  Future<void> selectedDate(int dateType) async {
    //Separar esta lógica
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: dateType == 0 ? DateTime.now() : dateDepart!,
        firstDate: dateType == 0 ? DateTime.now() : dateDepart!,
        lastDate: DateTime.now().add(const Duration(days: 365)));

    if (pickedDate != null && dateType == 0) {
      _dateDepart.text = pickedDate.toIso8601String().substring(0, 10);
      dateDepart = pickedDate;
    }

    if (pickedDate != null && dateType == 1) {
      _dateReturn.text = pickedDate.toIso8601String().substring(0, 10);
    }
  }

  Future<void> errorToast() async {
    //Separar toast
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: TextsWt().textAlingLeft("Error"),
          content: const Text("Seleccione la fecha de inicio"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            //Envolver dentro de un stack para posicionar el texto y las imagenes, posiblemente el mapamundi lo posicione con z index(como capas)
            height:
                MediaQuery.of(context).size.height / 3.5, //Separar en variable?
            decoration: BoxDecoration(
                color: StylesApp.primaryColor, //Separar los estilos
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50))),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25, left: 15),
                    child: Container(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: const Text("BOOK YOUR FLIGHT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Container(
              decoration: const BoxDecoration(
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
                          setState(() {
                            _selectedButton = 2;
                            _dateReturn
                                .clear(); //Si al volver se quisiera mantener la fecha se necesita gestionar estados
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
          Form(
            key: _formKey,
            child: Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      TextsWt().textAlingLeft("From"),
                      TextFormField(
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
                      TextsWt().textAlingLeft("To"),
                      TextFormField(
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
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextsWt().textAlingLeft("Depart"),
                                GestureDetector(
                                  onTap: () async => selectedDate(0),
                                  child: TextFormField(
                                    controller: _dateDepart,
                                    enabled: false,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                width: 0,
                                                style: BorderStyle.none)),
                                        fillColor: StylesApp.secondLigthColor,
                                        filled: true,
                                        iconColor: StylesApp.secondColor,
                                        prefixIcon:
                                            const Icon(Icons.calendar_month)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              children: [
                                TextsWt().textAlingLeft("Return"),
                                GestureDetector(
                                  //Separar
                                  onTap: () async {
                                    if (_selectedButton == 2) {
                                      return;
                                    }

                                    if (_selectedButton == 1 &&
                                        dateDepart == null) {
                                      await errorToast();
                                    }

                                    if (dateDepart != null) {
                                      await selectedDate(1);
                                    }
                                  },
                                  child: TextFormField(
                                    controller: _dateReturn,
                                    enabled: false,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                width: 0,
                                                style: BorderStyle.none)),
                                        fillColor: StylesApp.secondLigthColor,
                                        filled: true,
                                        iconColor: StylesApp.secondColor,
                                        prefixIcon:
                                            const Icon(Icons.calendar_month)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextsWt().textAlingLeft("Passengers"),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            width: 0, style: BorderStyle.none)),
                                    fillColor: StylesApp.secondLigthColor,
                                    filled: true,
                                    iconColor: StylesApp.secondColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              children: [
                                TextsWt().textAlingLeft("Class"),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            width: 0, style: BorderStyle.none)),
                                    fillColor: StylesApp.secondLigthColor,
                                    filled: true,
                                    iconColor: StylesApp.secondColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => print("Guardar el Formulario"),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                              color: StylesApp.secondColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text("Search Flights",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
