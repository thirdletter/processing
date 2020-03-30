//DECLARATIE
int numCars=3;
Car[] carsArr = new Car[numCars];

void setup(){
    size(400, 600);
    background(255);

    initializeCars();
}

void draw(){
    background(255);

    for (int i = 0; i < carsArr.length; ++i) {
        carsArr[i].move(width);
        carsArr[i].display();
    }
}

void initializeCars(){
    for(int i=0; i < carsArr.length; i++){
        //x, y, w, color, speed
        float randWidth=random(100,200);
        float randHeight=random(50,80);
        PVector position=new PVector(random(randWidth, width-randWidth), random(randHeight,height-randHeight));
        color randColor = color(random(256), random(256), random(256));
        float speed=random(5,10);
        carsArr[i] = new Car(position, randWidth, randHeight, randColor, speed, 2);
    }
}

void keyPressed(){
    if(key == 'r' || key == 'R'){
        for(int i=0; i < carsArr.length; i++){
            carsArr[i].setStatusCar(true);
        }
    }

    if(key == 's' || key == 'S'){
        for(int i=0; i < carsArr.length; i++){
            carsArr[i].setStatusCar(false);
        }
    }

    if(key == 'y' || key == 'Y'){
        for(int i=0; i < carsArr.length; i++){
            carsArr[i].setSpeed(15);
        }
    }
}
