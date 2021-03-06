public class Bullet {

  float r,dmg;
  
  boolean enemy;
  
  
  PVector location;
  PVector velocity; 
  
  Bullet(float x, float y,float r, float dmg, float deg, int speed){
    location = new PVector(x, y);
    velocity = new PVector(speed*cos(deg), speed*sin(deg));
    this.r = r;
    this.dmg = dmg;
  }
  
  Bullet(float x, float y,float r, float dmg, float deg, int speed, boolean f){
    location = new PVector(x, y);
    velocity = new PVector(speed*cos(deg), speed*sin(deg));
    this.r = r;
    this.dmg = dmg;
    enemy = f;
  }
  
  
  //moves the bullet in the direction angle and velocity
  void move() {
    location.add(velocity);
  }
  
  //displays the bullet and moves it; different colors for clown bullets and player bullets
  void display() {
    move();
    if (enemy) {
      fill(#c7023d);
    }
    else {
      fill(#85c45a);
    }
    circle(location.x, location.y, r * 3);
  }
  
  
  //return x, y, radius, damage, and status of the bullet
  float getX() {
    return location.x;
  }
  
  float getY() {
    return location.y;
  }
  
  float getR() {
    return r;
  }
  
  float getdmg() {
    return dmg;
  }
  
  boolean getStatus() {
    return enemy;
  }
}
