//initialize
PFont Agency;
PImage bg,duck,scoreboard;
int score,lives,hit;
boolean gameState = true;
ArrayList <Duck> ducksArr = new ArrayList <Duck>();

void setup() {
    size(1020, 720);
    //load data
    Agency = loadFont("AgencyFB-Bold-48.vlw");
    bg = loadImage("background.png");
    scoreboard = loadImage("scoreboard.png");
    duck = loadImage("duck.png");
    lives = 3;
    background(0);

    //temp first duck object added
    ducksArr.add(new Duck());
}

void draw() {
    background(bg);
    
    textFont(Agency);

    //display scoreboard, pos is given
    image(scoreboard, (width * 0.66), (height - 180));
    text("Score:"+score, (width * 0.66) +  25, (height - 120));
    text("Lives:"+lives, (width * 0.66) + 25, (height - 70));

    //display all ducks and move them
    for(int i = 0; i < ducksArr.size(); i++){
        ducksArr.get(i).move();
        ducksArr.get(i).display();
    }

    //add a new duck every second
    if (frameCount % 60 == 0){
        ducksArr.add(new Duck());
    }

    //check if game has ended
    if (gameState == false){
        noLoop();
    }
}

void mousePressed(){
    // init local vars
    int currentLives = lives;

        for(int j = ducksArr.size() - 1; j >= 0; j--){
            //added local vars to make hittest more readable
            float xPos = ducksArr.get(j).pos.x;
            float yPos = ducksArr.get(j).pos.y;
            float duckWidth = ducksArr.get(j).duckImg.width;
            float duckHeight = ducksArr.get(j).duckImg.height;
            //check if you hit the duck
                if(mouseX >= xPos && mouseX <= (xPos + duckWidth) && mouseY >= yPos && mouseY <= (yPos + duckHeight)){
                ducksArr.remove(j);
                score++;
                hit = 1;
            }
        }
    if(hit != 1){
            lives--;
        }
    if(lives <= 0){
        gameState = false;
    }    
    hit = 0; // reset hit var you doofus
}
