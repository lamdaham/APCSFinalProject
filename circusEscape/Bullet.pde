public class Bullet {
  
  float r,dmg;
  
  PVector location;
  PVector velocity; 
  
  Bullet(float x, float y,float r, float dmg, float deg){
    location = new PVector(x, y);
    velocity = new PVector(10*cos(deg), 10*sin(deg));
    this.r = r;
    this.dmg = dmg;
  }
  
  void move() {
    location.add(velocity);
  }
  
  void display() {
    move();
    fill(200);
    ellipse(location.x, location.y, r * 2, r * 2);
  }
  
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
}
