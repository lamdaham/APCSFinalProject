public class Player extends Characters{
  //four different boolean instance variables to keep track
  //of the direction player is moving using WASD keys
  private boolean up = false;
  private boolean down = false;
  private boolean right = false;
  private boolean left = false;
  
  //if key is pressed (WASD), then set appropriate boolean true
  void keyPressed() {
    if (key == 'w') {
      up = true;
    }
    if (key == 'a') {
      left = true;
    }
    if (key == 's') {
      down = true;
    }
    if (key == 'd') {
      right = true;
    }
  }
  
  //same as keyPressed but with released, set boolean false
  void keyReleased() {
    if (key == 'w') {
      up = false;
    }
    if (key == 'a') {
      left = false;
    }
    if (key == 's') {
      down = false;
    }
    if (key == 'd') {
      right = false;
    }
  }
}
