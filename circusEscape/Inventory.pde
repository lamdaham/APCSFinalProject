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
  
}
