public class Potions extends GameObjects{
  float x, y;
  
  Potions(float x, float y) {
    this.x = x;
    this.y = y;
    pickedUp = false;
  }
  
  Potions(Monsters m) {
    this(m.x, m.y);
    pickedUp = false;
  }
  
  Potions() {
    this(random(30, width - 30), random(30, height - 30));
  }
  
  void display() {
    circle(x, y, 10);
  }
}
