public class Characters {
  int hp, atkPower, dmgTaken, fireRate;
  float x, y, speed, radius;
  color c;
  boolean ableLeft, ableRight, ableUp, ableDown, alive;
  
  //constructor w/ health, attack power (starting with just a circle to represent character)
  //also accounting for radius, x, y, and the speed
  //including c to check for it later
  Characters(int hp, int atkPower, float rad, float x, float y, float speed) {
    this.hp = hp;
    this.atkPower = atkPower;
    radius = rad;
    this.x = x;
    this.y = y;
    this.speed = speed;
    c = 255;
    ableLeft = true;
    ableRight = true;
    ableUp = true;
    ableDown = true;
    alive = true;
  }
  
  //constructor without parameters
  Characters() {
    this(10, 2, 10, 500, 500, 2);
  }
  
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  float getR() {
    return radius;
  }
  
  void removeRestriction() {
    ableLeft = true;
    ableRight = true;
    ableUp = true;
    ableDown = true;
  }
  
  
  void restrictLeft() {
    ableLeft = false;
  }
  void restrictRight() {
    ableRight = false;
  }
  void restrictUp() {
    ableUp = false;
  }
  void restrictDown() {
    ableDown = false;
  }
}
