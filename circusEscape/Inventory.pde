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
  
  
  GameObjects getObj() {
    return inventory[currentIndex];
  }
  
  boolean overRect(float x, float y, float rectWidth, float rectHeight) {
    if (mouseX >= x && mouseX <= x+rectWidth && mouseY >= y && mouseY <= y+rectHeight) {
      return true;
    }
    return false;
  }
  
  
  void pickupGun() {
    if (pickup) {
      for (Gun g : gun.get(scene.roomNum)) {
        if (dist(g.x, g.y, p1.x, p1.y)<=p1.radius+6) {
          if (p1.hasGun) {
            dropGun();
          }
          g.pickedupGun();
          gun.get(scene.roomNum).remove(g);
          inventory[currentIndex] = g;
          break;
        }
      }
    }
  }
  
  void dropGun() {
    if (drop) {
      Gun tempGun = (Gun)inventory[currentIndex];
      gun.get(scene.roomNum).add(tempGun);
      tempGun.droppedGun();
    }
  }
}
