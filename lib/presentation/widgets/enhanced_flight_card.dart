import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_constants.dart';
import '../../data/models/flight_model.dart';
import '../../core/theme/app_theme.dart';

class EnhancedFlightCard extends StatelessWidget {
  final FlightModel flight;
  final VoidCallback onTap;

  const EnhancedFlightCard({
    super.key,
    required this.flight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 8,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.cardColor,
                theme.cardColor.withOpacity(0.9),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 16),
              _buildFlightInfo(context),
              const SizedBox(height: 16),
              _buildLocationInfo(context),
            ],
          ),
        ),
      ),
    ).animate().shimmer(delay: 200.ms, duration: 1.5.seconds);
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
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
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  flight.callsign?.trim() ?? 'Unknown Flight',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                flight.originCountry ?? 'Unknown Country',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            flight.onGround == true ? Icons.flight_land : Icons.flight_takeoff,
            color: Theme.of(context).primaryColor,
            size: 28,
          ),
        ),
      ],
    );
  }

  Widget _buildFlightInfo(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildInfoItem(
            context,
            'Speed',
            FlightUtils.formatVelocity(flight.velocity),
            Icons.speed,
          ),
        ),
        Expanded(
          child: _buildInfoItem(
            context,
            'Altitude',
            FlightUtils.formatAltitude(flight.baroAltitude),
            Icons.height,
          ),
        ),
        Expanded(
          child: _buildInfoItem(
            context,
            'Direction',
            FlightUtils.getFlightDirection(flight.trueTrack),
            Icons.navigation,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            color: Theme.of(context).primaryColor,
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${flight.latitude?.toStringAsFixed(4) ?? 'N/A'}, ${flight.longitude?.toStringAsFixed(4) ?? 'N/A'}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: flight.onGround == true ? Colors.red : Colors.green,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              FlightUtils.getFlightStatus(flight),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
      BuildContext context,
      String label,
      String value,
      IconData icon,
      ) {
    return Column(
      children: [
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: 20,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey[600],
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}