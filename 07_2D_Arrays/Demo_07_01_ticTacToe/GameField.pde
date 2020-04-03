class GameField {
  //datamembers
  int numRows, numCols, screenW, screenH;
  int rowHeight, colWidth;
  int[][] board;
  int[] rowScore, colScore;
  int mainDiagScore, secDiagScore;

  //const
  GameField(int numRows, int numCols, int screenW, int screenH) {
    this.numRows = numRows;
    this.numCols = numCols;
    this.screenW = screenW;
    this.screenH = screenH;

    rowHeight = screenH / numRows;
    colWidth = screenW / numCols;

    board = new int[numRows][numCols];
    rowScore = new int[numRows];
    colScore = new int[numCols];

    initialize(); // fills the 2D array
  }

  void display() {
    drawGrid();
    drawGame();
  }

  void drawGrid() {
    stroke(255);
    strokeWeight(3);
    //vertical lines
    for (int i = 0; i < numCols; i++) {
      line(i * colWidth, 0, i * colWidth, screenH);
    } 
    //horizontal lines
    for (int i = 0; i < numRows; i++) {
      line(0, i * rowHeight, screenW, i * rowHeight);
    }
  }

  void drawCircle(int r, int c) {
    stroke(255, 0, 0);
    strokeWeight(3);
    noFill();
    ellipse(c * colWidth + colWidth/2, r * rowHeight + rowHeight/2, colWidth-6, rowHeight-6);
  }

  void drawCross(int r, int c) {
    stroke(0, 255, 0);
    strokeWeight(3);
    //declare local vars
    int xStart1, yStart1, xEnd1, yEnd1;
    int xStart2, yStart2, xEnd2, yEnd2;
    //processing can assign values to more than one var at once
    xStart1 = xEnd2 = c * colWidth;
    yStart1 = yStart2 = r * rowHeight;
    xEnd1 = xStart2 = (c+1) * colWidth;
    yEnd1 = yEnd2 = (r+1) * rowHeight;    
    //now draw the actual x-lines
    line(xStart1, yStart1, xEnd1, yEnd1);
    line(xStart2, yStart2, xEnd2, yEnd2);
  }

  void drawGame() {
    // 1 for cross, -1 for circle. default is 0 = empty.
    for (int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {
        if (board[r][c] == 1) {
          drawCross(r, c);
        } else if (board[r][c] == -1) {
          drawCircle(r, c);
        }
      }
    }
  }
  
  boolean updateBoard(int r, int c, int pl){
    if(board[r][c] == 0){
      board[r][c] = pl;
      return true;
    } else return false;
  }
  
  int checkScores(int r, int c, int pl){
    int winner;
    
    rowScore[r] += pl;
    colScore[c] += pl;
    if(r == c){
      mainDiagScore += pl;
    }
    if(r+c == rowScore.length - 1){
      secDiagScore += pl;
    }
    
    int maxScore = pl * rowScore.length;
    if( rowScore[r] == maxScore || colScore[c] == maxScore || mainDiagScore == maxScore || secDiagScore == maxScore){
      winner = pl;
    } else {
      winner = 0;
    }
    return winner;
  }

  void initialize() {
    //fills all arrays and vars with 0
    for (int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {
        board[r][c] = 0;
      }
    }
    for (int r = 0; r < numRows; r++){
      rowScore[r] = 0;
    }
    for (int c = 0; c < numCols; c++){
      colScore[c] = 0;
    }
    mainDiagScore = 0;
    secDiagScore = 0;
    
  }

  boolean isBoardFull(){
    int counter = 0;
    for (int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {
        if(board[r][c] == 0){
          counter++;
        }
      }
    }
    
    if(counter == 0){
      return true;
    }else {
      return false;
    }
  }

  //getters & setters
  int getRowNumber(int my) {
    return (my / rowHeight);
  }

  int getColNumber(int mx) {
    return (mx / colWidth);
  }
}
