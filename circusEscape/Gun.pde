public class Gun extends GameObjects{
  
  String type;
  float degree;
  
  Gun(){
    type = "pistol";
    pickedUp = true;
    degree = 0;
  }
  
  void fireBullet() {
    
  }
  
  void display() {
    if(!pickedUp) {
      fill(255);
      rect(x,y,10,10);
    } else {
      degree = 0;
      pushMatrix();
        translate(p1.getX(), p1.getY());
        rotate(getAngle());
        fill(255);
        rect(5,5,10,10);
       popMatrix();
    }
  }
  
  float getAngle() {
    return atan2(mouseY-p1.getY(), mouseX-p1.getX());
  }
  
  void fire() {
    bullet.add(new Bullet(p1.getX(), p1.getY(), 3, 3, getAngle()));
  }
}
