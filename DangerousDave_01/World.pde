class World {
  //initialize vars and objects
  PImage diaImg, cupImg, doorImg, pipeImg, solidImg, gemImg, redDiaImg;
  //numbers used to determine what numbers correspond to what tile
  final int emptyTile = 0;
  final int solidTile = 1;
  final int diaTile = 2;
  final int cupTile = 3;
  final int fireTile = 4;
  final int watertile = 5;
  final int doorTile = 6;
  final int playerTile = 7;
  final int pipeTile = 8;
  final int gemTile = 9;
  final int redDiaTile = 10;
  //size of one tile and number of tiles both Horizontal and Vertical 
  final int tileSize = 60;
  final int numTilesH = 19;
  final int numTilesV = 10;
  int[][] currentLevel = new int[numTilesV][numTilesH]; //creates a 2D array with amount of tiles we need
  //describes all the tiles we need for the first level
  int[][] level1 = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
    {1, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1}, 
    {1, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 3, 0, 0, 0, 2, 0, 0, 1}, 
    {1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1}, 
    {1, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 1}, 
    {1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1}, 
    {1, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
    {1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1}, 
    {1, 8, 7, 0, 0, 0, 0, 0, 0, 0, 0, 1, 6, 0, 0, 0, 0, 0, 1}, 
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
  };

  //constructor
  World(PImage diaImg, PImage cupImg, PImage doorImg, PImage pipeImg, PImage solidImg,PImage gemImg, PImage redDiaImg) {
    this.diaImg = diaImg;
    this.cupImg = cupImg;
    this.doorImg = doorImg;
    this.pipeImg = pipeImg;
    this.solidImg = solidImg;
    this.gemImg = gemImg;
    this.redDiaImg = redDiaImg;
  }
  void display() {
    for (int i=0; i<numTilesH; i++) { // for each column
      for (int j=0; j<numTilesV; j++) { // for each tile in that column
        if (currentLevel[j][i]==playerTile){
        }
        if (currentLevel[j][i]==diaTile) {
          image(diaImg,i*tileSize, j*tileSize);
        }
        if (currentLevel[j][i]==cupTile) {
          image(cupImg,i*tileSize, j*tileSize);
        }
           if (currentLevel[j][i]==doorTile) {
          image(doorImg,i*tileSize, j*tileSize);
        }
         if (currentLevel[j][i]==pipeTile) {
          image(pipeImg,i*tileSize, j*tileSize);
        }
        if (currentLevel[j][i]==solidTile) {
          image(solidImg,i*tileSize, j*tileSize);
        }
         if (currentLevel[j][i]==gemTile) {
          image(gemImg,i*tileSize, j*tileSize);
        }
         if (currentLevel[j][i]==redDiaTile) {
          image(redDiaImg,i*tileSize, j*tileSize);
        }
      }
    }
  }
  
    void loadlevel1() {   
    for(int i=0;i<numTilesH;i++) {
      for(int j=0;j<numTilesV;j++) {
        if(level1[j][i] == playerTile) { // player start position
          currentLevel[j][i] = emptyTile;
          dave.pos.x = (i*tileSize);
          dave.pos.y = (j*tileSize);
        } else {
          currentLevel[j][i] = level1[j][i];
        }
      }
    }
  }
  
  //getters and setters
  int getTileType(PVector pos) {
    float tileX = pos.x/tileSize;
    float tileY = pos.y/tileSize;
    return currentLevel[int(tileX)][int(tileY)];
  }
  void setTileType(PVector pos, int newTile) {
    float tileX = pos.x/tileSize;
    float tileY = pos.y/tileSize;
    currentLevel[int(tileX)][int(tileY)] = newTile;
  }
}
