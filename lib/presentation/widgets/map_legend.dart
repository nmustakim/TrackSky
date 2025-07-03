
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MapLegend extends StatelessWidget {
  const MapLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Legend',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildLegendItem(
            context,
            Icons.flight,
            'Active Flight',
            Colors.blue,
          ),
          _buildLegendItem(
            context,
            Icons.flight,
            'Selected Flight',
            Colors.orange,
          ),
          _buildLegendItem(
            context,
            Icons.my_location,
            'Your Location',
            Colors.blue,
          ),
        ],
      ),
    ).animate().slideX(begin: -1, duration: 400.ms).fadeIn();
  }

  Widget _buildLegendItem(
      BuildContext context,
      IconData icon,
      String label,
      Color color,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              border: Border.all(color: color, width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(icon, size: 12, color: color),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}