class Dot {
    private PVector position;
    private PVector speed;
    private float radius;

    //constructor
    Dot(PVector position, PVector speed, float radius){
        this.position = position;
        this.speed = speed;
        this.radius = radius;
    }

    void update(){
        //ADD VECTORS WITH add method!
        position.add(speed);
    }

    void checkCollisions(float maxWidth, float maxHeight){

        if ( (position.x < radius) || (position.x > maxWidth-radius)){
            speed.x = -speed.x;
        }

        if ( (position.y < radius) || (position.y > maxHeight-radius)){
            speed.y = -speed.y;
        }
    }

    void display(){
        fill(255);
        ellipse(position.x, position.y, radius*2, radius*2);
    }
}