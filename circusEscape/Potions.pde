public class Potions extends GameObjects{
  float x, y, radius;
  
  Potions(float x, float y, float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    pickedUp = false;
  }
  
  Potions(Monsters m) {
    this(m.x, m.y, 10);
    pickedUp = false;
  }
  
  Potions() {
    this(random(30, width - 30), random(30, height - 30), 10);
  }
  
  void display() {
    stroke(255);
    strokeWeight(2);
    fill(#f73520);
    circle(x, y - 2, radius * 1.5);    
    fill(#a1ebed, 100);
    rect(x - 4, y - 17, radius - 2, 8);
    ellipse(x, y - 19, radius * 1.5, 2);
    fill(#f5e282, 255);
    rect(x - 3, y - 29, radius - 3.5, 10);
  }
}
