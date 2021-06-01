Scene scene = new Scene();
ArrayList<Gun> gun = new ArrayList<Gun>();
Player p1 = new Player();
ArrayList<Wall> walls;
ArrayList<Monsters> monsters;
ArrayList<Bullet> bullet;

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

void setup() {
  walls = new ArrayList<Wall>();
  monsters = new ArrayList<Monsters>();
  bullet = new ArrayList<Bullet>();
  size(1000, 700);
  background(#C0C0C0);
  scene.createRoom(1);

  //setting up the monsters, testing (just 5 at the moment)
}

void draw() {
  if (p1.isAlive()) {
    //background(#C0C0C0);
    bg();
    scene.changeRoom();


    restrictMovement();

    removeBullet();

    monsterAction();

    playerAction();


    fill(0);
    textSize(20);
    text("health: " + p1.hp, 0, 20);
    text("Level: " + scene.roomNum, 0, 50);
  } else {

    deathMessage();


  }
}

void removeM(Monsters m) {
  if (m.hp <= 0) {
    m.hp = 0;
    monsters.remove(m);
  }
}

//if key is pressed (WASD), then set appropriate boolean true
// c is pickup weapon
// v is drop weapon

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

void restrictMovement() {
  p1.removeRestriction();
  for (Wall w : walls) {
    w.spawnWall();
    w.moveRestrict(p1);
    for (Monsters m : monsters) {
      m.removeRestriction();
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
}

void monsterAction() {
  for (Monsters m : monsters) {
    for (int i = 0; i<bullet.size(); i++) {
      if (m.takeDamage(bullet.get(i))) {
        bullet.remove(i);
        i--;
      }
    }
    m.moveM(p1);
    m.attackP(p1);
    m.display();
  }

  for (int m = 0; m<monsters.size(); m++) {
    if (!(monsters.get(m).alive)) {
      monsters.remove(m);
      m--;
    }
  }
}

void playerAction() {
  p1.moveP();
  p1.fire();
  p1.display();
}

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
