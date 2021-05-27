public class GameObjects{
  float x, y;
  boolean pickedUp;
  
  void display() {
    if(!pickedUp) {
      fill(255);
      rect(x,y,10,10);
    }
  }
}
