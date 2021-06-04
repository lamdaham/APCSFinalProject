public class Boss extends Monsters {

  int spawnMonsterCooldown;
  int tempCounter;
  boolean enraged;

  Boss() {
    super(1000, 5, 70, 800, 500, 1);
    spawnMonsterCooldown = 200;
    tempCounter = 0;
    enraged = false;
  }

  void spawnMonster() {
    if (tempCounter>=spawnMonsterCooldown) {
      monsters.add(new Monsters(5, 1, 10.0, x, y, 5));
      tempCounter = tempCounter % spawnMonsterCooldown;
    } else {
      tempCounter++;
    }
  }


  void moveM(Player p1) {
    if (hp <= 0) {
      speed = 0;
      hp = 0;
      alive = false;
    } else {
      spawnMonster();
      if (hp<=200) {
        enraged = true;
      }
    }

    //monster moves towards player
    if (abs(p1.x - x) > p1.radius) {
      if (p1.x - x < 0 && ableLeft) {
        x -= speed;
        if (enraged && p1.x - x < 0 && ableLeft) {
          x-=speed;
        }
      }
      if (p1.x - x >= 0 && ableRight) {
        x += speed;
        if (enraged && p1.x - x >= 0 && ableRight) {
          x += speed;
        }
      }
    }

    if (abs(p1.y - y) > p1.radius) {
      if (p1.y - y < 0 && ableUp) {
        y -= speed;
        if (enraged && p1.y - y < 0 && ableUp) {
          y -= speed;
        }
      }
      if (p1.y - y >= 0 && ableDown) {
        y += speed;
        if (enraged && p1.y - y >= 0 && ableDown) {
          y += speed;
        }
      }
    }
  }

  void display() {
    //idea: make the boss design a circus ringleader
    //hat
    stroke(#4d4d4d);
    strokeWeight(2);
    fill(0);
    ellipse(x, y - 25, radius * 1.75, radius / 1.5);
    noStroke();
    rect(x - 30, y - radius * 1.25, radius - 10, radius * 1.25);
    
    fill(255);
    circle(x, y, radius * 1.25);

    //eyes
    fill(0);
    circle(x - 20, y, radius / 3);
    circle(x + 20, y, radius / 3);
    fill(255);
    circle(x - 20, y, radius / 6);
    circle(x + 20, y, radius / 6);

    //eyebrows
    stroke(0);
    strokeWeight(4);
    line(x - 20, y - 30, x, y - 20);
    line(x + 20, y - 30, x, y - 20);
    
    //nose
    stroke(0);
    strokeWeight(1);
    line(x, y - 5, x - 3, y + 15);
    line(x - 3, y + 15, x + 5, y + 15);
    
    //mouth
    stroke(255, 0, 0);
    fill(255, 0, 0);
    arc(x, y + radius / 2, radius / 4, radius / 5, PI, 2 * PI);
    
    //mustache
    stroke(0);
    strokeWeight(4);
    line(x - 5, y + radius / 2 - 13, x - 20, y + radius/2 - 5);
    line(x + 5, y + radius / 2 - 13, x + 20, y + radius/2 - 5);
    
    print(hp + "\n");
  }
}
