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



// picking up an GameObject and putting it in an inventory
  void getItem(GameObjects obj) {
    if (inventory[currentIndex] == null) {
      inventory[currentIndex] = obj;
    } else {
      inventory[currentIndex] = obj;
    }
  }


// returns the current objects
  GameObjects getObj() {
    return inventory[currentIndex];
  }
  

// changes the index based on the number key pressed
  void changeIndex() {
    if(space1) {
      currentIndex = 0;
    } else if (space2) {
      currentIndex = 1;
    } else if (space3) {
      currentIndex = 2;
    } else if (space4) {
      currentIndex = 3;
    } else if (space5) {
      currentIndex = 4;
    }
  }



//picks up the GameObject
  void pickup() {
    if(tempCooldown>=cooldown) {
      if (pickup) {
        for (Gun g : gun.get(scene.roomNum)) {
          if (dist(g.x, g.y, p1.getX(), p1.getY())<=p1.radius+6) {
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
          if (dist(p.x, p.y, p1.getX(), p1.getY())<=p1.radius+6) {
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
  
  
  //drops gun if the currentIndex is a gun
  void dropGun() {
    Gun tempGun = (Gun)inventory[currentIndex];
    gun.get(scene.roomNum).add(tempGun);
    tempGun.droppedGun();
    inventory[currentIndex] = null;
  }

  //drops potion if the currentIndex is a potion
  void dropPotion() {
    Potions tempPot = (Potions)inventory[currentIndex];
    potions.get(scene.roomNum).add(tempPot);
    tempPot.droppedPotion();
    inventory[currentIndex] = null;
  }


  //drops whatever is in the current index
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


// swaps game object if the currentIndex is full and player tries to pick up an object
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
