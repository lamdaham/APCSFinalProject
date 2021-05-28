public class Player extends Characters{
  //moving portion: if true for boolean
  //then adjust x and y accordingly w/ speed
  Gun currentGun;
  
  Player() {
    super();
    currentGun = new Gun();
    gun.add(currentGun);
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
  
  //displaying the player as just a white circle atm
  void display() {
    stroke(0);
    fill(255);
    ellipse(x, y, radius * 2, radius * 2);
    currentGun.decreaseCooldown();
    currentGun.display();
  }
  
  void fire() {
    if (leftMouse) {
      currentGun.fire();
    }
  }
}
