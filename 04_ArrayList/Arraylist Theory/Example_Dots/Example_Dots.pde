//create an empty array for 100 Dot objects
int numDots=100;
ArrayList<Dot> dotsArr = new ArrayList<Dot>();

void setup() {
    size(400, 400);
    smooth();

    //and actually create the objects and populate the array with them
    for (int i = 0; i < numDots; i++){
        dotsArr.add(new Dot(new PVector(200,200),
                    new PVector(random(-10,10),
                    random(-10,10)),
                    5));
    }
}

void draw() {

    background(0);

    //iterate trough every moving dot
    for (int i = 0; i < dotsArr.size(); i++){
        Dot dotObject = dotsArr.get(i);
        dotObject.update();
        dotObject.checkCollisions(width, height);
        dotObject.display();
    }
    
}
