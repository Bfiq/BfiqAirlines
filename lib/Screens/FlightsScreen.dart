import 'package:bfiq_airlines/widgets/TextsWt.dart';
import 'package:flutter/material.dart';
import '../styles.dart';

class FlightsScreen extends StatefulWidget {
  const FlightsScreen({super.key});

  @override
  State<FlightsScreen> createState() => _FlightsScreenState();
}

class _FlightsScreenState extends State<FlightsScreen> {
  static const styleText =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                //Envolver dentro de un stack para posicionar el texto y las imagenes, posiblemente el mapamundi lo posicione con z index(como capas)
                height: MediaQuery.of(context).size.height /
                    3, //Separar en variable?
                decoration: const BoxDecoration(
                    /* image: Image.asset(""), */
                    color: StylesApp.primaryColor, //Separar los estilos
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(35))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text("Select Flight", style: styleText),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Image.asset("assets/routeFlight.png"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: const EdgeInsets.only(left: 45, top: 5),
                          child: Text("CDG", style: styleText),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 45, top: 5),
                          child: Text("FLR", style: styleText),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: const EdgeInsets.only(left: 45, top: 5),
                          child: Text("Paris", style: styleText),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 45, top: 5),
                          child: Text("Florencia", style: styleText),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: -25,
                  left: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width * 0.8) /
                      2, // Ajuste relativo
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: StylesApp.secondColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text("Filter",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Icon(
                              Icons.tune,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            color: StylesApp.secondColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text("Sort By:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Text("Quickest",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            "10 Flight Avalible",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: StylesApp.primaryColor),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      //Crear el Modelo tiquete/ticket
                      height: 230,
                      decoration: BoxDecoration(
                          color: StylesApp.secondLigthColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("CDG",
                                    style: StylesApp
                                        .boldWord20), //Acronimo de la ciudad de salida
                                Text("FLR",
                                    style: StylesApp
                                        .boldWord20), //Acronimo de la ciudad de destino
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                    "París - Charles \n de Gaulle", //Nombre del aeropuerto de salida
                                    style: StylesApp.standardWord12),
                                Text(
                                    "Florencia \n Amerigo Vespucci", //Nombre del aeropuerto de destino
                                    textDirection: TextDirection.rtl,
                                    style: StylesApp.standardWord12),
                              ],
                            ),
                            Image.asset(
                              "assets/flyRoute.png",
                              height: 80,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    TextTicket(
                                        text: "Depart",
                                        style: 2,
                                        directionR: false),
                                    TextTicket(
                                        text: "lun 24 Jan",
                                        directionR: false), //fecha de salida
                                    TextTicket(
                                        text: "9:35 am",
                                        style: 3,
                                        directionR: false), //hora de salida
                                    const Text("AIRFRANCE"),
                                  ],
                                ),
                                const Text(
                                    "2:10 min"), //Tiempo estimado del vuelo
                                Column(
                                  children: [
                                    TextTicket(
                                      text: "Return",
                                      style: 2,
                                    ),
                                    TextTicket(
                                      text: "lun 24 Jan",
                                      style: 1,
                                    ), //Fecha de llegada
                                    TextTicket(
                                      text: "11:45 am",
                                      style: 3,
                                    ), //hora de llegada
                                    const Text("1,181"), //precio del ticket
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  //Separar el widget ticket y pasarle el modelo

  Widget TextTicket({String text = "", int style = 1, bool directionR = true}) {
    //selección de estilo
    TextStyle? styleText = null;

    if (style == 1) {
      styleText = StylesApp.standardWord12;
    }

    if (style == 2) {
      styleText = StylesApp.standardSecondWord12;
    }

    if (style == 3) {
      styleText = StylesApp.boldWord18;
    }

    return Text(
      text,
      textDirection: directionR ? TextDirection.rtl : TextDirection.ltr,
      style: styleText,
    );
  }
}
