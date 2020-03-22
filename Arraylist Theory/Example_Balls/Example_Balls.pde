ArrayList<Ball> balls = new ArrayList<Ball>();
final float gravityValue =0.1, radius=10;

void setup() {
    size(480,270);

    // Initialize a first ball at index 0
    Ball ballObject=new Ball(new PVector(50,0), radius, color(random(256), random(256), random(256)));
    balls.add(ballObject);
}

void draw() {
    background(255);

    for (int i = 0; i < balls.size(); ++i) {

        Ball ballObject = balls.get(i);
        ballObject.gravity(gravityValue);
        ballObject.move();
        ballObject.bounce(height);
        ballObject.display();       
    }
}

void mousePressed(){
    // create a new object at the mouse position
    Ball ballObject = new Ball(new PVector(mouseX,mouseY), radius, color(random(256), random(256), random(256)));
    balls.add(ballObject);
}

void keyPressed(){
    if(key == 'd' || key == 'D'){
        balls.remove(balls.size()-1);
    }
}