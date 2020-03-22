class Ball{
    private PVector position;
    private float speed, radius;
    private color clr;

    //base constructor
    Ball(PVector position, float radius, color clr){
        this.position = position;
        this.radius = radius;
        this.clr = clr;
        this.speed = 5;
    }
    //overloading constructor
    Ball(PVector position, float radius, color clr, float speed){
        this(position, radius, clr);
        this.speed = speed;
    }

    void gravity(float gy){
        //add gravity to speed
        this.speed = speed + gy;
    }

    void move(){
        // Add speed to y location (has to fall down!)
        position.y += speed;
    }

    void bounce(float screenHeight){
        // If square reaches the bottom, reverse speed
        if (position.y+radius > screenHeight){
            speed = speed * -1;
            position.y = screenHeight-radius;
        }
        if (position.y < radius){
            speed = speed * -1;
            position.y = radius;
        }
    }

    void display(){
        fill(clr);
        ellipse(position.x, position.y, radius*2, radius*2);
    }
}
