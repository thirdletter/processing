class Duck{
private PImage duckImg;
private PVector pos;
private int speed;

    //const
    Duck(){
        this.duckImg = loadImage("duck.png");
        this.speed = 5;
        this.pos = new PVector(width + duckImg.width, 300); // start pos just outside right edge of screen
    }

    void display(){
        image(duckImg, pos.x, pos.y);
    }
}