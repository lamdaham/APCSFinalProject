public class Wall {

  int x, y, w, h, leftSide, rightSide, topSide, bottomSide;
  color c;

  public Wall(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    this.leftSide = x - (w/2);
    this.rightSide = x + (w/2);
    this.topSide = y - (w/2);
    this.bottomSide = y + (w/2);

    this.c = #9c64ba;
  }

  public Wall(int x, int y, int w, int h, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    this.leftSide = x - (w/2);
    this.rightSide = x + (w/2);
    this.topSide = y - (w/2);
    this.bottomSide = y + (w/2);

    this.c = c;
  }

//spawns a wall at the coordniates 
  void spawnWall() {
    fill(c);
    noStroke();
    rect(x, y, w, h);
  }


//restricts the movement of player based on its location in relation to the wall
  boolean moveRestrict(Characters c) {
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
      return true;
    }
    return false;
  }

//checks for bullet collision with walls
  boolean bulletCollision(Bullet bb) {

    float tempX = bb.getX();
    float tempY = bb.getY();

    if (bb.getX()<x) {
      tempX = x;
    } else if (bb.getX()>(x+w)) {
      tempX = x+w;
    }
    if (bb.getY()<y) {
      tempY = y;
    } else if (bb.getY()>(y+h)) {
      tempY = y+h;
    }

    float distX = bb.getX() - tempX;
    float distY = bb.getY() - tempY;

    float dist = sqrt((distX*distX) + (distY*distY));
    return(dist<=bb.getR());
  }
  
  
//checks if a set of coordinates are within a wall
  boolean inWalls(float xVar, float yVar) {
    float tempX = xVar;
    float tempY = yVar;

    if (xVar<x) {
      tempX = x;
    } else if (xVar>(x+w)) {
      tempX = x+w;
    }
    if (yVar<y) {
      tempY = y;
    } else if (yVar>(y+h)) {
      tempY = y+h;
    }

    float distX = xVar - tempX;
    float distY = yVar - tempY;

    float dist = sqrt((distX*distX) + (distY*distY));

    if (dist<=5) {
      return true;
    }
    return false;
  }
}
