public class Wall {

  int x, y, w, h, leftSide, rightSide, topSide, bottomSide;

  public Wall(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    this.leftSide = x - (w/2);
    this.rightSide = x + (w/2);
    this.topSide = y - (w/2);
    this.bottomSide = y + (w/2);
  }


  void spawnWall() {
    fill(#C0C0C0);
    noStroke();
    rect(x, y, w, h);
  }

  void moveRestrict() {
    char dir;
    float tempX = p1.getX();
    float tempY = p1.getY();
    dir = 'N';

    if (p1.getX()<x) {
      tempX = x;
      dir = 'R';
    } 
    else if (p1.getX()>(x+w)) {
      tempX = x+w;
      dir = 'L';
    }
    if (p1.getY()<y) {
      tempY = y;
      dir = 'D';
    } 
    else if (p1.getY()>(y+h)) {
      tempY = y+h;
      dir = 'U';
    }

    float distX = p1.getX() - tempX;
    float distY = p1.getY() - tempY;

    float dist = sqrt((distX*distX) + (distY*distY));

    if (dist<=p1.getR()) {
      if (dir == 'L') {
        p1.restrictLeft();
      } else if (dir == 'R') {
        p1.restrictRight();
      } else if (dir == 'U') {
        p1.restrictUp();
      } else if (dir == 'D') {
        p1.restrictDown();
      }
    }
  }
  
  boolean bulletCollision(Bullet bb) {

    float tempX = bb.getX();
    float tempY = bb.getY();

    if (bb.getX()<x) {
      tempX = x;
    } 
    else if (bb.getX()>(x+w)) {
      tempX = x+w;
    }
    if (bb.getY()<y) {
      tempY = y;
    } 
    else if (bb.getY()>(y+h)) {
      tempY = y+h;
    }

    float distX = bb.getX() - tempX;
    float distY = bb.getY() - tempY;

    float dist = sqrt((distX*distX) + (distY*distY));
    return(dist<=bb.getR());
  }
}
