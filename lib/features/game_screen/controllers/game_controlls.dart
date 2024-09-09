import 'package:flutter/material.dart';

import '../widgets/timer_display.dart';

class GameControls extends StatelessWidget {
  final int remainingTime;
  final VoidCallback onRestart;

  const GameControls({
    super.key,
    required this.remainingTime,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.orange.shade200,
            Colors.orange.shade300,
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TimerDisplay(remainingTime: remainingTime),
          ElevatedButton.icon(
            onPressed: onRestart,
            icon: const Icon(Icons.refresh, color: Colors.white),
            label: const Text('Restart',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              surfaceTintColor: Colors.white,
              shadowColor: Colors.black,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
            ),
          ),
        ],
      ),
    );
  }
}
