public class Player extends Characters{
  //moving portion: if true for boolean
  //then adjust x and y accordingly w/ speed
  Gun gun;
  
  Player() {
    super();
    gun = new Gun();
    
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
      m.hp -= atkPower;
    }
  }
  
  //displaying the player as just a white circle atm
  void display() {
    stroke(0);
    fill(255);
    ellipse(x, y, radius * 2, radius * 2);
    gun.decreaseCooldown();
    gun.display();
  }
  
  void fire() {
    if (leftMouse) {
      gun.fire();
    }
  }
}
