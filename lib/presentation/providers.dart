import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../data/repositories/flight_repository_impl.dart';
import '../../domain/repositories/flight_repository.dart';
import '../../data/models/flight_model.dart';
import '../domain/usecases/get_all_flight.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://opensky-network.org/api',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));
  return dio;
});

final flightRepositoryProvider = Provider<FlightRepository>((ref) {
  return FlightRepositoryImpl(ref.read(dioProvider));
});

final flightListProvider = FutureProvider<List<FlightModel>>((ref) async {
  final useCase = ref.read(getAllFlightsUseCaseProvider);
  return useCase.call();
});

final selectedFlightProvider = StateProvider<FlightModel?>((ref) => null);