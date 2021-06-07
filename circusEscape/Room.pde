public class Room {
  int mobCount;
  int roomNum;
  int x, y, w, h;
  int spawnX, spawnY;
  int endX, endY;

  Room(int num) {

    roomNum = num;
    x=175;
    y=25;
    w=650;
    h=520;
  }

  int getMobCount() {
    return monsters.size();
  }

  void defaultRoom() {
    walls.add(new Wall(825, 0, 175, 1000));
    walls.add(new Wall(0, 0, 175, 1000));
    walls.add(new Wall(0, 545, 1600, 155));
    walls.add(new Wall(0, 0, 1600, 25));
  }

  void spawnMobs() {
    for (int i = 0; i < roomNum * 5; i++) {
      monsters.add(0, new Monsters(.3  *roomNum));
      for (int w = 0; w<walls.size(); w++) {
        if ((walls.get(w)).moveRestrict(monsters.get(0)) 
          || dist((monsters.get(0)).getX(), monsters.get(0).getY(), p1.getX(), p1.getY())<50) {
          monsters.set(0, new Monsters(.75*roomNum));
          w=0;
        }
      }
      mobCount=monsters.size();
    }
  }


  void createRoom() {
    if (roomNum == 0) {
      room0();
    } else if (roomNum==1) {
      room1();
    } else if (roomNum==2){
      room2();
    } else if (roomNum>=2){
      defaultRoom();
    }
    
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
  
  void room0() {
    defaultRoom();
    spawnX = 500;
    spawnY = 350;
    walls.add(new Door(x, y+520,130,10, "foward"));
  }
  
  void room1() {
    defaultRoom();
    spawnX = 240;
    spawnY = 90;
    endX = 195+x;
    endY = y+h-65;
    walls.add(new Wall(x+130, y+0, 10, 130, #800080));
    walls.add(new Wall(x+130, y+130, 130, 10, #800080));
    walls.add(new Wall(x+260, y+130, 10, 130, #800080));
    walls.add(new Wall(x, y+260, 130, 260, #800080));

    walls.add(new Wall(x+520, y+0, 130, 130, #800080));
    walls.add(new Wall(x+400, y+130, 130, 10, #800080));
    walls.add(new Wall(x+400, y+130, 250, 130, #800080));


    walls.add(new Wall(x+w-130, y+h-130, 130, 130, #800080));
    walls.add(new Door(x+130, y+520,130,10, "foward"));
  }
  
  void room2() {
    defaultRoom();
    spawnX = 370;
    spawnY = 90;
    walls.add(new Wall(x+0, y+0, 130, 130, #800080));
    //walls.add(new Wall(x, y+120, 130, 10, #800080));
    walls.add(new Wall(x+260, y+0, 390, 130, #800080));
    walls.add(new Wall(x+520, y+130, 10, 130, #800080));
    walls.add(new Wall(x+390, y+250, 130, 10, #800080));
    walls.add(new Wall(x+130, y+250, 130, 10, #800080));
    walls.add(new Wall(x+130, y+260, 10, 130, #800080));
    walls.add(new Wall(x+0, y+390, 260, 130, #800080));
    walls.add(new Wall(x+390, y+390, 260, 130, #800080));
    walls.add(new Door(x+260, y+520,130,10, "foward"));
    walls.add(new Door(x+130, y+0,130,10, "backward"));
  }
  
} 
