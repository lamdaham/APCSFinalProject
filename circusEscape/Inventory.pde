public class Inventory {

  GameObjects[] inventory;
  int currentIndex;
  int cooldown;
  int tempCooldown;

  Inventory() {
    inventory = new GameObjects[10];
    currentIndex = 0;
    cooldown = 10;
    tempCooldown = 0;
  }

  void getItem(GameObjects obj) {
    if (inventory[currentIndex] == null) {
      inventory[currentIndex] = obj;
    } else {
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
  
  
  void changeIndex() {
    if(space1) {
      currentIndex = 0;
    } else if (space2) {
      currentIndex = 1;
    } else if (space3) {
      currentIndex = 2;
    }
  }


  void pickup() {
    if(tempCooldown>=cooldown) {
      if (pickup) {
        for (Gun g : gun.get(scene.roomNum)) {
          if (dist(g.x, g.y, p1.x, p1.y)<=p1.radius+6) {
            if (inventory[currentIndex]!=null) {
              swap();
            }
            g.pickedupGun();
            gun.get(scene.roomNum).remove(g);
            getItem(g);
            tempCooldown = 0;
            return;
          }
        }
        for (Potions p : potions.get(scene.roomNum)) {
          if (dist(p.x, p.y, p1.x, p1.y)<=p1.radius+6) {
            if (inventory[currentIndex]!=null) {
              swap();
            }
            p.pickedupPotion();
            potions.get(scene.roomNum).remove(p);
            getItem(p);
            tempCooldown = 0;
            return;
          }
        }
      }
    } else {
      tempCooldown++;
    }
  }

  void dropGun() {
    Gun tempGun = (Gun)inventory[currentIndex];
    gun.get(scene.roomNum).add(tempGun);
    tempGun.droppedGun();
    inventory[currentIndex] = null;
  }

  void dropPotion() {
    Potions tempPot = (Potions)inventory[currentIndex];
    potions.get(scene.roomNum).add(tempPot);
    tempPot.droppedPotion();
    inventory[currentIndex] = null;
  }

  void drop() {
    if (drop) {
      if (inventory[currentIndex] != null) {
        if (inventory[currentIndex] instanceof Gun) {
          dropGun();
        } else if (inventory[currentIndex] instanceof Potions) {
          dropPotion();
        }
      }
    }
  }

  void swap() {
    if (inventory[currentIndex] != null) {
      if (inventory[currentIndex] instanceof Gun) {
        dropGun();
      } else if (inventory[currentIndex] instanceof Potions) {
        dropPotion();
      }
    }
  }
}
