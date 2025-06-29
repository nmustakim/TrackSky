import '../entities/flight_entity.dart';

abstract class FlightRepository {
  Future<List<FlightEntity>> getAllFlights();
  Future<List<FlightEntity>> getFlightsByCountry(String country);
  Future<FlightEntity?> getFlightByIcao24(String icao24);
}
