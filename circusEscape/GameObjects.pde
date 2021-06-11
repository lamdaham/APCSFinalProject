public class GameObjects{
  float x, y;
  boolean pickedUp;
  
  
  //displays the gameObject
  void display() {
    if(!pickedUp) {
      fill(255);
      rect(x,y,10,10);
    }
  }

}
