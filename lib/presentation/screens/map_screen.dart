import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/flight_model.dart';
import '../providers.dart';
import '../widgets/flight_marker.dart';
import '../widgets/map_controls.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> with TickerProviderStateMixin {
  final MapController _mapController = MapController();
  late AnimationController _pulseController;
  FlightModel? _selectedFlight;
  bool _isTrackingUser = false;
  double _currentZoom = 6.0;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    // Request location permission on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(locationProvider.notifier).requestLocationPermission();
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final flightListAsync = ref.watch(flightListProvider);
    final userLocation = ref.watch(locationProvider);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.nightGradient),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    child: Stack(
                      children: [
                        _buildMap(flightListAsync, userLocation),
                        _buildMapControls(),
                        if (_selectedFlight != null) _buildFlightInfo(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Live Flight Map',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            onPressed: () => ref.refresh(flightListProvider),
            icon: const Icon(Icons.refresh, color: Colors.white),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ).animate(onPlay: (controller) => controller.repeat())
              .rotate(duration: const Duration(seconds: 2)),
        ],
      ).animate().slideX(begin: -0.3, duration: const Duration(milliseconds: 600)).fadeIn(),
    );
  }

  Widget _buildMap(AsyncValue<List<FlightModel>> flightListAsync, AsyncValue<Position?> userLocation) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(

        initialCenter: const LatLng(24.226992725399523, 89.96753445929029),
        initialZoom: _currentZoom,
        minZoom: 2.0,
        maxZoom: 18.0,
        onTap: (tapPosition, point) {
          setState(() {
            _selectedFlight = null;
          });
        },
        onPositionChanged: (position, hasGesture) {
          if (hasGesture) {
            setState(() {
              _currentZoom = position.zoom;
              _isTrackingUser = false;
            });
          }
        },
      ),
      children: [
        // Base map layer
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.skytracker.app',
          maxZoom: 18,
        ),

        // User location marker
        if (userLocation.hasValue && userLocation.value != null)
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(
                  userLocation.value!.latitude,
                  userLocation.value!.longitude,
                ),
                width: 40,
                height: 40,
                child: AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, child) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.withOpacity(0.3 * (1 - _pulseController.value)),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      transform: Matrix4.identity()
                        ..scale(1.0 + (_pulseController.value * 0.5)),
                      child: const Icon(
                        Icons.my_location,
                        color: Colors.blue,
                        size: 20,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

        // Flight markers
        flightListAsync.when(
          data: (flights) => MarkerLayer(
            markers: flights
                .where((flight) =>
            flight.latitude != null &&
                flight.longitude != null &&
                (flight.onGround == null || !flight.onGround!))
                .take(200) // Limit for performance
                .map((flight) => Marker(
              point: LatLng(flight.latitude!, flight.longitude!),
              width: 30,
              height: 30,
              child: FlightMarker(
                flight: flight,
                isSelected: _selectedFlight?.icao24 == flight.icao24,
                onTap: () {
                  setState(() {
                    _selectedFlight = flight;
                  });
                  _animateToFlight(flight);
                },
              ),
            ))
                .toList(),
          ),
          loading: () => const MarkerLayer(markers: []),
          error: (_, __) => const MarkerLayer(markers: []),
        ),
      ],
    ).animate().fadeIn(duration: const Duration(milliseconds: 800));
  }

  Widget _buildMapControls() {
    return Positioned(
      right: 16,
      top: 80,
      child: MapControls(
        onZoomIn: () {
          setState(() {
            _currentZoom = (_currentZoom + 1).clamp(2.0, 18.0);
          });
          _mapController.move(_mapController.camera.center, _currentZoom);
        },
        onZoomOut: () {
          setState(() {
            _currentZoom = (_currentZoom - 1).clamp(2.0, 18.0);
          });
          _mapController.move(_mapController.camera.center, _currentZoom);
        },
        onMyLocation: () async {
          final location = ref.read(locationProvider);
          if (location.hasValue && location.value != null) {
            setState(() {
              _currentZoom = 12.0;
              _isTrackingUser = true;
            });
            _mapController.move(
              LatLng(location.value!.latitude, location.value!.longitude),
              _currentZoom,
            );
          }
        },
        onLayerToggle: () {
          // Implement layer toggle functionality if needed
        },
      ).animate().slideX(begin: 1, duration: const Duration(milliseconds: 600)).fadeIn(),
    );
  }

  Widget _buildFlightInfo() {
    if (_selectedFlight == null) return const SizedBox.shrink();

    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          gradient: AppTheme.skyGradient,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _selectedFlight!.callsign?.trim() ?? 'Unknown',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _selectedFlight!.originCountry ?? 'Unknown Country',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => context.push('/flight/${_selectedFlight!.icao24}'),
                      icon: const Icon(Icons.info_outline),
                      style: IconButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _selectedFlight = null;
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildInfoChip(
                  Icons.speed,
                  '${_selectedFlight!.velocity?.toInt() ?? 0} m/s',
                ),
                const SizedBox(width: 8),
                _buildInfoChip(
                  Icons.height,
                  '${_selectedFlight!.baroAltitude?.toInt() ?? 0} m',
                ),
                const SizedBox(width: 8),
                _buildInfoChip(
                  Icons.navigation,
                  '${_selectedFlight!.trueTrack?.toInt() ?? 0}°',
                ),
              ],
            ),
          ],
        ),
      ).animate().slideY(begin: 1, duration: const Duration(milliseconds: 400)).fadeIn(),
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Theme.of(context).primaryColor),
          const SizedBox(width: 4),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _animateToFlight(FlightModel flight) {
    if (flight.latitude != null && flight.longitude != null) {
      setState(() {
        _currentZoom = 12.0;
      });
      _mapController.move(
        LatLng(flight.latitude!, flight.longitude!),
        _currentZoom,
      );
    }
  }
}