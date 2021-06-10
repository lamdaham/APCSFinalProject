public class Monsters extends Characters {
  int cooldown, t;
  Gun gunM;

  //same as Player, copying constructors from Characters
  //changing size/color of monsters and setting the position at random positions
  Monsters(int hp, int atkPower, float rad, float x, float y, float speed) {
    this.hp = hp;
    this.atkPower = atkPower;
    radius = rad;
    this.x = x;
    this.y = y;
    this.speed = speed;
    cooldown = 30;
    t = 0;
    gunM = new Gun();
  }

  //monsters spawn randomly on the map
  Monsters() {
    this(5, 1, 10.0, random(0+30, width-30), random(0+30, height-30), 2);
  }
  
  Monsters(float speed) {
    this(5, 1, 10.0, random(0+30, width-30), random(0+30, height-30), speed);
  }

  //if hp is 0, then set hp + speed to 0 
  //differentiate from "alive" monsters
  void moveM(Player p1) {
    if (hp <= 0) {
      speed = 0;
      hp = 0;
      alive = false;
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

  //if the player and monsters are touching, then attack the player and decrease health
  void attackP(Player p1) {
    if (alive) {
      if (dist(x, y, p1.x, p1.y) < p1.radius + radius && t>=cooldown) {
        p1.hp -= atkPower;
        t = 0;
      } else {
        t++;
      }
    }
  }

  boolean takeDamage(Bullet b) {
    if (dist(b.getX(), b.getY(), x, y)<=(radius+b.getR())&&alive) {
      hp -= b.getdmg();
      return true;
    }
    return false;
  }

  //appearance of the monster
  void display() {
    //hair
    noStroke();
    fill(#e84646);
    stroke(#b52b2b);
    circle(x - 13, y - 5, radius - 1);
    circle(x - 13, y + 5, radius - 1);
    circle(x - 16, y, radius + 1);
    circle(x + 13, y - 5, radius - 1);
    circle(x + 13, y + 5, radius - 1);
    circle(x + 16, y, radius + 1);

    //face
    noStroke();
    fill(255);
    circle(x, y, radius * 3);
    //eyes
    fill(#1538e8);
    ellipse(x - 7, y - 3, radius - 2, radius - 1);
    ellipse(x + 7, y - 3, radius - 2, radius - 1);
    fill(255);
    ellipse(x - 7, y - 3, radius - 3.5, radius - 2);
    ellipse(x + 7, y - 3, radius - 3.5, radius - 2);
    fill(0);
    circle(x - 7, y - 3, radius - 7);
    circle(x + 7, y - 3, radius - 7);

    //nose
    fill(#e84646);
    circle(x, y + 3, 5);

    //mouth
    fill(#eb2323);
    ellipse(x, y + 10, radius + 2, radius - 5);
    fill(255);
    ellipse(x, y + 10, radius - 2, radius - 6);

    //cheeks
    fill(#f5bff2, 191);
    circle(x - 8, y + 6, radius - 4);
    circle(x + 8, y + 6, radius - 4);

    //eyebrows
    stroke(0);
    strokeWeight(1);
    line(x - 5, y - 10, x, y - 5);
    line(x, y - 5, x + 5, y - 10);

    //displaying the health for reference
    //fill(0);
    //textSize(10);
    //text("health: " + hp, x + 15, y + 12);
  }
  
  void fireM() {
    if (t >= cooldown) {
      bulletM.add(new Bullet(x, y, 3, 5, getAngleM() + PI, 10));
      t = 0;
    }
  }
  
  float getAngleM() {
    return atan2(y - p1.getY(), x - p1.getX());
  }

  boolean withinRange() {
    return false;
  }
}
