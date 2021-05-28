public class Room{
  int mobCount;
  
  Room() {
    walls.add(new Wall(980,0,20,1000));
    walls.add(new Wall(0,0,20,1000));
    walls.add(new Wall(0,680,1600,20));
    walls.add(new Wall(0,0,1600,20));
    walls.add(new Wall(200,200,30,20));
  }
}
