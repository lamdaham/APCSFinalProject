public class Player extends Characters {
  Gun currentGun;
  Potions currentPotion;
  String currentObj;
  boolean hasGun;
  int maxHealth;
  int regenCooldown;
  int tempCooldown;
  Inventory inventory;


  Player() {
    super();
    hp=10;
    maxHealth = hp;
    hasGun = false;
    inventory = new Inventory();
    currentObj = "none";
    gun.get(scene.roomNum).add(new Gun("pistol", 700, 300, 5));
    regenCooldown = 1000;
    tempCooldown = 0;
  }

  //moving the player
  void moveP() {
    if (up && ableUp) {
      this.y -= speed;
    }
    if (down && ableDown) {
      this.y += speed;
    }
    if (left && ableLeft) {
      this.x -= speed;
    }
    if (right && ableRight) {
      this.x += speed;
    }
  }

  //attacking monster if the player is touching the monster
  //decrease monster health based off player's attack power
  void attackM(Monsters m) {
    if (dist(x, y, m.x, m.y) < m.radius + radius) { 
      m.hp -= atkPower;
    }
  }

  //the appearance of the player and gun
  void display() {
    noStroke();

    fill(0);
    //ears
    circle(x - radius * 2 + 26, y - 13, radius - 5);
    circle(x - radius * 2 + 53, y - 13, radius - 5);

    //arms
    //ellipse(x - radius * 2 + 25, y + 20, radius * 1.3, radius * 2 - 20);
    //ellipse(x - radius * 2 + 55, y + 20, radius * 1.3, radius * 2 - 20);

    //feet
    //ellipse(x - radius * 2 + 30, y + radius * 2 + 5, radius * 2 - 20, radius - 2);
    //ellipse(x - radius * 2 + 50, y + radius * 2 + 5, radius * 2 - 20, radius - 2);

    fill(255);
    //basic head + body of panda
    //ellipse(x, y + 25, radius * 1.8, radius * 1.5 + 5);
    stroke(#c7c7c7);
    strokeWeight(1);
    ellipse(x, y, radius * 1.7, radius * 1.5 + 3); 

    //eyes
    fill(0);
    ellipse(x - radius / 2 + 3, y - 2, radius / 2 + 2, radius / 2 + 2);
    ellipse(x + radius / 2 - 3, y - 2, radius / 2 + 2, radius / 2 + 2);
    //pupils
    fill(255);
    circle(x - radius / 2 + 3, y - 2, radius / 6);
    circle(x + radius / 2 - 3, y - 2, radius / 6);
    //nose + mouth
    fill(#edcce2);
    triangle(x - 3, y + 5, x + 3, y + 5, x, y + 8);
    stroke(#edcce2);
    line(x, y + 8, x - 3, y + 11);
    line(x, y + 8, x + 3, y + 11);
    
    if (currentObj.equals("gun")) {
      currentGun.decreaseCooldown();
    }
    
    // drop/pickup item in inventory when button is pressed
    inventory.drop();
    inventory.pickup();
    // change index to the number pressed.
    inventory.changeIndex();
    
    regen();
    if (inventory.getObj() instanceof Gun) {
      if (inventory.getObj().equals(currentGun)) {
        currentObj = "gun";
        hasGun = true;
      } else {
        currentGun = (Gun)inventory.getObj();
        currentObj = "gun";
        hasGun = true;
      }
    } else if (inventory.getObj() instanceof Potions) {
      if (inventory.getObj().equals(currentPotion)) {
        currentObj = "potion";
        hasGun = false;
      } else {
        currentPotion = (Potions)inventory.getObj();
        currentObj = "potion";
        hasGun = false;
      }
    } else {
      currentObj = "none";
      hasGun = false;
    }
  }


//fires a gun in the direction of the mouse
  void fire() {
    if (leftMouse&&hasGun) {
      currentGun.fire(atkPower);
    } else if (leftMouse&&currentObj.equals("potion")) {  
      if(currentPotion.use()) {
        (inventory.inventory)[inventory.currentIndex] = null;
      }
    }
  }

  
//checks if player has gun
  boolean hasGun() {
    return hasGun;
  }
  
// returns the current gun
  Gun getCurrentGun() {
    return currentGun;
  }
  
// takes damage from bullets if they are from monsters
  boolean takeDamage(Bullet b) {
    if (b.getStatus()) {
      if (dist(b.getX(), b.getY(), x, y)<=(radius+b.getR())&&isAlive()) {
        hp -= b.getdmg();
        return true;
      }
    }
    return false;
  }
  
// checks to see if player is alive
  boolean isAlive() {
    return hp>0;
  }
  
  
// returns maxHealth
  int getMaxHealth() {
    return maxHealth;
  }
  
// set atkPower of player
  void setATK(int pwr) {
    atkPower = pwr;
  }


// player regenerates one health after a period of time
  void regen() {
    if (hp<maxHealth) {
      if (tempCooldown>=regenCooldown) {
        hp++;
        tempCooldown = tempCooldown%regenCooldown;
      } else {
        tempCooldown++;
      }
    } else {
      tempCooldown = 0;
    }
  }
  
  
  //buffs from buffscreen
  void regenBuff() {
    regenCooldown-=100;
  }
  
  void maxHealthBuff() {
    maxHealth++;
  }
}
