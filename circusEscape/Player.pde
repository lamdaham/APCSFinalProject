public class Player extends Characters{
  //moving portion: if true for boolean
  //then adjust x and y accordingly w/ speed
  Gun currentGun;
  boolean hasGun;
  
  Player() {
    super();
    currentGun = new Gun();
    gun.add(currentGun);
    hasGun = true;
  }
  
  void moveP() {
    if (up && ableUp) {
      this.y -= speed;
    }
    if (down && ableDown) {
      this.y += speed;
    }
    if (left && ableLeft) {
      this.x -= speed;
    }
    if (right && ableRight) {
      this.x += speed;
    }
  }
  
  void attackM(Monsters m) {
    if (dist(x, y, m.x, m.y) < m.radius + radius) {
      //this is so that every time the player touches the monster
      //the monster's health wouldn't switch
      if (c != 100) {       
        m.hp -= atkPower;
      }
      m.hp = 0;
    }
  }
  
  void display() {
    noStroke();
    
    //black part of panda is purple atm
    fill(#9c64ba);
    //ears
    circle(x - radius * 2 + 26, y - 15, radius);
    circle(x - radius * 2 + 53, y - 15, radius);
    
    //arms
    ellipse(x - radius * 2 + 25, y + 20, radius * 1.3, radius * 2 - 20);
    ellipse(x - radius * 2 + 55, y + 20, radius * 1.3, radius * 2 - 20);
    
    //feet
    ellipse(x - radius * 2 + 30, y + radius * 2 + 5, radius * 2 - 20, radius - 2);
    ellipse(x - radius * 2 + 50, y + radius * 2 + 5, radius * 2 - 20, radius - 2);
    
    fill(255);
    //basic head + body of panda
    ellipse(x, y + 25, radius * 1.8, radius * 1.5 + 5);
    stroke(#c7c7c7);
    ellipse(x, y, radius * 1.7, radius * 1.5 + 3); 
    
    //eyes
    fill(0);
    ellipse(x - radius / 2 + 3, y - 2, radius / 2 + 2, radius / 2 + 2);
    ellipse(x + radius / 2 - 3, y - 2, radius / 2 + 2, radius / 2 + 2);
    //pupils
    fill(255);
    circle(x - radius / 2 + 3, y - 2, radius / 6);
    circle(x + radius / 2 - 3, y - 2, radius / 6);
    
    currentGun.decreaseCooldown();
    currentGun.display();
    dropGun();
    pickupGun();
  }
   
  void look() {
  }
  
  void fire() {
    if (leftMouse&&hasGun) {
      currentGun.fire();
    }
  }
  
  void dropGun() {
    if(drop&&hasGun) {
      currentGun.droppedGun();
      hasGun = false;
    }
  }
  
  void pickupGun() {
    if(pickup) {
      for(Gun g: gun) {
        if (dist(g.x,g.y,x,y)<=radius+6) {
          if(hasGun) {
            dropGun();
          }
          g.pickedupGun();
          currentGun = g;
          hasGun = true;
          break;
        }
      }
    }
  }
  
  boolean isAlive() {
    return hp>0;
  }
}
