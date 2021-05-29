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
    stroke(0);
    
    //black part of panda is purple atm
    fill(#9c64ba);
    //ears
    circle(x - radius * 2 + 23, y - 13, radius + 3);
    circle(x - radius * 2 + 55, y - 13, radius + 3);
    
    //arms
    //rotate(PI/3.0);
    ellipse(x - radius * 2 + 25, y + 25, radius * 1.3, radius * 2 - 20);
    ellipse(x - radius * 2 + 55, y + 25, radius * 1.3, radius * 2 - 20);
    
    //feet
    ellipse(x - radius * 2 + 30, y + radius * 2 + 10, radius * 2 - 20, radius - 2);
    ellipse(x - radius * 2 + 50, y + radius * 2 + 10, radius * 2 - 20, radius - 2);
        
    fill(255);
    //basic head + body of panda
    ellipse(x, y + 30, radius * 2, radius * 2 + 5);
    ellipse(x, y, radius * 2 + 5, radius * 2); 
    
    //eyes
    fill(0);
    ellipse(x - radius / 2, y - 2, radius / 2 + 2, radius / 2 + 3);
    ellipse(x + radius / 2, y - 2, radius / 2 + 2, radius / 2 + 3);
    //pupils
    fill(255);
    circle(x - radius / 2, y - 2, radius / 4);
    circle(x + radius / 2, y - 2, radius / 4);
    
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
}
