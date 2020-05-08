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
  int level;
  Tile[][] currentLevel = new Tile[numTilesV][numTilesH]; //creates a 2D array with amount of tiles we need
  //describes all the tiles we need for the first level
  int[][] level1 = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
    {1, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1}, 
    {1, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 3, 0, 0, 0, 2, 0, 0, 1}, 
    {1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1}, 
    {1, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 1}, 
    {1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1}, 
    {1, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
    {1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1}, 
    {1, 8, 7, 0, 0, 0, 0, 0, 0, 0, 0, 1, 6, 0, 0, 0, 0, 0, 1}, 
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
  };

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
  void loadlevel1() {   
    this.level = 1;
    for (int i=0; i<numTilesH; i++) {
      for (int j=0; j<numTilesV; j++) {
        if (level1[j][i] == emptyTile) {
          currentLevel[j][i] = new Empty(new PVector(i*tileSize, j*tileSize), emptyImg);
        }
        if (level1[j][i] == solidTile) {
          currentLevel[j][i] = new Solid(new PVector(i*tileSize, j*tileSize), solidImg);
        }
        if (level1[j][i] == diaTile) {
          currentLevel[j][i] = new Dia(new PVector(i*tileSize, j*tileSize), diaImg);
        }
        if (level1[j][i] == cupTile) {
          currentLevel[j][i] = new Cup(new PVector(i*tileSize, j*tileSize), cupImg);
        }
        if (level1[j][i] == fireTile) {
          //currentLevel[j][i] = new Fire(new PVector(i*tileSize,j*tileSize),fireImg);
        }
        if (level1[j][i] == waterTile) {
          //currentLevel[j][i] = new Water(new PVector(i*tileSize,j*tileSize),waterImg);
        }
        if (level1[j][i] == doorTile) {
          currentLevel[j][i] = new Door(new PVector(i*tileSize, j*tileSize), doorImg);
        }
        if (level1[j][i] == playerTile) { // player start position, create empty tile and place Dave here
          currentLevel[j][i] = new Empty(new PVector(i*tileSize, j*tileSize), emptyImg);
          dave.pos.x = (i*tileSize);
          dave.pos.y = (j*tileSize);
        }
        if (level1[j][i] == pipeTile) {
          currentLevel[j][i] = new Pipe(new PVector(i*tileSize, j*tileSize), pipeImg);
        }
        if (level1[j][i] == gemTile) {
          currentLevel[j][i] = new Gem(new PVector(i*tileSize, j*tileSize), gemImg);
        }
        if (level1[j][i] == redDiaTile) {
          currentLevel[j][i] = new Dia(new PVector(i*tileSize, j*tileSize), redDiaImg);
        }
      }
    }
  }
  int getLevel() {
    return level;
  }
  public int getTileSize() {
    return tileSize;
  }
}
