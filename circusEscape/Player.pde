public class Player extends Characters {
  Gun currentGun;
  Potions currentPotion;
  String currentObj;
  boolean hasGun;
  int extraDamage;
  int maxHealth;
  int regenCooldown;
  int tempCooldown;
  Inventory inventory;


  Player() {
    super();
    maxHealth = hp;
    hasGun = false;
    extraDamage = 0;
    inventory = new Inventory();
    currentObj = "none";
    gun.get(scene.roomNum).add(new Gun("shotgun", 100, 100, 25));
    gun.get(scene.roomNum).add(new Gun("pistol", 700, 300, 10));
    gun.get(scene.roomNum).add(new Gun("minigun", 100, 500, 1));
    regenCooldown = 200;
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
    
    if (currentObj.equals("gun")) {
      currentGun.decreaseCooldown();
      inventory.dropGun();
    }
    inventory.pickupGun();
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

  void look() {
  }

  void fire() {
    if (leftMouse&&hasGun) {
      currentGun.fire(extraDamage);
    }
  }

  

  

  boolean isAlive() {
    return hp>0;
  }

  void regen() {
    if (hp<maxHealth) {
      //print(tempCooldown);
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
}
