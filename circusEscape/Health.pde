public class Health {
  float x, y;
  
  Health (float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  Health() {
    this(150, 150);
  }
  
  public void display() {   
    stroke(255, 0, 0);
    //left half of the heart
    line(x, y, x - 5, y - 5);
    line(x - 5, y - 5, x - 10, y);
    line(x - 10, y, x, y + 10);
    //right half of the heart
    line(x, y, x + 5, y - 5);
    line(x + 5, y - 5, x + 10, y);
    line(x + 10, y, x, y + 10);
  }
}
