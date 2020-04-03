//global vars
GameField game;
int player, winner;
int row, col;
boolean gameOver;
PImage gOver;

void setup() {
  size(500, 500);
  background(0);
  gOver = loadImage("game_over.png");

  game = new GameField(3, 3, width, height);
  player = 1;
  setTitle();
  //change values of row and col to prevent x being drawn at start.
  row = -1;
  col = -1;
  gameOver = false; // not needed?
}

void draw() {
  background(0);

  if (gameOver) {
    imageMode(CENTER);
    image(gOver, width/2, height/2);
    noLoop();
  }
  game.display();
  checkGame();
}

void setTitle() {
  if (player == 1) {
    surface.setTitle("Player's turn: X");
  } else {
    surface.setTitle("Player's turn: O");
  }
}

void checkGame() {
  if (row>=0 && col>=0) { // added this to prevent nullPointerException on init, because row and num start at -1
    if (game.updateBoard(row, col, player)) { //needed to change updateboard to a bool so it only executes once, and only on empty place. notice shorthand if notation
      winner = game.checkScores(row, col, player);
      if (winner != 0) {
        if (winner == 1) {
          surface.setTitle("Player X won the game!");
        } else surface.setTitle("Player O won the game!");
        gameOver = true;
      } else if (game.isBoardFull()) {
        gameOver = true;
        surface.setTitle("Nobody won!");
      } else {
        player = -player; // change who's turn it is
        setTitle(); //and then update title to reflect that turn
      }
    }
  }
}

void resetGame() {
  player = 1;
  setTitle();
  //change values of row and col to prevent x being drawn at start.
  row = -1;
  col = -1;
  gameOver = false;
  game.initialize();
}

void mousePressed() {
  row = game.getRowNumber(mouseY);
  col = game.getColNumber(mouseX);
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    loop();
    resetGame();
  }
}
