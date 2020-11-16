part of tetris;

class IShape extends Shape {
  IShape({int width}) {
    tiles[0] = Tile((width / 2 - 2).floor(), -1);
    tiles[1] = Tile((width / 2 - 1).floor(), -1);
    tiles[2] = Tile((width / 2).floor(), -1);
    tiles[3] = Tile((width / 2 + 1).floor(), -1);
    rotationTile = tiles[1];
    color = 'cyan';
  }
}

class OShape extends Shape {
  OShape({int width}) {
    tiles[0] = Tile((width / 2).floor(), -1);
    tiles[1] = Tile((width / 2 + 1).floor(), -1);
    tiles[2] = Tile((width / 2).floor(), 0);
    tiles[3] = Tile((width / 2 + 1).floor(), 0);
    rotationTile = tiles[1];
    color = 'yellow';
  }
}

class JShape extends Shape {
  JShape({int width}) {
    tiles[0] = Tile((width / 2 - 1).floor(), 0);
    tiles[1] = Tile((width / 2).floor(), 0);
    tiles[2] = Tile((width / 2 + 1).floor(), 0);
    tiles[3] = Tile((width / 2 - 1).floor(), -1);
    rotationTile = tiles[1];
    color = 'blue';
  }
}

class LShape extends Shape {
  LShape({int width}) {
    tiles[0] = Tile((width / 2 - 1).floor(), 0);
    tiles[1] = Tile((width / 2).floor(), 0);
    tiles[2] = Tile((width / 2 + 1).floor(), 0);
    tiles[3] = Tile((width / 2 + 1).floor(), -1);
    rotationTile = tiles[1];
    color = 'orange';
  }
}

class TShape extends Shape {
  TShape({int width}) {
    tiles[0] = Tile((width / 2 - 1).floor(), 0);
    tiles[1] = Tile((width / 2).floor(), 0);
    tiles[2] = Tile((width / 2 + 1).floor(), 0);
    tiles[3] = Tile((width / 2).floor(), -1);
    rotationTile = tiles[1];
    color = 'purple';
  }
}

class ZShape extends Shape {
  ZShape({int width}) {
    tiles[0] = Tile((width / 2 - 1).floor(), 0);
    tiles[1] = Tile((width / 2).floor(), 0);
    tiles[2] = Tile((width / 2).floor(), -1);
    tiles[3] = Tile((width / 2 + 1).floor(), -1);
    rotationTile = tiles[1];
    color = 'red';
  }
}

class SShape extends Shape {
  SShape({int width}) {
    tiles[0] = Tile((width / 2 - 1).floor(), -1);
    tiles[1] = Tile((width / 2).floor(), -1);
    tiles[2] = Tile((width / 2).floor(), 0);
    tiles[3] = Tile((width / 2 + 1).floor(), 0);
    rotationTile = tiles[1];
    color = 'green';
  }
}
