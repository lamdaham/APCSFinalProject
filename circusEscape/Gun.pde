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


// displays the amazing design of guns
  void gunAppearance() {
    if (type.equals("pistol")) {
      stroke(0);
      fill(0);
      rect(x, y, 30, 10);
      rect(x, y, 10, 20);
      line(x + 15, y + 10, x + 15, y + 15);
      line(x + 15, y + 15, x + 5, y + 15);
    }
    if (type.equals("minigun")) {
      noStroke();
      fill(0);
      rect(x, y - 2.5, 10, 5);
      stroke(#cccccc);
      ellipse(x - 3, y, 10, 5);
      noStroke();
      rect(x - 4, y + 2.5, 8, 3);
      rect(x - 6, y + 5.5, 13, 7);
      stroke(0);
      line(x + 10, y - 1.5, x + 20, y - 1.5);
      line(x + 10, y, x + 20, y);
      line(x + 10, y + 1.5, x + 20, y + 1.5);
    }
    if (type.equals("shotgun")) {
      noStroke();
      fill(0);
      pushMatrix();
      translate(x, y);
      rotate(PI/3.0);
      rect(10, -15, 10, 15);
      popMatrix();
      rect(x + 18, y, 40, 13);
      rect(x + 18, y + 10, 10, 15);
      stroke(0);
      line(x + 15, y + 10, x + 15, y + 17);
      line(x + 15, y + 17, x + 25, y + 17);
    }
    if (type.equals("sniper")) {
      noStroke();
      fill(0);
      pushMatrix();
      translate(x, y);
      rotate(-PI/3.0);
      rect(10, -15, 15, 10);
      popMatrix();
      rect(x + 2, y - 28, 50, 10);
      rect(x + 5, y - 33, 10, 5);
      rect(x - 15, y - 18, 15, 10);
      stroke(0);
      strokeWeight(2);
      line(x + 32, y - 18, x + 40, y - 10);
      line(x + 32, y - 18, x + 24, y - 10);
      line(x + 32, y - 18, x + 32, y - 10);
    }
  }
  
  
  //displays the design at an x y coordinate
  void gunAppearance(int xC, int yC) {
    if (type.equals("pistol")) {
      stroke(0);
      fill(0);
      rect(xC, yC, 30, 10);
      rect(xC, yC, 10, 20);
      line(xC + 15, yC + 10, xC + 15, yC + 15);
      line(xC + 15, yC + 15, xC + 5, yC + 15);
    }
    if (type.equals("minigun")) {
      noStroke();
      fill(0);
      rect(xC, yC - 2.5, 10, 5);
      stroke(#cccccc);
      ellipse(xC - 3, yC, 10, 5);
      noStroke();
      rect(xC - 4, yC + 2.5, 8, 3);
      rect(xC - 6, yC + 5.5, 13, 7);
      stroke(0);
      line(xC + 10, yC - 1.5, xC + 20, yC - 1.5);
      line(xC + 10, yC, xC + 20, yC);
      line(xC + 10, yC + 1.5, xC + 20, yC + 1.5);
    }
    if (type.equals("shotgun")) {
      noStroke();
      fill(0);
      pushMatrix();
      translate(xC, yC);
      rotate(PI/3.0);
      rect(10, -15, 10, 15);
      popMatrix();
      rect(xC + 18, yC, 40, 13);
      rect(xC + 18, yC + 10, 10, 15);
      stroke(0);
      line(xC + 15, yC + 10, xC + 15, yC + 17);
      line(xC + 15, yC + 17, xC + 25, yC + 17);
    }
    if (type.equals("sniper")) {
      noStroke();
      fill(0);
      pushMatrix();
      translate(xC, yC);
      rotate(-PI/3.0);
      rect(10, -15, 15, 10);
      popMatrix();
      rect(xC + 2, yC - 28, 50, 10);
      rect(xC + 5, yC - 33, 10, 5);
      rect(xC - 15, yC - 18, 15, 10);
      stroke(0);
      strokeWeight(2);
      line(xC + 32, yC - 18, xC + 40, yC - 10);
      line(xC + 32, yC - 18, xC + 24, yC - 10);
      line(xC + 32, yC - 18, xC + 32, yC - 10);
    }
  }

//displays it when the player holds it
  void display() {
    if (!pickedUp) {
      gunAppearance();
      //fill(255);
      //rect(x, y, 10, 10);
    } else {
      degree = 0;
      pushMatrix();
      translate(p1.getX(), p1.getY()+10);
      rotate(getAngle()- radians(45));
      fill(255);
      rect(4, 4, 10, 10);
      popMatrix();
    }
  }
  

//returns the angle from the player to the mouse; aims the gun
  float getAngle() {
    return atan2(mouseY-p1.getY(), mouseX-p1.getX());
  }

// fires a bullet in the direction angle with the damage of the bullet
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


//decreases cooldown; when t reaches a certain point, it allows the gun to fire again
  void decreaseCooldown() {
    t++;
  }


//pick up and drop gun
  void pickedupGun() {
    pickedUp = true;
  }

  void droppedGun() {
    x = p1.getX();
    y = p1.getY();
    pickedUp = false;
  }
}
