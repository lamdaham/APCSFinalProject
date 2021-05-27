Scene scene = new Scene();
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

void setup() {
  walls = new ArrayList<Wall>();
  size(1600,1000);
  background(#000000);
  scene.createRoom();
  
  //setting up the monsters, testing (just 5 at the moment)
  monsters = new ArrayList<Monsters>();
  bullet = new ArrayList<Bullet>();
  for (int i = 0; i < 5; i++) {
    monsters.add(new Monsters());
  }
}

void draw() {
  background(#000000);
  p1.removeRestriction();
  for(Wall w : walls) {
    w.spawnWall();
    w.moveRestrict();
  }
  
  for (Monsters m : monsters) {
    m.moveM();
    m.display();
  }
  
  p1.moveP();
  p1.display();
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
}
