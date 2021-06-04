public class Room {
  int mobCount;
  int roomNum;

  Room(int num) {

    roomNum = num;
  }

  int getMobCount() {
    return monsters.size();
  }

  void defaultRoom() {
    walls.add(new Wall(980, 0, 20, 1000));
    walls.add(new Wall(0, 0, 20, 1000));
    walls.add(new Wall(0, 680, 1600, 20));
    walls.add(new Wall(0, 0, 1600, 20));
  }

  void spawnMobs() {
    for (int i = 0; i < roomNum * 5; i++) {
      monsters.add(0, new Monsters(.3  *roomNum));
      for (int w = 0; w<walls.size(); w++) {
        if ((walls.get(w)).moveRestrict(monsters.get(0)) 
          || dist((monsters.get(0)).getX(), monsters.get(0).getY(), p1.getX(), p1.getY())<50) {
          monsters.remove(0);
          monsters.add(0, new Monsters(.75*roomNum));
          w=0;
        }
      }
      mobCount=monsters.size();
    }
  }
  
  
  void room1() {
    defaultRoom();
    walls.add(new Wall(250, 150, 500, 30));
    walls.add(new Wall(250, 300, 500, 30));
    walls.add(new Wall(250, 450, 500, 30));
  }
  
  void bossRoom() {
    clear();
    defaultRoom();
    Boss boss = new Boss();
    monsters.add(boss);
  }
  
  void updateCount() {
    mobCount=monsters.size();
  }
} 
