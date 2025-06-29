import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../providers.dart';
import '../widgets/flight_card.dart';
import '../widgets/gradient_app_bar.dart';
import '../widgets/floating_navigation.dart';
import '../../core/theme/app_theme.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flightListAsync = ref.watch(flightListProvider);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.skyGradient),
        child: SafeArea(
          child: Column(
            children: [
              const GradientAppBar(title: 'Live Flights')
                  .animate()
                  .slideY(begin: -0.5, duration: 600.ms)
                  .fadeIn(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: flightListAsync.when(
                    data: (flights) => ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: flights.take(50).length,
                      itemBuilder: (context, index) {
                        final flight = flights[index];
                        return FlightCard(
                          flight: flight,
                          onTap: () => context.push('/flight/${flight.icao24}'),
                        )
                            .animate(delay: (index * 50).ms)
                            .slideX(begin: 0.3, duration: 400.ms)
                            .fadeIn();
                      },
                    ),
                    loading: () =>  Center(
                      child: const CircularProgressIndicator()
                          .animate(onPlay: (controller) => controller.repeat())
                          .rotate(duration: 2.seconds),
                    ),
                    error: (error, stack) => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline, size: 64, color: Colors.red)
                              .animate()
                              .scale(duration: 400.ms)
                              .shake(),
                          const SizedBox(height: 16),
                          Text('Error: $error'),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => ref.refresh(flightListProvider),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const FloatingNavigation(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}