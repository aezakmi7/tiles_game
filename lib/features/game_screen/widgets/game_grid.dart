import 'package:flutter/material.dart';

class GameGrid extends StatelessWidget {
  final List<List<int>> grid;
  final int gridSize;
  final Function(int, int) onTileTap;
  final List<String> tileImages;

  const GameGrid({
    super.key,
    required this.grid,
    required this.gridSize,
    required this.onTileTap,
    required this.tileImages,
  });

  @override
  Widget build(BuildContext context) {
    double gridWidth = (42.0 * gridSize) + (15.0 * (gridSize - 1));
    double gridHeight = (44.0 * gridSize) + (15.0 * (gridSize - 1));

    return Center(
      child: SizedBox(
        width: gridWidth,
        height: gridHeight,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridSize,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 42 / 44,
          ),
          itemCount: gridSize * gridSize,
          itemBuilder: (context, index) {
            int row = index ~/ gridSize;
            int col = index % gridSize;
            if (grid[row][col] == -1) {
              return const SizedBox(); // Return an empty widget for the top-left corner
            }
            return GestureDetector(
              onTap: () => onTileTap(row, col),
              child: Container(
                width: 42,
                height: 44,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(tileImages[grid[row][col]]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
