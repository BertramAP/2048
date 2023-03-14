class Board {
  Tile[][] tileMap;
  color startColor = color(238, 228, 218);
  color endColor = color(255, 234, 0);
  //rgb = lerpColor(startColor, endColor, 0.1f);
  Board() {
    tileMap = new Tile[][] {
      new Tile[] {new Tile(0), new Tile(0), new Tile(0), new Tile(0)},
      new Tile[] {new Tile(0), new Tile(0), new Tile(0), new Tile(0)},
      new Tile[] {new Tile(0), new Tile(0), new Tile(0), new Tile(0)},
      new Tile[] {new Tile(0), new Tile(0), new Tile(0), new Tile(0)},
    };
    
  }
}
