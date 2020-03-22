ArrayList <PVector> coords;
int atlDots=15;

void setup() {
    size (300,300);
    noStroke();
    fill(0);
    //fill array with vector points
    coords = new ArrayList();
    for (int i=0; i<atlDots; i++){
        PVector p = new PVector(random(width), random(height));
        coords.add(p);
    }
}

void draw() {
    
    background(200);

    for (int i=0; i < coords.size(); i++){
        //moving the dots per 1 pixel
        PVector pos = coords.get(i);
        pos.x = (pos.x + random(-1,1));
        pos.y = (pos.y + random(-1,1));

        ellipse(pos.x, pos.y, 5, 5);
    }
}
