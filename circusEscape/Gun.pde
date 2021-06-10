public class Gun extends GameObjects {

  String type;
  float degree;
  int cooldown;
  int t;

  Gun() {
    type = "pistol";
    pickedUp = true;
    degree = 0;
    cooldown = 5;
  }

  Gun(String type, float x, float y, int cooldown) {
    this.type = type;
    pickedUp = false;
    this.x = x; 
    this.y = y;
    this.cooldown = cooldown;
  }

  void gunAppearance() {
    if (type.equals("pistol")) {
      stroke(0);
      fill(0);
      rect(x, y, 30, 10);
      rect(x, y, 10, 20);
      line(x + 15, y + 10, x + 15, y + 15);
      line(x + 15, y + 15, x + 5, y + 15);
    }
  }

  void display() {
    if (!pickedUp) {
      gunAppearance();
      //fill(255);
      //rect(x, y, 10, 10);
    } else {
      degree = 0;
      pushMatrix();
      translate(p1.getX(), p1.getY());
      rotate(getAngle()- radians(45));
      fill(255);
      rect(12, 12, 10, 10);
      popMatrix();
    }
  }

  float getAngle() {
    return atan2(mouseY-p1.getY(), mouseX-p1.getX());
  }

  void fire(int extra) {
    if (t>=cooldown) {
      if (type.equals("pistol")) {
        bullet.add(new Bullet(p1.getX(), p1.getY(), 3, 5+extra, getAngle(), 10));
        t = 0;
      } else if (type.equals("shotgun")) {
        for (int ang = -50; ang <= 50; ang += 10) {
          bullet.add(new Bullet(p1.getX(), p1.getY(), 3, 2+extra, getAngle()+radians(ang), 10));
          t = 0;
        }
      } else if (type.equals("sniper")) {
        bullet.add(new Bullet(p1.getX(), p1.getY(), 6, 100 + extra, getAngle(), 30));
        t = 0;
      } else if (type.equals("minigun")) {
        bullet.add(new Bullet(p1.getX(), p1.getY(), 3, 3 + extra, getAngle(), 10));
        t = 0;
      }
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
