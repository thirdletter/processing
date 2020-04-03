class Puzzle { //<>// //<>//
  private int dimension, tileSize, numMoves;
  private PImage puzzleImg;
  private boolean puzzleSolved;
  private Tile[][] puzzle;

  //const
  Puzzle(int dimension, PImage puzzleImg) {
    this.dimension = dimension;
    this.puzzleImg = puzzleImg;
    tileSize = puzzleImg.width/dimension;    
    puzzle = new Tile[dimension][dimension];
  }

  //store the correct image in the tile array
  void initialize() {
    //init local vars
    PImage tmpImg;
    numMoves = 0;
    int counter = 1;
    //fill 2D array with correct images
    for (int r = 0; r < dimension; r++) {
      for (int c = 0; c < dimension; c++) {
        tmpImg = puzzleImg.get(r * (puzzleImg.width/dimension), (c * (puzzleImg.height/dimension)), (puzzleImg.width/dimension), (puzzleImg.height/dimension));
        puzzle[r][c] = new Tile(tmpImg, counter);
        counter++;
      }
    }
    // shuffle the pieces once on init
    shufflePieces();
  }

  void shufflePieces() {
    /*
     I find a lot of solutions online that use .shuffle() by first converting our 2D array to lists or 1DArrays. Seems overly complicated.
     Trying to find a cleaner/simpler solution. I feel like ordernumber in our tile objects is part of the solution.
     Find a way to grab random ordernumber, place it somewhere, then loop again, but this time with a ordernumber you havent used?
     Can't just use random indexes and copy over, because you get duplicates, which cannot happen.
     
     SOLUTION: Just use an extra set of vars for row and col that are random, and actually SWAP them by using a tmp var.
     */

    for (int r = 0; r < dimension; r++) {
      for (int c = 0; c < dimension; c++) {
        // could've just used dimension twice instead of lengths of array, but want to save this for future reference with disproportional 2D arrays
        int r1 = (int)random(puzzle.length);
        int c1 = (int)random(puzzle[r].length); 
        //Save current tile object to a tmp var
        Tile tmp = puzzle[r][c]; 
        // take a random object and place it on current tiles location
        puzzle[r][c] = puzzle[r1][c1]; 
        // take the original object and place it in place of the object you randomly selected. TL:DR swap them.
        puzzle[r1][c1] = tmp;
      }
    }
  }

  //display
  void drawPuzzle() {
    for (int r = 0; r < dimension; r++) {
      for (int c = 0; c < dimension; c++) {
        // dont draw tile if ordernumber is 9
        if (puzzle[r][c].getOrderNumber() != 9) {
          puzzle[r][c].display(r * (puzzleImg.width/dimension), c * (puzzleImg.width/dimension));
        }
      }
    }
    surface.setTitle("Number of moves: " + numMoves);
    //check is puzzle is solved and end game
    if (puzzleSolved) {
      textAlign(CENTER, CENTER);
      fill(0);
      textSize(22);
      text("The puzzle is solved, good job!", width/2, height/2);
      text("Press R to reset.", width/2, 20 + (height/2));
      surface.setTitle("PUZZLE SOLVED");
      noLoop();
    }
  }

  //checkMove
  boolean checkMove(float mouseX, float mouseY) {
    /*
    cannot figure this one out.
     I know you have to find the indexes of the tile you clicked,
     then check the indexes one higher and one lower (both row and col).
     then return true if orderNumber is 9, return false otherwise.
     Cannot figure out how to actually program this, so defaulting to true for now.
     */
    return true;
  }

  //move the tile to empty position (value 9)
  void move(int colNr, int rowNr) { //Do not understand why it is swapped here, but it works, so leaving it.
    //set local vars to unrealistic indexes
    int tmpRow = -1;
    int tmpCol = -1;
    for (int r = 0; r < dimension; r++) {
      for (int c = 0; c < dimension; c++) {
        //find object with getordernumber 9
        if (puzzle[r][c].getOrderNumber() == 9) {
          //then swap places with the object at colNr rowNr, but only if move is legal (checkmove)
          if (checkMove(rowNr, colNr)) {
            Tile tmp = puzzle[r][c];
            puzzle[r][c] = puzzle[rowNr][colNr];
            puzzle[rowNr][colNr] = tmp;
            numMoves++;
          }
        }
      }
    }
    //check to see if checkpuzzle is finished.
    if (checkPuzzle()) {
      puzzleSolved = true;
    }
  }


  boolean checkPuzzle() {
    //init local vars
    int counter = 0;
    //loop trough 2D array
    for (int r = 0; r < dimension; r++) {
      for (int c = 0; c < dimension; c++) {
        if (puzzle[r][c].getOrderNumber() == counter+1) { //have to check with +1 because counter lags one behind, ordernumber starts @ 1, counter @ 0
          counter++;
        }
      }
    }
    if (counter == sq(dimension)) { // sq(float) squares a number, same as typing dimension*dimension
      return true;
    } else {
      return false;
    }
  }

  //getters & setters
  int getRowNumber(int my) {
    return (my / tileSize);
  }

  int getColNumber(int mx) {
    return (mx / tileSize);
  }

  void resetPuzzle() {
    puzzleSolved = false;
    initialize();
    loop();
  }
}
