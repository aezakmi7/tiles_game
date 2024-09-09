import 'package:flutter/material.dart';
import '../../game_screen/game_screen.dart';
import '../menu_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.orange.shade300,
              Colors.orange.shade200,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tiles Game',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                DifficultyButton(
                    text: 'Easy', onPressed: () => _startGame(context, 1)),
                const SizedBox(height: 20),
                DifficultyButton(
                    text: 'Medium', onPressed: () => _startGame(context, 2)),
                const SizedBox(height: 20),
                DifficultyButton(
                    text: 'Hard', onPressed: () => _startGame(context, 3)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _startGame(BuildContext context, int difficulty) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GameScreen(difficulty: difficulty),
      ),
    );
  }
}
