public class Room {
  int mobCount;

  Room(int num) {
    walls.add(new Wall(980, 0, 20, 1000));
    walls.add(new Wall(0, 0, 20, 1000));
    walls.add(new Wall(0, 680, 1600, 20));
    walls.add(new Wall(0, 0, 1600, 20));
    walls.add(new Wall(200, 200, 30, 20));
    for (int i = 0; i < num * 5; i++) {
      monsters.add(0, new Monsters(.75  *num));
      for(int w = 0; w<walls.size(); w++) {
        if((walls.get(w)).moveRestrict(monsters.get(0))){
          monsters.remove(0);
          monsters.add(0, new Monsters(.75*num));
          w=0;
        }
      }
      mobCount++;
    }
  }
  
  int getMobCount() {
    mobCount = 0;
    for(Monsters m : monsters) {
      if (m.alive) {
        mobCount++;
      }
    }
    return mobCount;
  }
} 
