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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/images/modal_sheet_bottom.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TimerDisplay(remainingTime: remainingTime),
              GestureDetector(
                onTap: onRestart,
                child: Image.asset(
                  'lib/assets/buttons/button_restart.png',
                  width: 179,
                  height: 44,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
