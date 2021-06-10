public class Inventory {
  
  GameObjects[] inventory;
  int currentIndex;
  
  Inventory() {
    inventory = new GameObjects[10];
    currentIndex = 0;
  }
  
  void getItem(GameObjects obj) {
    if(inventory[currentIndex] == null) {
      inventory[currentIndex] = obj;
    } else {
      inventory[currentIndex].drop();
      inventory[currentIndex] = obj;
    }
  }
  
  void display() {
    
  }
  
  boolean overRect(float x, float y, float rectWidth, float rectHeight) {
    if (mouseX >= x && mouseX <= x+rectWidth && mouseY >= y && mouseY <= y+rectHeight) {
      return true;
    }
    return false;
  }
}
