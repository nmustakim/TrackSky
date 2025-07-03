
import '../../data/models/flight_model.dart';

class AppConstants {
  static const String openSkyBaseUrl = 'https://opensky-network.org/api';
  static const Duration networkTimeout = Duration(seconds: 10);
  static const int maxFlightsToShow = 100;


  static const List<String> popularCountries = [
    'United States',
    'Germany',
    'United Kingdom',
    'Bangladesh',
    'France',
    'Japan',
    'Canada',
    'Australia',
    'Netherlands',
    'Switzerland',
    'Norway',
  ];
}



class FlightUtils {
  static String getFlightStatus(FlightModel flight) {
    if (flight.onGround == true) {
      return 'On Ground';
    } else if (flight.velocity != null && flight.velocity! > 0) {
      return 'In Flight';
    } else {
      return 'Unknown';
    }
  }

  static String formatAltitude(double? altitude) {
    if (altitude == null) return 'N/A';
    if (altitude > 1000) {
      return '${(altitude / 1000).toStringAsFixed(1)}k m';
    }
    return '${altitude.toInt()} m';
  }

  static String formatVelocity(double? velocity) {
    if (velocity == null) return 'N/A';
    final kmh = velocity * 3.6;
    return '${kmh.toInt()} km/h';
  }

  static String getFlightDirection(double? track) {
    if (track == null) return 'N/A';

    final directions = [
      'N', 'NNE', 'NE', 'ENE', 'E', 'ESE', 'SE', 'SSE',
      'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW'
    ];

    final index = ((track + 11.25) / 22.5).floor() % 16;
    return directions[index];
  }
}