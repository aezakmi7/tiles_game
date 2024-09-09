import 'package:flutter/material.dart';

class TimerDisplay extends StatelessWidget {
  final int remainingTime;

  const TimerDisplay({super.key, required this.remainingTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.orange.shade600,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.timer, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            '${remainingTime ~/ 60}:${(remainingTime % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
