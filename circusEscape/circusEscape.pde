Scene scene = new Scene();
int cleared = 0;
ArrayList<ArrayList<Gun>> gun = new ArrayList<ArrayList<Gun>>();
//ArrayList<Health> health = new ArrayList<Health>();
Player p1;
ArrayList<Wall> walls;
ArrayList<Monsters> monsters;
ArrayList<Bullet> bullet;
ArrayList<ArrayList<Potions>> potions = new ArrayList<ArrayList<Potions>>();


ArrayList<Bullet> bulletM;

boolean buffScreen;
boolean end;
boolean start;
PImage img;
int m;

//four different boolean instance variables to keep track
//of the direction player is moving using WASD keys
boolean up = false;
boolean down = false;
boolean right = false;
boolean left = false;

boolean leftMouse = false;
boolean collided = false;
boolean pickup = false;
boolean drop = false;

boolean space1 = false;
boolean space2 = false;
boolean space3 = false;


void setup() {
  walls = new ArrayList<Wall>();
  monsters = new ArrayList<Monsters>();
  bullet = new ArrayList<Bullet>();


  for (int i = 0; i<12; i++) {
    potions.add(new ArrayList<Potions>());
    gun.add(new ArrayList<Gun>());
  }

  bulletM = new ArrayList<Bullet>();

  //health = new ArrayList<Health>();
  for (int i = 1; i <= 9; i++) {
    potions.get(i).add(new Potions());
  }

  size(1000, 700);
  background(#C0C0C0);
  scene.createRoom(1);
  buffScreen = false;
  end = false;
  start = true;
  img = loadImage("curtains.jpg");
  //testing
  p1 = new Player();
}

void draw() {
  startScreen();
  //while the player is alive

  if (!start) {
    if (end) {
      clear();
      walls.clear();
      fill(#cfcfcf);
      stroke(255);
      rect(200, 200, 600, 300);
      fill(0);
      textSize(20);
      textAlign(CENTER);
      text("Congratulations!", width / 2, height / 2 - 30);
      text("You made it to the end!", width / 2, height / 2 + 30);
    } else {
      if (p1.isAlive()) {
        if (buffScreen) {
          chooseBuff();
        } else {
          //setting up the background
          bg();
          scene.changeRoom();
  
          //restricting the characters' movements, control over
          //the bullets, monsters, and the player
          restrictMovement();
          removeBullet();
          monsterAction();
          playerAction();
  
          //displaying the gun and health
          displayGun();
          displayHealth();
          displayPotion();
          displayInventory();
          timer();
  
          //text: health, level, gun type
          fill(0);
          textSize(20);
          textAlign(LEFT);
          text("health: " + p1.hp, 0, 20);
          text("Level: " + scene.roomNum, 0, 50);
  
          //different messages for the gun types
          if (p1.hasGun) {
            text("Gun: " + (p1.currentGun).type, 0, 80);
          } else {
            text("Gun: " + "good'ol panda paws", 0, 80);
          }
        }
        //if the player is dead, display the death message
      } else {
        deathMessage();
      }
    }
  }
} 

//removing monsters when hp is <= 0
void removeM(Monsters m) {
  if (m.hp <= 0) {
    m.hp = 0;
    monsters.remove(m);
  }
}

//if key is pressed, then set appropriate boolean true
//WASD is for the directions
//c is to pickup weapon
//v is to drop weapon
void keyPressed() {
  if (key == 'w') {
    up = true;
  }
  if (key == 'a') {
    left = true;
  }
  if (key == 's') {
    down = true;
  }
  if (key == 'd') {
    right = true;
  }
  if (key == 'c') {
    pickup = true;
  }
  if (key == 'v') {
    drop = true;
  }
  if (key == '1') {
    space1 = true;
  }
  if (key == '2') {
    space2 = true;
  }
  if (key == '3') {
    space3 = true;
  }
}

//same as keyPressed but with released, set boolean false
void keyReleased() {
  if (key == 'w') {
    up = false;
  }
  if (key == 'a') {
    left = false;
  }
  if (key == 's') {
    down = false;
  }
  if (key == 'd') {
    right = false;
  }
  if (key == 'c') {
    pickup = false;
  }
  if (key == 'v') {
    drop = false;
  }
  if (key == '1') {
    space1 = false;
  }
  if (key == '2') {
    space2 = false;
  }
  if (key == '3') {
    space3 = false;
  }
}


void mousePressed() {
  if (mouseButton == LEFT) {
    leftMouse = true;
  }
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    leftMouse = false;
  }
}

//setting up the checkerboard background
void bg() {
  noStroke();
  for (int i = 0; i < width; i += 50) {
    for (int j = 0; j < height; j += 50) {
      if ((i + j) % 20 == 0) {
        fill(#c9c9c9);
      } else {
        fill(#8f8f8f);
      }
      rect(i, j, 50, 50);
    }
  }
}

//restricting the movement of the monsters when at wall
void restrictMovement() {
  p1.removeRestriction();
  for (Monsters m : monsters) {
    m.removeRestriction();
  }
  for (Wall w : walls) {
    w.spawnWall();
    w.moveRestrict(p1);
    for (Monsters m : monsters) {
      w.moveRestrict(m);
    }
  }
}

void removeBullet() {
  for (int i = 0; i<bullet.size(); i++) {
    collided = false;
    for (Wall w : walls) {
      if (w.bulletCollision(bullet.get(i))) {
        collided = true;
      }
    }
    if (!collided) {
      bullet.get(i).display();
    } else {
      bullet.remove(bullet.get(i));
    }
  }
  for (int i = 0; i<bulletM.size(); i++) {
    collided = false;
    for (Wall w : walls) {
      if (w.bulletCollision(bulletM.get(i))) {
        collided = true;
      }
    }
    if (!collided) {
      bulletM.get(i).display();
    } else {
      bulletM.remove(bulletM.get(i));
    }
  }
}

//monster movement, taking damage, attacking player
void monsterAction() {
  for (int m = 0; m < monsters.size(); m++) {
    for (int i = 0; i<bullet.size(); i++) {
      if ((monsters.get(m)).takeDamageM(bullet.get(i))) {
        bullet.remove(i);
        i--;
      }
    }
    (monsters.get(m)).moveM(p1);
    (monsters.get(m)).attackP(p1);
    (monsters.get(m)).display();
    (monsters.get(m)).fireM();
  }

  for (int m = 0; m<monsters.size(); m++) {
    if (!(monsters.get(m).alive)) {
      monsters.remove(m);
      m--;
    }
  }
  if (monsters.size()==0) {
    scene.room.open = true;
    if (scene.room.roomNum>cleared) {
      cleared = scene.room.roomNum;
    }
  }
}

//player movement and firing
void playerAction() {
  for (int i = 0; i<bulletM.size(); i++) {
    if (p1.takeDamage(bulletM.get(i))) {
      bulletM.remove(i);
      i--;
    }
  }
  p1.moveP();
  p1.fire();
  p1.display();
}

//displays the gun the player is using
void displayGun() {
  for (Gun g : gun.get(scene.roomNum)) {
    g.display();
  }
  if (p1.hasGun) {
    p1.currentGun.display();
  }
}

//displays the health of the player
void displayHealth() {
  ArrayList<Health> placeholder = new ArrayList<Health>();
  for (int i = 0; i < p1.hp; i++) {
    placeholder.add(new Health(125 + i * 30, 10));
  }
  for (Health h : placeholder) {
    h.display();
  }
}

void displayPotion() {
  for (int p = 0; p<potions.get(scene.roomNum).size(); p++) {
    for(int w = 0; w<walls.size(); w++) {
      if ((walls.get(w)).inWalls(potions.get(scene.roomNum).get(p).x, potions.get(scene.roomNum).get(p).y)) {
        potions.get(scene.roomNum).remove(p);
        potions.get(scene.roomNum).add(new Potions());
      }
    }
    potions.get(scene.roomNum).get(p).display(p1);
  }

  for (int p = 0; p <potions.get(scene.roomNum).size(); p++) {
    if ((potions.get(scene.roomNum)).get(p).consumed) {
      potions.remove(p);
      p--;
    }
  }
}

void displayInventory() {
  for (int i = 0; i < 5; i++) {
    fill(255);
    stroke(0);
    strokeWeight(1);
    if(p1.inventory.currentIndex == i) {
     strokeWeight(2);
    }
    rect(i * 100 + 250, height - 100, 100, 75);
    
    if (p1.inventory.inventory[i] != null) {
      if (p1.inventory.inventory[i] instanceof Gun) {
        ((Gun)p1.inventory.inventory[i]).display(i*100+300, height-60);
      } else if (p1.inventory.inventory[i] instanceof Potions) {
        ((Potions)p1.inventory.inventory[i]).display(i*100+300, height-50);
      }
    }
    
  }
}

//displayed when the player dies
void deathMessage() {
  clear();
  fill(255, 0, 0);
  rect(200, 200, 600, 300);
  fill(255);
  textSize(20);
  textAlign(CENTER);
  text("You died :(", width / 2, height / 2 - 30);
  text("You reached level " + scene.roomNum, width / 2, height / 2);
  text("Try Again!", width / 2, height / 2 + 30);
}

void chooseBuff() {
  clear();
  fill(255);
  noStroke();
  textSize(10);
  rect(300, 300, 100, 100);
  fill(0);
  text("Extra Damage +1", 310, 350);
  text("(1)", 310, 370);
  fill(255);
  rect(450, 300, 100, 100);
  fill(0);
  textSize(8);
  text("Increase Health Regen", 460, 350);
  text("(2)", 460, 370);
  fill(255);
  rect(600, 300, 100, 100);
  fill(0);
  textSize(9);
  text("Increase Max Health", 610, 350);
  text("(3)", 610, 370);
  fill(255);
  //if (buff1) {
  //  p1.extraDamage++;
  //  buffScreen = false;
  //} else if (buff2) {
  //  p1.regenCooldown-=5;
  //  buffScreen = false;
  //} else if (buff3) {
  //  p1.maxHealth++;
  //  buffScreen = false;
  //}
}

void timer() {
  m = millis();
  fill(255);
  rect(width - 100, height - 50, 100, 50);
  fill(0);
  textSize(15);
  text(m / (1000 * 60) % 60, width - 75, height - 15);
  text(":", width - 50, height - 15);
  text(m / (1000) % 60, width - 25, height - 15);
}

void startScreen() {
  img.resize(width, height);
  image(img, 0, 0);
  textSize(20);
  textAlign(CENTER);
  fill(255);
  String s1 = "Uh oh! The clowns are trying to take control of the circus and you're the first on their hit list! ";
  String s2 = "Let's see if you can get out safely! But fret not, there are plenty of items scattered around ";
  String s3 = "to help you out (or possibly hurt you) on this quest. Good luck!";
  //String s4 = "WASD keys: to move; C and V to pick up and drop up items";
  String sFinal = s1 + s2 + s3;
  text(sFinal, width/2 - 275, height/2 - 100, width/2 + 100, height / 2 + 400);
  fill(255);
  rect(350, 500, 300, 100);
  textSize(30);
  fill(0);
  text("P L A Y  -->", 500, 560);
  
  if (leftMouse && overRect(350, 500, 300, 100)) {
    start = false;
  }
}

boolean overRect(int x, int y, int rectWidth, int rectHeight) {
  if (mouseX >= x && mouseX <= x+rectWidth && mouseY >= y && mouseY <= y+rectHeight) {
    return true;
  } else {
    return false;
  }
}
