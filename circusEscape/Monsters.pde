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
    this(5, 1, 10.0, random(0, width), random(0, height), random(0, 3));
  }
  
  //moving monsters around (just in one direction at the moment)
  //have some delay so the monsters aren't speeding around
  void moveM() {
    this.x += speed;
    this.y += speed;
    delay(1);
  }
  
  //if the player and monsters are touching, then attack the player and decrease health
  void attackP(Player p1) {
    if (dist(x, y, p1.x, p1.y) < p1.radius + radius) {
      p1.hp -= atkPower;
    }
  }
  
  void display() {
    stroke(0);
    fill(100);
    ellipse(x, y, radius * 2, radius * 2);
  }
}
