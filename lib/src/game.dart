part of tetris;

class Game {
  CanvasElement board;
  Element gameScore;
  Shape currentBlock;

  static int width = 10;
  static int height = 20;
  static int cellSize = 30;

  static int linesCleared;
  static CanvasRenderingContext2D context;

  static List<List<int>> boardState;
  static List<int> rowState;

  Game() {
    linesCleared = 0;
    gameScore = Element.div()..id = 'score';
    rowState = List<int>.filled(height, 0);
    boardState =
        List<int>(width).map((_) => List<int>.filled(height, 0)).toList();
  }

  Shape getRandomPiece() {
    int randomInt = Random().nextInt(7);
    switch (randomInt) {
      case 0:
        return IShape(width: width);
      case 1:
        return OShape(width: width);
      case 2:
        return JShape(width: width);
      case 3:
        return LShape(width: width);
      case 4:
        return TShape(width: width);
      case 5:
        return ZShape(width: width);
      case 6:
        return SShape(width: width);
    }
  }

  void clearRows() {
    for (int index = 0; index < rowState.length; index++) {
      int row = rowState[index];

      if (row == width) {
        ImageData imageData =
            context.getImageData(0, 0, cellSize * width, cellSize * index);
        context.putImageData(imageData, 0, cellSize);

        for (int y = index; y > 0; y--) {
          for (int x = 0; x < width; x++) {
            boardState[x][y] = boardState[x][y - 1];
          }
          rowState[y] = rowState[y - 1];
        }

        rowState[0] = 0;
        boardState.forEach((col) => col[0] = 0);
        linesCleared++;
      }
    }
  }
}
