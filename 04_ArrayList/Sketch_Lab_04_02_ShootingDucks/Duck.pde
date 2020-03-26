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

    void move(){
        if (pos.x < -duckImg.width){ // reset pos.x if image is past screen completely.
            pos.x = width + duckImg.width;
        } else
        pos.x -= speed;
    }
}