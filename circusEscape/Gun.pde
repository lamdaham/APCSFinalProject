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
      pushMatrix();
        rotate(radians(degree));
        fill(255);
        rect(p1.getX(),p1.getY(),10,10);
       popMatrix();
      degree++;
    }
  }
  
}
