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
  size(1000,700);
  background(#C0C0C0);
  scene.createRoom(1);
  
  //setting up the monsters, testing (just 5 at the moment)

  
}

void draw() {
  if (p1.isAlive()) {
    background(#C0C0C0);
    scene.changeRoom();
    
    p1.removeRestriction();
    for(Wall w : walls) {
      w.spawnWall();
      w.moveRestrict(p1);
      for(Monsters m : monsters) {
        w.moveRestrict(m);
      }
    }
    
  
    for (int i = 0; i<bullet.size(); i++) {
      collided = false;
      for(Wall w: walls) {
        if(w.bulletCollision(bullet.get(i))) {
          collided = true;
        }
      }
      if (!collided) {
        bullet.get(i).display();
      } else {
        bullet.remove(bullet.get(i));
        continue;
      }
    }
    
    for (Monsters m : monsters) {
      for (int i = 0; i<bullet.size(); i++) {
        if (m.takeDamage(bullet.get(i))) {
          bullet.remove(i);
          i--;
        }
      }
      m.moveM();
      m.attackP(p1);
      m.display();
    }
  
    
    fill(0);
    textSize(20);
    text("health: " + p1.hp, 0, 20);
    text("Level: " + scene.roomNum, 0, 50);
    
    p1.moveP();
    p1.fire();
    p1.display();
  } else {
    clear();
    textSize(20);
    text("You died", 0, 20);
    text("You reached level " + scene.roomNum, 00, 50);
  }
}

void removeM(Monsters m) {
  if (m.hp <= 0) {
    m.hp = 0;
    monsters.remove(m);
  }
}

//if key is pressed (WASD), then set appropriate boolean true
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
