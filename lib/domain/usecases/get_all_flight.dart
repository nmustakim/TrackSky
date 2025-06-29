import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/providers.dart';
import '../repositories/flight_repository.dart';
import '../entities/flight_entity.dart';

class GetAllFlightsUseCase {
  final FlightRepository repository;

  GetAllFlightsUseCase(this.repository);

  Future<List<FlightEntity>> call() {
    return repository.getAllFlights();
  }
}

final getAllFlightsUseCaseProvider = Provider<GetAllFlightsUseCase>((ref) {
  return GetAllFlightsUseCase(ref.read(flightRepositoryProvider));
});