import 'package:flutter/material.dart';
import 'dart:async';
import '../game_screen.dart';

class GameScreen extends StatefulWidget {
  final int difficulty;

  const GameScreen({super.key, required this.difficulty});

  @override
  // ignore: library_private_types_in_public_api
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<List<int>> grid;
  late int gridSize;
  late int timerDuration;
  late Timer timer;
  int remainingTime = 0;

  final List<Color> tileColors = [
    Colors.teal,
    Colors.lightGreen,
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.red,
  ];

  @override
  void initState() {
    super.initState();
    initializeGame();
  }

  void initializeGame() {
    switch (widget.difficulty) {
      case 1:
        gridSize = 4;
        timerDuration = 90; // 1:30
        break;
      case 2:
        gridSize = 5;
        timerDuration = 150; // 2:30
        break;
      case 3:
        gridSize = 6;
        timerDuration = 210; // 3:30
        break;
      default:
        gridSize = 4;
        timerDuration = 90;
    }
    remainingTime = timerDuration;
    grid = List.generate(gridSize, (_) => List.filled(gridSize, 1));
    _addNonClickableTiles();
    startTimer();
  }

  void _addNonClickableTiles() {
    grid[0][0] = 0; // Make top-left corner non-clickable
    for (int i = 1; i < gridSize; i++) {
      grid[i][0] = 0; // First column, excluding the top-left corner
      grid[0][i] = 0; // First row, excluding the top-left corner
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          timer.cancel();
          // Handle game over
        }
      });
    });
  }

  void incrementTile(int row, int col) {
    setState(() {
      if (grid[row][col] != 0) {
        grid[row][col] = (grid[row][col] % 5) + 1;
      }
    });
  }

  void restartGame() {
    setState(() {
      initializeGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const TopModalSheet(),
          Expanded(
            child: GameGrid(
              grid: grid,
              gridSize: gridSize,
              onTileTap: incrementTile,
              tileColors: tileColors,
            ),
          ),
          GameControls(
            remainingTime: remainingTime,
            onRestart: restartGame,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
