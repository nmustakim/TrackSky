import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MapControls extends StatelessWidget {
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;
  final VoidCallback onMyLocation;
  final VoidCallback onLayerToggle;

  const MapControls({
    super.key,
    required this.onZoomIn,
    required this.onZoomOut,
    required this.onMyLocation,
    required this.onLayerToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildControlButton(
          context,
          Icons.add,
          onZoomIn,
        ),
        const SizedBox(height: 8),
        _buildControlButton(
          context,
          Icons.remove,
          onZoomOut,
        ),
        const SizedBox(height: 16),
        _buildControlButton(
          context,
          Icons.my_location,
          onMyLocation,
        ),
        const SizedBox(height: 8),
        _buildControlButton(
          context,
          Icons.layers,
          onLayerToggle,
        ),
      ],
    );
  }

  Widget _buildControlButton(
      BuildContext context,
      IconData icon,
      VoidCallback onPressed,
      ) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        style: IconButton.styleFrom(
          foregroundColor: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(12),
        ),
      ),
    ).animate().scale(delay: 100.ms, duration: 200.ms);
  }
}