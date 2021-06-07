public class Door extends Wall {

  boolean open;
  String direction;


  Door(int x, int y, int w, int h, String direction) {
    super(x, y, w, h);
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.direction = direction;
    open = false;
  }

  void spawnWall() {
    if (open) {
      fill(255);
    } else {
      fill(#4E4E4E);
    }
    rect(x, y, w, h);
  }

  void moveRestrict(Characters c) {
    char dir;
    float tempX = c.getX();
    float tempY = c.getY();
    dir = 'N';

    if (c.getX()<x) {
      tempX = x;
      dir = 'R';
    } else if (c.getX()>(x+w)) {
      tempX = x+w;
      dir = 'L';
    }
    if (c.getY()<y) {
      tempY = y;
      dir = 'D';
    } else if (c.getY()>(y+h)) {
      tempY = y+h;
      dir = 'U';
    }

    float distX = c.getX() - tempX;
    float distY = c.getY() - tempY;

    float dist = sqrt((distX*distX) + (distY*distY));

    if (dist<=c.getR()) {
      if (dir == 'L') {
        c.restrictLeft();
      } else if (dir == 'R') {
        c.restrictRight();
      } else if (dir == 'U') {
        c.restrictUp();
      } else if (dir == 'D') {
        c.restrictDown();
      }
      if(direction.equals("foward")) {
        scene.roomNum++;
      } else {
        scene.roomNum--;
      }
    }
  }
}
