public class Boss extends Monsters {

  int spawnMonsterCooldown;
  int tempCounter;
  boolean enraged;

  Boss() {
    super(1000, 5, 70, 800, 500, 2);
    spawnMonsterCooldown = 30;
    tempCounter = 0;
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
    }

    //monster moves towards player
    if (abs(p1.x - x) > p1.radius) {
      if (p1.x - x < 0 && ableLeft) {
        x -= speed;
      }
      if (p1.x - x >= 0 && ableRight) {
        x += speed;
      }
    }

    if (abs(p1.y - y) > p1.radius) {
      if (p1.y - y < 0 && ableUp) {
        y -= speed;
      }
      if (p1.y - y >= 0 && ableDown) {
        y += speed;
      }
    }
  }
}
