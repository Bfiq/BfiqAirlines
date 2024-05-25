import 'package:bfiq_airlines/models/models.dart';
import 'package:flutter/material.dart';
import '../styles.dart';

Widget ticketWt(TicketModel ticket) {
  return Container(
    //Crear el Modelo tiquete/ticket
    height: 230,
    decoration: BoxDecoration(
        color: StylesApp.secondLigthColor,
        borderRadius: BorderRadius.circular(30)),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(ticket.acronymCityDeparture,
                  style:
                      StylesApp.boldWord20), //Acronimo de la ciudad de salida
              Text(ticket.acronymCityEntry,
                  style:
                      StylesApp.boldWord20), //Acronimo de la ciudad de destino
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  ticket.nameDepartureAirport, //Nombre del aeropuerto de salida
                  style: StylesApp.standardWord12),
              Text(ticket.nameAirportEntry, //Nombre del aeropuerto de destino
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
                  textTicket(text: "Depart", style: 2, directionR: false),
                  textTicket(
                      text: "lun 24 Jan", directionR: false), //fecha de salida
                  textTicket(
                      text: "9:35 am",
                      style: 3,
                      directionR: false), //hora de salida
                  const Text("AIRFRANCE"),
                ],
              ),
              const Text("2:10 min"), //Tiempo estimado del vuelo
              Column(
                children: [
                  textTicket(
                    text: "Return",
                    style: 2,
                  ),
                  textTicket(
                    text: "lun 24 Jan",
                    style: 1,
                  ), //Fecha de llegada
                  textTicket(
                    text: "11:45 am",
                    style: 3,
                  ), //hora de llegada
                  Text(ticket.price.toString()), //precio del ticket
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}

//Separar el widget ticket y pasarle el modelo

Widget textTicket({String text = "", int style = 1, bool directionR = true}) {
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
