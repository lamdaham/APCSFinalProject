public class Bullet {

  float r,dmg;
  
  int bounce;
  
  PVector location;
  PVector velocity; 
  
  Bullet(float x, float y,float r, float dmg, float deg, int bounce, int speed){
    location = new PVector(x, y);
    velocity = new PVector(speed*cos(deg), speed*sin(deg));
    this.r = r;
    this.dmg = dmg;
    this.bounce = bounce;
  }
  
  void move() {
    location.add(velocity);
  }
  
  void display() {
    move();
    fill(#4ced28);
    circle(location.x, location.y, r * 3);
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
