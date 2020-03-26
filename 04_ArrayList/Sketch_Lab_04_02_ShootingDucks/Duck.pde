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
        imageMode(CENTER);
        //imgmode is center, so dont forget about offset.
        image(duckImg, pos.x + (duckImg.width/2), (pos.y + duckImg.height/2));
    }

    void move(){
        if (pos.x < -duckImg.width){ // reset pos.x if image is past screen completely.
            pos.x = width + duckImg.width;
        } else
        pos.x -= speed;
    }
}