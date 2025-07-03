import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
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

class LocationNotifier extends StateNotifier<AsyncValue<Position?>> {
  LocationNotifier() : super(const AsyncValue.data(null));

  Future<void> requestLocationPermission() async {
    state = const AsyncValue.loading();

    try {
      final permission = await Permission.location.request();

      if (permission.isGranted) {
        await getCurrentLocation();
      } else {
        state = const AsyncValue.error('Location permission denied', StackTrace.empty);
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      state = AsyncValue.data(position);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final locationProvider = StateNotifierProvider<LocationNotifier, AsyncValue<Position?>>((ref) {
  return LocationNotifier();
});