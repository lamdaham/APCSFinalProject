public class Health {
  float x, y;
  
  Health (float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  Health() {
    this(50, 10);
  }
  
  public void display() {   
    stroke(255, 0, 0);
    //left half of the heart
    line(x, y, x - 10, y - 10);
    line(x - 10, y - 10, x - 20, y);
    line(x - 20, y, x, y + 20);
  }
}
