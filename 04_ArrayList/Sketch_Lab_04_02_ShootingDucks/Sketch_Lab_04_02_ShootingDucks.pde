//initialize
PFont Agency;
PImage bg,duck,scoreboard;
 ArrayList <Duck> ducksArr = new ArrayList <Duck>();

void setup() {
    size(1020, 720);
    //load data
    Agency = loadFont("AgencyFB-Bold-48.vlw");
    bg = loadImage("background.png");
    scoreboard = loadImage("scoreboard.png");
    duck = loadImage("duck.png");
    //temp first duck object added
    ducksArr.add(new Duck());
}

void draw() {
    // background(0); // does not seem to work, figure out a way to make bg black
    background(bg);
    //display scoreboard, pos is given
    image(scoreboard, (width * 0.66), (height - 180));
    ducksArr.get(0).display();
}
