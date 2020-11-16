part of tetris;

class Game {
  CanvasElement board;
  Element gameScore;
  Shape currentShape;

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

  bool validMove() {
    for (Tile tile in currentShape.tiles) {
      if (tile.x >= width ||
          tile.x < 0 ||
          tile.y >= height ||
          tile.y < 0 ||
          boardState[tile.x][tile.y] == 1) {
        return false;
      }
    }
    return true;
  }

  bool pieceMoving(String s) {
    bool pieceIsMoving = true;
    context.fillStyle = 'grey';
    currentShape.tiles.forEach((Tile tile) {
      context.fillRect(
          tile.x * cellSize, tile.y * cellSize, cellSize, cellSize);
    });

    if (s == 'rotate') {
      currentShape.rotateRight();
    } else {
      currentShape.move(s);
    }

    if (!(pieceIsMoving = validMove())) {
      if (s == 'rotate') currentShape.rotateLeft();
      if (s == 'left') currentShape.move('roght');
      if (s == 'right') currentShape.move('left');
      if (s == 'down') currentShape.move('up');
      if (s == 'up') currentShape.move('down');
    }

    context.fillStyle = currentShape.color;
    currentShape.tiles.forEach((tile) {
      context.fillRect(
          tile.x * cellSize, tile.y * cellSize, cellSize, cellSize);
    });

    return pieceIsMoving;
  }

  void updateGame(Timer timer) {
    gameScore.setInnerHtml('<p>Score: ${linesCleared}</p>');
    if (!pieceMoving('down')) {
      currentShape.tiles.forEach((tile) {
        boardState[tile.x][tile.y] = 1;
        rowState[tile.y]++;
      });
      clearRows();
      currentShape = getRandomPiece();
      if (!pieceMoving('down')) {
        timer.cancel();
      }
    }
  }

  void initializeCanvas() {
    board = Element.html('<canvas/>');
    board.width = width * cellSize;
    board.height = height * cellSize;
    context = board.context2D;
    context.fillStyle = 'grey';
    context.fillRect(0, 0, board.width, board.height);
  }

  void handleKeyDown(Timer timer) {
    document.onKeyDown.listen((event) {
      if (timer.isActive) {
        if (event.keyCode == 37) pieceMoving('left');
        if (event.keyCode == 38) pieceMoving('rotate');
        if (event.keyCode == 39) pieceMoving('right');
        if (event.keyCode == 40) pieceMoving('down');
        if (event.keyCode == 32) while (pieceMoving('down')) {}
        ;
      }
    });
  }
}
