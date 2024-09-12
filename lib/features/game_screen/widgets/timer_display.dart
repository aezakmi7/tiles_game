import 'package:flutter/material.dart';

class TimerDisplay extends StatelessWidget {
  final int remainingTime;

  const TimerDisplay({super.key, required this.remainingTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: -1,
            blurRadius: 3,
            offset: const Offset(0, -2),
          ),
        ],
        color: Color.fromARGB(255, 204, 98, 12),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Text(
            'timer',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          const SizedBox(width: 25),
          Text(
            '${remainingTime ~/ 60}:${(remainingTime % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
