class Car{
  
    private PVector position;
    private float w, h, speed;
    private color colour;
    private boolean started;
    private Wheel[] wheels; //COMPOSITION

    //const
    Car(PVector position, float w, float h, color c, float speed, int NumWheels){
        this.position = position;
        this.w = w;
        this.h = h;
        this.speed = speed;
        this.colour = c;
        this.started = false;
        //create the array!
        this.wheels = new Wheel[NumWheels];

        //init the wheels-array!
        createWheels();
    }

    void createWheels(){
        float xWheel=position.x - w/4;
        float yWheel=position.y + h/6;
        int wheelSize=(int)h/2;

        for(int i=0; i < wheels.length; i++){
            wheels[i] = new Wheel(xWheel, yWheel, wheelSize);
            xWheel+=w/2;
        }
    }

    //member method display
    void display(){
        noStroke();
        fill(colour);
        rectMode(CENTER);
        rect(position.x, position.y, w, h/2);
        rect(position.x, position.y-h/2, +2, w/2, h/2);

        //windows
        fill(255, 150);
        rect(position.x-w/8, position.y-h/2 + 2, w/6, h/3);
        rect(position.x-w/8, position.y-h/2 + 2, w/6, h/3);

        //display wheels
        for(int i=0; i < wheels.length; i++){
            wheels[i].display();
        }
    }

    void move(float limit){
        if(started){
            this.position.x += speed;

            if(position.x > limit){
                this.position.x = 0;
            }

            //move position of wheels also
            float xWheel=position.x-w/4;
            for(int i=0; i < wheels.length; i++){
                wheels[i].setPosition(xWheel + (i*(w/2)));
            }
        }
    }

    //setters
    void setStatusCar(boolean state){
        this.started = state;
    }

    void setSpeed(float sp){
        this.speed = sp;
    }

    //getters
    boolean getStarted(){
        return started;
    }

    void toggle(){
        this.started = !started;
    }

//end of class
}
