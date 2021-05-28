public class Monsters extends Characters{
  //same as Player, copying constructors from Characters
  //changing size/color of monsters and setting the position at random positions
  Monsters(int hp, int atkPower, float rad, float x, float y, float speed) {
    this.hp = hp;
    this.atkPower = atkPower;
    radius = rad;
    this.x = x;
    this.y = y;
    this.speed = speed;
  }
  
  Monsters() {
    this(5, 1, 10.0, random(0, width), random(0, height), random(6) - 3);
  }
  
  //moving monsters around (just in one direction at the moment)
  //if hp is 0, then set hp + speed to 0 
  //differentiate from "alive" monsters
  void moveM() {
    if (hp <= 0) {
      speed = 0;
      hp = 0;
      alive = false;
    }
    x += speed;
    y += speed;
  }
  
  //if the player and monsters are touching, then attack the player and decrease health
  void attackP(Player p1) {
    if (dist(x, y, p1.x, p1.y) < p1.radius + radius) {
      p1.hp -= atkPower;
    }
  }
  
  boolean takeDamage(Bullet b) {
    if (dist(b.getX(),b.getY(), x,y)<=(radius+b.getR())&&alive) {
      hp -= b.getdmg();
      return true;
    }
    return false;
  }
  
  void display() {
    stroke(0);
    if (alive == false) {
      fill(255, 0, 0);
    }
    if (alive == true) {
      fill(100);
    }
    ellipse(x, y, radius * 2, radius * 2);
    textSize(10);
    text("health: " + hp, x + 15, y + 12);
  }
}
