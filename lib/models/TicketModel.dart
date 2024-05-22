class TicketModel {
  String acronymCityDeparture; //acronimo de la ciudad de salida
  String acronymCityEntry; // acronimo de la ciudad de entrada
  String nameDepartureAirport; // nombre del aeropuerto de salida
  String nameAirportEntry; // nombre del aeropuerto de entrada
  DateTime departureDate; // fecha de salida
  DateTime arrivalDate; // fecha de entrada
  int price;

  TicketModel(
      {required this.acronymCityDeparture,
      required this.acronymCityEntry,
      required this.nameAirportEntry,
      required this.nameDepartureAirport,
      required this.departureDate,
      required this.arrivalDate,
      required this.price});

  factory TicketModel.fromJsom(Map<String, dynamic> json) => TicketModel(
      acronymCityDeparture: json['acronymCityDeparture'],
      acronymCityEntry: json['acronymCityEntry'],
      nameAirportEntry: json['nameAirportEntry'],
      nameDepartureAirport: json['nameDepartureAirport'],
      departureDate: json['departureDate'],
      arrivalDate: json['arrivalDate'],
      price: json['price']);

  Map<String, dynamic> toJson() => {
        'acronymCityDeparture': acronymCityDeparture,
        'acronymCityEntry': acronymCityEntry,
        'nameAirportEntry': nameAirportEntry,
        'nameDepartureAirport': nameDepartureAirport,
        'departureDate': departureDate,
        'arrivalDate': arrivalDate,
        'price': price,
      };
}
