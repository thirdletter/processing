PImage picture;
int newW, newH;
 
int gridX = 3; //number of tiles boxes along X
int gridY = 3; //number of tiles boxes along Y
int gridSize = gridX * gridY; //total number of tiles in game
int tileWidth, tileHeight; //width and height of each tile
int gapX, gapY; //X and Y position of the gap in the tiles, eg the free space used to move the ther tiles
int mousePosX, mousePosY; //position of mouse in terms of the grid system
int selectX = -1, selectY = -1; //x and y position of the currently selected tile
 
IntList shuffleOrder = new IntList(); //used to shuffle the tiles in the tiles array
PImage[] tiles = new PImage[gridSize]; //hold all the image tiles
int[][] grid = new int[gridX][gridY]; //grid system that controls the movement of the tiles
boolean selected = false; //keeps track of wether a tile is currently selected
boolean gameStarted = false; //keeps track of wether the game has started or not
 
int counter = 0; //used to count through the tiles array
 
void setup() {
  picture = loadImage("numbers.jpg");
  newW = picture.width; //canvas size is always equal to the picture that is being used
  newH = picture.height;
  size(newW, newH);
 
  tileWidth = newW/gridX; //tile width is an integer an therefore sometimes the is space at the bottom or right side that is not being used
  tileHeight = newH/gridY; //although techincally the picture would still go on there, but theres not tiles there..
 
  for (int i = 0; i < gridSize; i++) {
    shuffleOrder.append(i); //fill the shuffle array with the numbers 1,2,3,4... each on being assigned to one tile of the big image
  }
  for (int y = 0; y < gridY; y++) {
    for (int x = 0; x < gridX; x++) {
      tiles[counter] = picture.get(x*tileWidth, y*tileHeight, tileWidth, tileHeight); //fill the tiles array with the pieces of the image
      counter++;
    }
  }
  fillGrid(); //transfers the numbers from the so far un-shuffled IntList to the grid to display each piece in its original location
}
 
void draw() {
  background(255, 0, 0);
  mousePosX = int(mouseX/tileWidth); //constantly tracks the mouse's grid position
  mousePosY = int(mouseY/tileHeight);
 
  counter = 0;
  for (int y = 0; y < gridY; y++) {
    for (int x = 0; x < gridX; x++) {
      if (grid[x][y] != -1) //draw the images according to the number saved in the grid which is then looked up in the tiles array. -1 is the gap, so dont draw that specific tile
        image(tiles[grid[x][y]], x*tileWidth, y*tileHeight);
      counter++;
    }
  }
 
  if (nextToGap() && gameStarted) {
    outlineTile(mousePosX, mousePosY); //outline the tile if the mouse is over it and it is next to the gap (only N,E,S,W)
  }
 
  if (selectX != -1) {
    outlineTile(selectX, selectY); //also outline the currently selected tile
  }
}
 
void fillGrid() {
  counter = 0;
  for (int y = 0; y < gridY; y++) {
    for (int x = 0; x < gridX; x++) {
      grid[x][y] = shuffleOrder.get(counter); //places the integers from the shuffle IntList into the grid
      counter++;
    }
  }
}
 
void removeOne() {
  gapX = int(random(gridX));
  gapY = int(random(gridY));
  grid[gapX][gapY] = -1; //selectes a random piece and makes it the gap, aka invisible so that other pieces can be pushed over it
}
 
void outlineTile(int x, int y) {
  noFill();
  stroke(255);
  strokeWeight(2);
  rect(x*tileWidth, y*tileHeight, tileWidth, tileHeight);
}
 
boolean nextToGap() { //checks if the mouse is in a tile above, below or left, right of the current gap
  if (((mousePosX == gapX-1 || mousePosX == gapX+1) && mousePosY == gapY)|| ((mousePosY == gapY-1 || mousePosY == gapY+1) && mousePosX == gapX))
    return true;
  else
    return false;
}
 
void keyPressed() { //spacebar shuffles the Intlist which is then updated into the grid and one is removed as the gap
  if (key == ' ') {
    shuffleOrder.shuffle();
    fillGrid();
    removeOne();
    gameStarted = true;
  }
}
 
void mousePressed() {
  if (nextToGap()) {
    if (selected && mousePosX == selectX && mousePosY == selectY) { //if you click the selected tile again it becomes unselected
      selectX = -1;
      selectY = -1;
      selected = false;
    } 
    else { //if nothing is yet selected, select the tile that the mouse clicked on
      selectX = mousePosX;
      selectY = mousePosY;
      selected = true;
    }
  }
  if (selected && mousePosX == gapX && mousePosY == gapY) {
    grid[mousePosX][mousePosY] = grid[selectX][selectY];
    grid[selectX][selectY] = -1;  //if a tile is selected and the user clicks on the gap, the two are swapped,
    gapX = selectX; //so in other words the selected tile is moved to the previous gap location
    gapY = selectY;
    selectX = -1;
    selectY = -1;
    selected = false;
  }
}
