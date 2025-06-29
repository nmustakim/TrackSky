import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/screens/flight_details_sccreen.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/map_screen.dart';
import '../../presentation/screens/search_screen.dart';

final appRouterProvider = Provider<AppRouter>((ref) => AppRouter());

class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/flight/:icao24',
        name: 'flight-details',
        builder: (context, state) => FlightDetailsScreen(
          icao24: state.pathParameters['icao24']!,
        ),
      ),
      GoRoute(
        path: '/map',
        name: 'map',
        builder: (context, state) => const MapScreen(),
      ),
      GoRoute(
        path: '/search',
        name: 'search',
        builder: (context, state) => const SearchScreen(),
      ),
    ],
  );
}