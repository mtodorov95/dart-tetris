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
}
