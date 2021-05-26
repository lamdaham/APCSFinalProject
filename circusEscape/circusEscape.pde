Scene scene = new Scene();
ArrayList<Wall> walls;

void setup() {
  walls = new ArrayList<Wall>();
  size(1600,1000);
  background(#000000);
  scene.createRoom();
}

void draw() {
  background(#000000);
  for(Wall w : walls) {
    w.spawnWall();
  }
}

void keyPressed() {
}
