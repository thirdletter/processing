class World {
  //initialize vars and objects
  //numbers used to determine what numbers correspond to what tile
  final int emptyTile = 0;
  final int solidTile = 1;
  final int diaTile = 2;
  final int cupTile = 3;
  final int fireTile = 4;
  final int waterTile = 5;
  final int doorTile = 6;
  final int playerTile = 7;
  final int pipeTile = 8;
  final int gemTile = 9;
  final int redDiaTile = 10;
  //size of one tile and number of tiles both Horizontal and Vertical 
  final int tileSize = 60;
  final int numTilesH = 19;
  final int numTilesV = 10;
  String levelName;
  Tile[][] currentLevel = new Tile[numTilesV][numTilesH]; //creates a 2D array with amount of tiles we need
  //describes all the tiles we need for the first level

  //constructor
  World() {
  }
  void display() {
    for (int i=0; i<numTilesH; i++) { // for each column
      for (int j=0; j<numTilesV; j++) { // for each tile in that column
        currentLevel[j][i].display();
      }
    }
  }
  void loadLevel(Table newLevel) {
    levelName = newLevel.getString(numTilesV, 0);
    for (int i=0; i<numTilesH; i++) {
      for (int j=0; j<numTilesV; j++) {
        if (newLevel.getInt(j, i) == emptyTile) {
          currentLevel[j][i] = new Empty(new PVector(i*tileSize, j*tileSize), emptyImg);
        }
        if (newLevel.getInt(j, i) == solidTile) {
          currentLevel[j][i] = new Solid(new PVector(i*tileSize, j*tileSize), solidImg);
        }
        if (newLevel.getInt(j, i) == diaTile) {
          currentLevel[j][i] = new Dia(new PVector(i*tileSize, j*tileSize), diaImg);
        }
        if (newLevel.getInt(j, i) == cupTile) {
          currentLevel[j][i] = new Cup(new PVector(i*tileSize, j*tileSize), cupImg);
        }
        if (newLevel.getInt(j, i) == fireTile) {
          //currentLevel[j][i] = new Fire(new PVector(i*tileSize,j*tileSize),fireImg);
        }
        if (newLevel.getInt(j, i) == waterTile) {
          //currentLevel[j][i] = new Water(new PVector(i*tileSize,j*tileSize),waterImg);
        }
        if (newLevel.getInt(j, i) == doorTile) {
          currentLevel[j][i] = new Door(new PVector(i*tileSize, j*tileSize), doorImg);
        }
        if (newLevel.getInt(j, i) == playerTile) { // player start position, create empty tile and place Dave here
          currentLevel[j][i] = new Empty(new PVector(i*tileSize, j*tileSize), emptyImg);
          dave.pos.x = (i*tileSize);
          dave.pos.y = (j*tileSize);
        }
        if (newLevel.getInt(j, i) == pipeTile) {
          currentLevel[j][i] = new Pipe(new PVector(i*tileSize, j*tileSize), pipeImg);
        }
        if (newLevel.getInt(j, i) == gemTile) {
          currentLevel[j][i] = new Gem(new PVector(i*tileSize, j*tileSize), gemImg);
        }
        if (newLevel.getInt(j, i) == redDiaTile) {
          currentLevel[j][i] = new Dia(new PVector(i*tileSize, j*tileSize), redDiaImg);
        }
      }
    }
  }
  String getLevelName() {
    return levelName;
  }
  public int getTileSize() {
    return tileSize;
  }
}
