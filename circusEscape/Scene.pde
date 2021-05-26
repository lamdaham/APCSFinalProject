public class Scene {

  void clearBoard() {
    clear();
  }

  void createRoom() {
    walls.add(new Wall(1580,0,20,1000));
    walls.add(new Wall(0,0,20,1000));
    walls.add(new Wall(0,980,1600,20));
    walls.add(new Wall(0,0,1600,20));
  }
}
