//initialize
PFont Agency;
PImage bg,duck,scoreboard;
int score,lives;
ArrayList <Duck> ducksArr = new ArrayList <Duck>();

void setup() {
    size(1020, 720);
    //load data
    Agency = loadFont("AgencyFB-Bold-48.vlw");
    bg = loadImage("background.png");
    scoreboard = loadImage("scoreboard.png");
    duck = loadImage("duck.png");
    lives = 3;

    //temp first duck object added
    ducksArr.add(new Duck());
}

void draw() {
    // background(0); // does not seem to work, figure out a way to make bg black
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
}

void mousePressed(){
    for(int j = ducksArr.size() - 1; j >= 0; j--){
        ducksArr.remove(j);
    }
}
