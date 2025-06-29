import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class GradientAppBar extends StatelessWidget {
  final String title;

  const GradientAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      child: Row(
        children: [
          Icon(
            Icons.flight,
            color: Colors.white,
            size: 32,
          ).animate(onPlay: (controller) => controller.repeat())
              .rotate(duration: 3.seconds),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh, color: Colors.white),
          ).animate().scale(delay: 400.ms),
        ],
      ),
    );
  }
}