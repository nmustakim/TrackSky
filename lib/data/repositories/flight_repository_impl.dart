import 'package:dio/dio.dart';
import '../../domain/repositories/flight_repository.dart';
import '../models/flight_model.dart';

class FlightRepositoryImpl implements FlightRepository {
  final Dio _dio;

  FlightRepositoryImpl(this._dio);

  @override
  Future<List<FlightModel>> getAllFlights() async {
    try {
      final response = await _dio.get('/states/all');
      final flightResponse = FlightResponse.fromJson(response.data);
      return flightResponse.states;
    } catch (e) {
      throw Exception('Failed to fetch flights: $e');
    }
  }

  @override
  Future<List<FlightModel>> getFlightsByCountry(String country) async {
    try {
      final response = await _dio.get('/states/all');
      final flightResponse = FlightResponse.fromJson(response.data);
      return flightResponse.states
          .where((flight) =>
      flight.originCountry?.toLowerCase().contains(country.toLowerCase()) ?? false)
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch flights by country: $e');
    }
  }

  @override
  Future<FlightModel?> getFlightByIcao24(String icao24) async {
    try {
      final response = await _dio.get('/states/all', queryParameters: {
        'icao24': icao24,
      });
      final flightResponse = FlightResponse.fromJson(response.data);
      return flightResponse.states.isNotEmpty ? flightResponse.states.first : null;
    } catch (e) {
      throw Exception('Failed to fetch flight details: $e');
    }
  }
}