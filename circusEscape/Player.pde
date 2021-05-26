public class Player extends Characters{
  //moving portion: if true for boolean
  //then adjust x and y accordingly w/ speed
  void moveP() {
    if (up) {
      this.y -= speed;
    }
    if (down) {
      this.y += speed;
    }
    if (left) {
      this.x -= speed;
    }
    if (right) {
      this.x += speed;
    }
  }
  
  //displaying the player as just a white circle atm
  void display() {
    stroke(0);
    fill(255);
    ellipse(x, y, radius * 2, radius * 2);
  }
}
