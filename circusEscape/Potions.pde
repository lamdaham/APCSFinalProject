public class Potions extends GameObjects {
  float x, y, radius;
  boolean consumed;
  int r;
  int m;

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
    r = (int) random(0, 4);
    m = (int) random(0, 3);
  }


//displays the potion
  void display() {
    stroke(255);
    strokeWeight(2);
    fill(#a1ebed, 100);
    rect(x - 4, y - 17, radius - 2, 8);
    ellipse(x, y - 19, radius * 1.5, 2);
    fill(#f5e282, 255);
    rect(x - 3.5, y - 27, radius - 3.5, 7);
    if (m!=0) {
      fill(#bc40dd);
    } else if(r==0) {
      fill(#f73520);
    } else if (r == 1){
      fill(#209a20);
    } else if (r == 2) {
      fill(#303ce1);
    } else if (r == 3) {
      fill(#c2ce00);
    }
    circle(x, y - 4, radius * 1.5);
    
  }


//displays the potion at a coordinate
  void display(int xC, int yC) {
    stroke(255);
    strokeWeight(2);
    fill(#a1ebed, 100);
    rect(xC - 4, yC - 17, radius - 2, 8);
    ellipse(xC, yC - 19, radius * 1.5, 2);
    fill(#f5e282, 255);
    rect(xC - 3.5, yC - 27, radius - 3.5, 7);
    if (m!=0) {
      fill(#bc40dd);
    } else if(r==0) {
      fill(#f73520);
    } else if (r == 1){
      fill(#209a20);
    } else if (r == 2) {
      fill(#303ce1);
    } else if (r == 3) {
      fill(#c2ce00);
    }
    circle(xC, yC - 4, radius * 1.5);
  }


//pick up a potion
  void pickedupPotion() {
    pickedUp = true;
  }


//drop a potion
  void droppedPotion() {
    x = p1.getX();
    y = p1.getY();
    pickedUp = false;
  }
  
  
//use a potion
  boolean use() {
    if (r == 0) {
      if (p1.getHP()<p1.getMaxHealth()) {
        p1.setHP(p1.getHP()+2);
        if (p1.getHP()>p1.getMaxHealth()){
          p1.setHP(p1.getMaxHealth());
        }
        return true;
      } else {
        return false;
      }
    } else if (r == 1) {
      p1.setHP(p1.getHP()-1);
      return true;
    } else if (r == 2) {
      p1.setATK(p1.getATK()+1);
      return true;
    } else if (r == 3) {
      p1.setATK(p1.getATK()-1);
      if (p1.getATK() < 0) {
        p1.setATK(0);
      }
      return true;
    } else {
      return false;
    }
  }
  
  
}
