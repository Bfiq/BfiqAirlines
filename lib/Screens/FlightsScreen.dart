import 'package:bfiq_airlines/models/models.dart';
import 'package:bfiq_airlines/widgets/widgets.dart';
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

  final ticket = TicketModel(
      acronymCityDeparture: "CDG",
      acronymCityEntry: "FLR",
      nameAirportEntry: "Florencia Amerigo Vespucci",
      nameDepartureAirport: "París - Charles de Gaulle",
      departureDate: DateTime(2024, 5, 20, 9, 20),
      arrivalDate: DateTime(2024, 5, 20, 11, 20),
      price: 1810);

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
                  children: [ticketWt(ticket)],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
