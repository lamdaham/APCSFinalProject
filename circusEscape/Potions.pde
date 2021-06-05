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
    fill(#a1ebed, 100);
    ellipse(x, y, radius * 2, radius * 2.5);
  }
}
