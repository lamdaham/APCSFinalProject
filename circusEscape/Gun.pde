public class Gun extends GameObjects{
  
  String type;
  float degree;
  int cooldown;
  int t;
  
  Gun(){
    type = "pistol";
    pickedUp = true;
    degree = 0;
    cooldown = 10;
  }
  

  
  void display() {
    if(!pickedUp) {
      fill(255);
      rect(x,y,10,10);
    } else {
      degree = 0;
      pushMatrix();
        translate(p1.getX(), p1.getY());
        rotate(getAngle()- radians(45));
        fill(255);
        rect(16,16,10,10);
       popMatrix();
    }
  }
  
  float getAngle() {
    return atan2(mouseY-p1.getY(), mouseX-p1.getX());
  }
  
  void fire() {
    if(t>=cooldown) {
      bullet.add(new Bullet(p1.getX(), p1.getY(), 3, 5, getAngle()));
      t = 0;
    }
  }
  
  void decreaseCooldown() {
    t++;
  }
  
  void pickedupGun() {
    pickedUp = true;
  }
  
  void droppedGun() {
    x = p1.getX();
    y = p1.getY();
    pickedUp = false;
  }
}
