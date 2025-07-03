import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../data/models/flight_model.dart' show FlightModel;

class FlightMarker extends StatelessWidget {
  final FlightModel flight;
  final bool isSelected;
  final VoidCallback onTap;

  const FlightMarker({
    super.key,
    required this.flight,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Transform.rotate(
        angle: (flight.trueTrack ?? 0) * (3.14159 / 180), // Convert to radians
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange : Colors.blue,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: (isSelected ? Colors.orange : Colors.blue).withOpacity(0.5),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const Icon(
            Icons.flight,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    ).animate(target: isSelected ? 1 : 0)
        .scale(end: Offset.fromDirection(1.3), duration: 300.ms)
        .then()
        .shimmer(duration: 1.seconds);
  }
}