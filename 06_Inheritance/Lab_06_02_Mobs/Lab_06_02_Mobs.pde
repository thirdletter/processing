//declaration of vars and objects
PImage bgImg, minionImg, jumperImg, bossImg, bulletImg, turretImg;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<GameObject> mobs = new ArrayList<GameObject>();
private int points;
Turret turret;
int groundHeight = 126;

void setup() {
  size(1024, 512);
  //load all images and create first set of mobs and a turret
  loadImages();
  mobs.add(createMinion());
  mobs.add(createJumper());
  mobs.add(createBoss());
  turret = createTurret();
}

//dont forget to add the 6 images to the sketch!!
private void loadImages() {
  bgImg = loadImage("bg.png");
  minionImg = loadImage("minion.png");
  jumperImg = loadImage("jumper.png");
  bossImg = loadImage("boss.png");
  turretImg = loadImage("turret.png");
  bulletImg = loadImage("bullet.png");
}

void draw() {
  background(bgImg); //set bg

  for (GameObject mob : mobs) { //move and display all mob objects
    mob.move();
    mob.display();
  }

  turret.display(); //display the turret

  for (Bullet bullet : bullets) { //display and move all bullet objects
    bullet.display();
    bullet.move();
  }

  testBulletsMobsHit();
  testMobsTurretHit();

  removeBullets(); //removes bullets if health is 0 or exits screen
  removeMobs(); //removes mobs if health is 0 or exits screen

  addMob(); // adds a mob every 2sec
  showHUD(); // shows the HUD
  gameOver(); // checks to see if you have lives/bullets, ends game when either hits 0
}

private void gameOver() {
  if (turret.getHealth() <= 0 || turret.getRemainingBullets() <= 0) { //if bullets or hp = 0
    textAlign(CENTER);
    textSize(72);
    text("GAME OVER!", width/2, height/2);
    textSize(48);
    text("YOU SCORED " + points + " POINTS!", width/2, (height/2)+50);
    noLoop();
  }
}

private void showHUD() { //displays 3 datatexts
  fill(0);
  textAlign(LEFT, CENTER);
  text("Health: " + turret.getHealth(), 10, 30);
  text("Points: " + points, 10, 50);
  text("Bullets: " + turret.getRemainingBullets(), 10, 70);
}

private void testMobsTurretHit() { //checks if a mob hits the turret
  for (GameObject mob : mobs) {
    if ( mob.getHealth() > 0 && turret.getHealth() > 0  && mob.hitDetection(turret)) { // if mob and turret are alive and you hit the turret
      turret.hit();
      mob.hit();
    }
  }
}

private void addMob() { // adds a random mob every 2 sec
  if (frameCount % ((int)(frameRate * 2)) == 0) { //frameRate is a float by default so we need to typecast to integer
    int i = (int)random(3); //random number between 0 and 2 for each of our mob types
    switch (i) {
    case 0 : 
      mobs.add(createMinion());
    case 1 : 
      mobs.add(createJumper());
    case 2 : 
      mobs.add(createBoss());
    default : //unsure of why we need a default case, because we never actually hit it?
    }
  }
}

private void removeMobs() { //remove mobs from arraylist if they leave the screen or hp is 0
  for (int i = mobs.size()-1; i>=0; i--) { //remove means looping backwards
    GameObject mob = mobs.get(i);
    if (mob.getRight() < 0 || mob.getHealth() <= 0) { // check if hp is 0 or pos is outside of screen
      mobs.remove(mob);
      points+= mob.getScore(); // note: if mob somehow made it past turret, we still would get points because it leaves teh screen and executes. does not occur in normal gameplay
    }
  }
}

private void removeBullets() { //remove bullets from arraylist if they leave the screen or hp is 0
  for (int i=bullets.size()-1; i >= 0; i--) { //remove means looping backwards
    Bullet bullet = bullets.get(i);
    if (bullet.getHealth() <= 0 || bullet.getLeft() > width) { //check bullet hp or if it left the screen
      bullets.remove(bullet);
    }
  }
}

private void testBulletsMobsHit() { //just a function that executes testBulletMobsHit (!! SINGULAR BULLET !!) for each bullet that exists.
  for (Bullet bullet : bullets) {
    testBulletMobsHit(bullet);
  }
}

private void testBulletMobsHit(Bullet bullet) { //function that takes a bullet and checks if it hits a mob, executes hit function of both bullet and mob if we get a hit
  for (GameObject mob : mobs) {
    if (bullet.getHealth() > 0 && bullet.hitDetection(mob)) {
      //we have a hit here
      bullet.hit();
      mob.hit();
    }
  }
}


//functions that add a mob of each type
public Minion createMinion() {
  return new Minion(width, height - groundHeight - minionImg.height, minionImg);
}
public Jumper createJumper() {
  return new Jumper(width, height - groundHeight - jumperImg.height, jumperImg);
}
public Boss createBoss() {
  return new Boss(width, height - groundHeight - bossImg.height, bossImg);
}
public Turret createTurret() {
  return new Turret(0, height - groundHeight - turretImg.height, turretImg, 100);
}


void keyPressed() {
  if (key == ' ') { // shoot a bullet if spacebar is hit
    Bullet bullet = turret.shoot(bulletImg);
    if (bullet != null) { // check to see if .shoot actually returns an object to prevent crashes
      bullets.add(bullet);
    }
  }
}
