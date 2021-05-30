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
    this(5, 1, 10.0, random(0+30, width-30), random(0+30, height-30), 0);
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
    if (alive){
      if (dist(x, y, p1.x, p1.y) < p1.radius + radius) {
        p1.hp -= atkPower;
      }
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
      fill(255);
    }
    
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
    
    fill(0);
    textSize(10);
    text("health: " + hp, x + 15, y + 12);
  }
  
  boolean withinRange() {
    return false;
  }
}
