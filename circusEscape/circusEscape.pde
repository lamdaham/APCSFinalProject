Scene scene = new Scene();
int cleared = 0;
ArrayList<ArrayList<Gun>> gun = new ArrayList<ArrayList<Gun>>();
//ArrayList<Health> health = new ArrayList<Health>();
Player p1;
ArrayList<Wall> walls;
ArrayList<Monsters> monsters;
ArrayList<Bullet> bullet;
ArrayList<ArrayList<Potions>> potions = new ArrayList<ArrayList<Potions>>();
GameObjects[] inventory;

boolean buffScreen;
boolean end;

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

boolean buff1 = false;
boolean buff2 = false;
boolean buff3 = false;


void setup() {
  walls = new ArrayList<Wall>();
  monsters = new ArrayList<Monsters>();
  bullet = new ArrayList<Bullet>();
  inventory = new GameObjects[5];
  for(int i = 0; i<10; i++) {
    potions.add(new ArrayList<Potions>());
    gun.add(new ArrayList<Gun>());
  }
  //health = new ArrayList<Health>();
  potions.get(scene.roomNum).add(new Potions());

  size(1000, 700);
  background(#C0C0C0);
  scene.createRoom(1);
  buffScreen = false;
  end = false;
  //testing
  p1 = new Player(); 
}

void draw() {
  //while the player is alive
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
    //print(""+mouseX +", "  + mouseY + "\n");
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
    buff1 = true;
  }
  if (key == '2') {
    buff2 = true;
  }
  if (key == '3') {
    buff3 = true;
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
    buff1 = false;
  }
  if (key == '2') {
    buff2 = false;
  }
  if (key == '3') {
    buff3 = false;
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
    } else if ((bullet.get(i)).bounce>0) {
    } else {
      bullet.remove(bullet.get(i));
    }
  }
}

//monster movement, taking damage, attacking player
void monsterAction() {
  for (int m = 0; m < monsters.size(); m++) {
    for (int i = 0; i<bullet.size(); i++) {
      if ((monsters.get(m)).takeDamage(bullet.get(i))) {
        bullet.remove(i);
        i--;
      }
    }
    (monsters.get(m)).moveM(p1);
    (monsters.get(m)).attackP(p1);
    (monsters.get(m)).display();
  }

  for (int m = 0; m<monsters.size(); m++) {
    if (!(monsters.get(m).alive)) {
      monsters.remove(m);
      m--;
    }
  }
  if (monsters.size()==0) {
    scene.room.open = true;
    if(scene.room.roomNum>cleared){
      cleared = scene.room.roomNum;
    }
  }
}

//player movement and firing
void playerAction() {
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
  for (Potions p : potions.get(scene.roomNum)) {
    p.display(p1);
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
    for(GameObjects obj: p1.inventory.inventory) {
      if(obj != null) {
        obj.display();
      }
    }
    rect(i * 100 + 250, height - 100, 100, 75);
    stroke(0);
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
  if (buff1) {
    p1.extraDamage++;
    buffScreen = false;
  } else if (buff2) {
    p1.regenCooldown-=5;
    buffScreen = false;
  } else if (buff3) {
    p1.maxHealth++;
    buffScreen = false;
  }
}

void timer() {
  int m = millis();
  fill(255);
  rect(width - 100, height - 50, 100, 50);
  fill(0);
  textSize(15);
  text(m / (1000 * 60) % 60, width - 75, height - 15);
  text(":", width - 50, height - 15);
  text(m / (1000) % 60, width - 25, height - 15);
}

boolean overRect(int x, int y, int rectWidth, int rectHeight) {
  if (mouseX >= x && mouseX <= x+rectWidth && mouseY >= y && mouseY <= y+rectHeight) {
    return true;
  } else {
    return false;
  }
}
