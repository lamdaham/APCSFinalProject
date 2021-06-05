public class Potions {
  float x, y;
  
  Potions(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  Potions(Boss b1) {
    this(b1.x, b1.y);
  }
}
