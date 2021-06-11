public class Characters {
  //applies to both the player and the monsters
  int hp, atkPower, dmgTaken, fireRate;
  float x, y, speed, radius;
  boolean ableLeft, ableRight, ableUp, ableDown, alive;

  //constructor accounting for health, attack power, radius, position, speed
  Characters(int hp, int atkPower, float rad, float x, float y, float speed) {
    this.hp = hp;
    this.atkPower = atkPower;
    radius = rad;
    this.x = x;
    this.y = y;
    this.speed = speed;
    ableLeft = true;
    ableRight = true;
    ableUp = true;
    ableDown = true;
    alive = true;
  }
  
  //constructor without parameters
  Characters() {
    this(10, 2, 20, 500, 500, 2);
  }
  
  //getting x, y, and radius
  float getX() {
    return x;
  }  
  float getY() {
    return y;
  } 
  float getR() {
    return radius;
  }
  
  //getting the hp
  int getHP() {
    return hp;
  }
  
  
  // set coordinates of character
  void setX(float xC) {
    x = xC;
  }
  void setY(float yC) {
    y = yC;
  }
  
  //keeping track of restrictions on characters using booleans
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
