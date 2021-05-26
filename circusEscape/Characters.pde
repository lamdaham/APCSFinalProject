public class Characters {
  int hp, atkPower;
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
}
