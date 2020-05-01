class Dave{
  private int numElements=3;
  private PImage[] arrImg;
  private int MaxHP,curHP;
  private PVector pos,velocity;
  
  public Dave(PImage daveImg){
    pos = new PVector();     
 //set arraysize to number of images
    arrImg = new PImage[numElements];
    //cut source image into equally wide pieces, and store them in arrImg
    for (int i=0; i<numElements; i++) {
      arrImg[i]=daveImg.get((daveImg.width/numElements)*i, 0, daveImg.width/numElements, daveImg.height);
    }
}

void display(){
    image(arrImg[1], pos.x, pos.y);
}
}
