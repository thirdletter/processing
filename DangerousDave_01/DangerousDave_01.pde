//initialize vars and objects
PImage emptyImg, daveImg, diaImg, cupImg, doorImg, pipeImg, solidImg, gemImg, redDiaImg;
Dave dave;
World world;
Table level1, level2;
String playerName;

//setup runs once at start of program
void setup() {
  size(1140, 600);
  loadAssets();
}

//draw is executed every frame, 60fps by default
void draw() {
  //background(68,36,52);
  dave.physics();
  for (int i=0; i<world.numTilesH; i++) { // for each column
    for (int j=0; j<world.numTilesV; j++) { // for each tile in that column
      dave.collision(world.currentLevel[j][i]);
      if (world.currentLevel[j][i].getTaken()) { //check if the tile has been taken by the player
        //and change the current tile to an empty tile if that is the case
        world.currentLevel[j][i] = new Empty(new PVector(i*world.tileSize, j*world.tileSize), emptyImg);
      }
    }
  }
  world.display();
  dave.display();
  showHUD();
}


//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the keyCode variable
void keyPressed() {
  if (keyCode==LEFT) {
    dave.pressLeft(true);
  }
  if (keyCode==RIGHT) {
    dave.pressRight(true);
  }
  if (keyCode==UP) {
    dave.jump();
  }
}

void keyReleased() {
  if (keyCode==LEFT) {
    dave.pressLeft(false);
  }
  if (keyCode==RIGHT) {
    dave.pressRight(false);
  }
}

//mousePressed is called once after every time a mouse button is pressed.
//The mouseButton variable can be used to determine which button has been pressed.
void mousePressed() {
}

//load images
private void loadAssets() {
  //images
  emptyImg = loadImage("emptySprite.png");
  daveImg = loadImage("walkSprite.png");
  diaImg = loadImage("diaSprite.png");
  cupImg = loadImage("cupSprite.png");
  doorImg = loadImage("doorSprite.png");
  pipeImg = loadImage("pipeSprite.png");
  solidImg = loadImage("solidSprite.png");
  gemImg = loadImage("gemSprite.png");
  redDiaImg = loadImage("redDiaSprite.png");
  //levels
  level1 = loadTable("level1.csv");
  level2 = loadTable("level2.csv");
  //objects
  dave = new Dave(daveImg);
  world = new World();  
  //load playername
  String[]newPlayerName = loadStrings("playerName.txt");
  playerName = newPlayerName[0];
  world.loadLevel(level1);
}

void showHUD() {
  textSize(30);
  textAlign(LEFT);
  text("Score: "+dave.getScore(), 20, 35);
  text("Player Name: "+playerName, 20, 580);
  textAlign(CENTER);
  text(world.getLevelName(), width/2, 35);
  if (dave.getCupState()) {
    text("!!! GO THROUGH THE DOOR !!!", width/2, 580);
  }
  textAlign(RIGHT);
  text("Daves: " + dave.getCurLives(), width-20, 35);
}

//copied from file IO theory and changed to fit our game
void saveScoreToFile() {
  Table newScores = new Table();
  newScores.addColumn("Date / Time");
  newScores.addColumn("Player");
  newScores.addColumn("Score");

  //load the existing table and add to the new table
  Table oldScores = loadTable("data/scores.csv", "header");
  if (oldScores != null) { //only executes if data/file is found
    TableRow oldRow;
    for (TableRow row : oldScores.rows()) {
      String dateTime = row.getString("Date / Time");
      String player = row.getString("Player");
      int score = row.getInt("Score");

      oldRow = newScores.addRow();
      oldRow.setString("Date / Time", dateTime);
      oldRow.setString("Player", player);
      oldRow.setInt("Score", score);
    }
  }
  TableRow newRow;
  String dt = day()+"/"+month()+"/"+year()+" - "+hour()+":"+minute()+":"+second();
  //add score to table
  newRow = newScores.addRow();
  newRow.setString("Date / Time", dt);
  newRow.setString("Player", playerName);
  newRow.setInt("Score", dave.getScore());
  //and save to file
  saveTable(newScores, "data/scores.csv");
  noLoop();
}
