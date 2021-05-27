public class Characters {
  int hp, atkPower, dmgTaken, fireRate;
  float x, y, speed, radius;
  
  //constructor w/ health, attack power (starting with just a circle to represent character)
  //also accounting for radius, x, y, and the speed
  Characters(int hp, int atkPower, float rad, float x, float y, float speed) {
    this.hp = hp;
    this.atkPower = atkPower;
    radius = rad;
    this.x = x;
    this.y = y;
    this.speed = speed;
  }
  
  //constructor without parameters
  Characters() {
    this(10, 2, 5, width/2, height/2, 2);
  }
}
