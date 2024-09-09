import 'package:flutter/material.dart';

class GameGrid extends StatelessWidget {
  final List<List<int>> grid;
  final int gridSize;
  final Function(int, int) onTileTap;
  final List<Color> tileColors;

  const GameGrid({
    super.key,
    required this.grid,
    required this.gridSize,
    required this.onTileTap,
    required this.tileColors,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridSize,
        childAspectRatio: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: gridSize * gridSize,
      itemBuilder: (context, index) {
        int row = index ~/ gridSize;
        int col = index % gridSize;
        return GestureDetector(
          onTap: () => onTileTap(row, col),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  grid[row][col] == 0
                      ? tileColors[0].withOpacity(0.7)
                      : tileColors[grid[row][col]].withOpacity(0.7),
                  grid[row][col] == 0
                      ? tileColors[0]
                      : tileColors[grid[row][col]],
                ],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: grid[row][col] == 0
                  ? null
                  : Text(
                      grid[row][col].toString(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
