public class Potions extends GameObjects {
  float x, y, radius;
  boolean consumed;

  Potions(float x, float y, float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    pickedUp = false;
    consumed = false;
  }

  Potions(Monsters m) {
    this(m.x, m.y, 10);
  }

  Potions() {
    float x1 = random(175, 650 + 175);
    float y1 = random(25, 520 + 25);
    for (int i = 0; i < walls.size(); i++) {
      if (walls.get(i).inWalls(x1, y1)) { 
        x1 = random(175, 650 + 175);
        y1 = random(25, 520 + 25);
        i = 0;
      }
    }
    x = x1;
    y = y1;
    radius = 10;
  }

  void display(Player p) {
    stroke(255);
    strokeWeight(2);
    fill(#a1ebed, 100);
    rect(x - 4, y - 17, radius - 2, 8);
    ellipse(x, y - 19, radius * 1.5, 2);
    fill(#f5e282, 255);
    rect(x - 3.5, y - 27, radius - 3.5, 7);
    fill(#f73520);
    circle(x, y - 4, radius * 1.5);
    int r = (int) random(0, 5);

    //if (dist(x, y, p1.getX(), p1.getY()) < p1.radius + radius) {
    //  //increasing health
    //  if (r == 0) {
    //    p.hp += 2;
    //    consumed = true;
    //  }
    //  //decreasing health
    //  if (r == 1) {
    //    if (p.hp >= 2) {
    //      p.hp -= 1;
    //      consumed = true;
    //    }
    //  }
    //  //increasing attack power
    //  if (r == 2) {
    //    p.atkPower += 2;
    //    consumed = true;
    //  }
    //  //decreasing attack power
    //  if (r == 3) {
    //    p.atkPower -= 2;
    //    consumed = true;
    //  }
    //}
  }

  void display(int xC, int yC) {
    stroke(255);
    strokeWeight(2);
    fill(#a1ebed, 100);
    rect(xC - 4, yC - 17, radius - 2, 8);
    ellipse(xC, yC - 19, radius * 1.5, 2);
    fill(#f5e282, 255);
    rect(xC - 3.5, yC - 27, radius - 3.5, 7);
    fill(#f73520);
    circle(xC, yC - 4, radius * 1.5);
  }

  void pickedupPotion() {
    pickedUp = true;
  }

  void droppedPotion() {
    x = p1.getX();
    y = p1.getY();
    pickedUp = false;
  }
  
  boolean use() {
    if (p1.hp<p1.maxHealth) {
      p1.setHP(p1.getHP()+2);
      if (p1.getHP()>p1.getMaxHealth()){
        p1.setHP(p1.getMaxHealth());
      }
      return true;
    } else {
      return false;
    }
  }
  
  
}
