public class Room {
  int mobCount;
  int roomNum;
  int x, y, w, h;
  int spawnX, spawnY;
  int endX, endY;
  boolean spawnedMobs;
  boolean open;

  Room(int num) {
    roomNum = num;
    x=175;
    y=25;
    w=650;
    h=520;
    spawnedMobs = false;
    open = false;
  }


//returns mob count
  int getMobCount() {
    return monsters.size();
  }


//default room with walls in all four sides
  void defaultRoom() {
    walls.add(new Wall(825, 0, 175, 1000, #f7d68f));
    walls.add(new Wall(0, 0, 175, 1000, #f7d68f));
    walls.add(new Wall(0, 545, 1600, 155, #f7d68f));
    walls.add(new Wall(0, 0, 1600, 25, #f7d68f));
  }


// Spawns monsters in each room; it spwans two times the room number in the room  
  void spawnMobs() {
    for (int i = 0; i < 2*roomNum; i++) {
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

//creates a room based on the roomNum
  void createRoom() {
    if (roomNum == 0) {
      room0();
    } else if (roomNum==1) {
      room1();
    } else if (roomNum==2){
      room2();
    } else if (roomNum==3){
      room3();
    } else if (roomNum==4){
      room4();
    } else if (roomNum==5){
      room5();
    }
    else if (roomNum == 6) {
      room6();
    }
    else if (roomNum == 7) {
      room7();
    }
    else if (roomNum == 8) {
      room8();
    }
    else if (roomNum == 9) {
      room9();
    } 
    else if (roomNum == 10) {
      bossRoom();
    } 
  }
  
  
// creates the boss room at level 10
  void bossRoom() {
    spawnX = 300;
    spawnY = 200;
    defaultRoom();
    Boss boss = new Boss();
    monsters.add(boss);
    walls.add(new Door(x + 650, y + 390, 10, 130, "forward"));
  }

//updates mobcount
  void updateCount() {
    mobCount=monsters.size();
  }
  
  void room0() {
    defaultRoom();
    spawnX = 500;
    spawnY = 350;
    walls.add(new Door(x, y+520,130,10, "forward"));
  }
  
  
  
    
    
  void room1() {
    defaultRoom();
    spawnX = 240;
    spawnY = 90;
    endX = 195+x;
    endY = y+h-65;
    walls.add(new Wall(x+130, y+0, 10, 130, #c595cf));
    walls.add(new Wall(x+130, y+130, 130, 10, #c595cf));
    walls.add(new Wall(x+260, y+130, 10, 130, #c595cf));
    walls.add(new Wall(x, y+260, 130, 260, #c595cf));

    walls.add(new Wall(x+520, y+0, 130, 130, #c595cf));
    walls.add(new Wall(x+400, y+130, 130, 10, #c595cf));
    walls.add(new Wall(x+400, y+130, 250, 130, #c595cf));


    walls.add(new Wall(x+w-130, y+h-130, 130, 130, #c595cf));
    walls.add(new Door(x+130, y+520,130,10, "forward"));
  }
  
  void room2() {
    defaultRoom();
    spawnX = 370;
    spawnY = 90;
    endX = 325+x;
    endY = y+h-65;
    walls.add(new Wall(x+0, y+0, 130, 130, #c595cf));
    //walls.add(new Wall(x, y+120, 130, 10, #c595cf));
    walls.add(new Wall(x+260, y+0, 390, 130, #c595cf));
    walls.add(new Wall(x+520, y+130, 10, 130, #c595cf));
    walls.add(new Wall(x+390, y+250, 130, 10, #c595cf));
    walls.add(new Wall(x+130, y+250, 130, 10, #c595cf));
    walls.add(new Wall(x+130, y+260, 10, 130, #c595cf));
    walls.add(new Wall(x+0, y+390, 260, 130, #c595cf));
    walls.add(new Wall(x+390, y+390, 260, 130, #c595cf));
    walls.add(new Door(x+260, y+520, 130, 10, "forward"));
    walls.add(new Door(x+130, y+0,130,10, "backward"));
  }
  
  void room3(){
    defaultRoom();
    spawnX = 500;
    spawnY= 90;
    endX = x+w-65;
    endY = y+h-65;
    walls.add(new Wall(x+0, y+0, 260, 130, #c595cf));
    walls.add(new Wall(x+0, y+130, 130, 130, #c595cf));
    
    walls.add(new Wall(x+390, y+0, 260, 130, #c595cf));
    walls.add(new Wall(x+520, y+130, 130, 260, #c595cf));
    walls.add(new Wall(x+390, y+260, 130, 10, #c595cf));
    
    walls.add(new Wall(x+130, y+390, 10, 130, #c595cf));
    walls.add(new Wall(x+130, y+390, 130, 10, #c595cf));
    walls.add(new Wall(x+260, y+270, 10, 130, #c595cf));
    walls.add(new Wall(x+390, y+390, 10, 130, #c595cf));
    walls.add(new Door(x+650, y+390,10,130, "forward"));
    walls.add(new Door(x+260, y+0,130,10, "backward"));
    
    gun.get(scene.roomNum).add(new Gun("shotgun", 400, 500, 15));
  }
  
  void room4() {
    defaultRoom();
    spawnX = x+65;
    spawnY = y+3*130+65;
    endX = x+390+65;
    endY = y+65;
    walls.add(new Wall(x,y, 130, 390, #c595cf));
    walls.add(new Wall(x+130,y, 130, 260, #c595cf));
    walls.add(new Wall(x+260,y, 130, 130, #c595cf));
    walls.add(new Wall(x+520,y, 130, 130, #c595cf));
    
    walls.add(new Wall(x+260,y+390, 10, 130, #c595cf));
    walls.add(new Wall(x+390,y+260, 10, 260, #c595cf));
    walls.add(new Wall(x+520,y+260, 130, 260, #c595cf));
    
    
    walls.add(new Door(x+390, y-10,130,10, "forward"));
    walls.add(new Door(x, y+390,10,130, "backward"));
  }
  
  void room5() {
    defaultRoom();
    spawnX = x+390+65;
    spawnY = y+390+65;
    endX = x + 400 - 130 - 65;
    endY = y + 65;
    
    walls.add(new Wall(x,y, 130, 130, #c595cf));
    walls.add(new Wall(x,y+260, 130, 260, #c595cf));
    
    walls.add(new Wall(x+390,y+390, 10, 130, #c595cf));
    walls.add(new Wall(x+260,y+390, 130, 10, #c595cf));
    walls.add(new Wall(x+260,y+260, 10, 130, #c595cf));
    walls.add(new Wall(x+260,y+260, 130, 10, #c595cf));
    walls.add(new Wall(x+390,y+130, 10, 140, #c595cf));
    walls.add(new Wall(x+260,y+130, 130, 10, #c595cf));
    
    walls.add(new Wall(x+520,y+390, 130, 130, #c595cf));
    
    walls.add(new Wall(x+520,y+260, 130, 10, #c595cf));
    walls.add(new Wall(x+520,y+130, 10, 140, #c595cf));
    
    walls.add(new Door(x+130, y-10,130,10, "forward"));
    walls.add(new Door(x+400, y+510,120,10, "backward"));
    
  }
  
  void room6() {
    defaultRoom();
    spawnX = x + 390 - 250 + 65;
    spawnY = y + h - 65;
    endX = x + 650 - 65;
    endY = x + h - 390 + 45;
    
    walls.add(new Wall(x, y, 130, 260, #c595cf));
    walls.add(new Wall(x, y + 390, 130, 130, #c595cf));
    
    walls.add(new Wall(x + 130, y + 130, 130, 10, #c595cf));
    walls.add(new Wall(x + 260, y + 130, 10, 130, #c595cf));
    walls.add(new Wall(x + 260, y + 390, 10, 130, #c595cf));
    walls.add(new Wall(x + 520, y + 390, 10, 130, #c595cf));
    walls.add(new Wall(x + 520, y, 10, 130, #c595cf));
    walls.add(new Wall(x + 390, y + 130, 10, 260, #c595cf));
    walls.add(new Wall(x + 390, y + 130, 140, 10, #c595cf));
    walls.add(new Wall(x + 390, y + 260, 130, 10, #c595cf));
    
    walls.add(new Door(x + 650, y + 260, 10, 130, "forward"));
    walls.add(new Door(x + 130, y + h - 10, 130, 10,"backward"));
    gun.get(scene.roomNum).add(new Gun("sniper", 500, 500, 75));
  }
  
  void room7() {
    defaultRoom();
    spawnX = x + 65;
    spawnY = y + 260 + 65;
    endX = x + 520 + 65;
    endY = y + 390 + 65;
    
    walls.add(new Wall(x + 130, y + 130, 10, 130, #c595cf));
    walls.add(new Wall(x, y + 260, 140, 10, #c595cf));
    walls.add(new Wall(x + 130, y + 390, 10, 130, #c595cf));
    walls.add(new Wall(x + 130, y + 390, 140, 10, #c595cf));
    walls.add(new Wall(x + 260, y + 260, 10, 130, #c595cf));
    walls.add(new Wall(x + 260, y, 10, 130, #c595cf));
    walls.add(new Wall(x + 390, y, 10, 130, #c595cf));
    walls.add(new Wall(x + 390, y + 130, 130, 10, #c595cf));
    walls.add(new Wall(x + 520, y + 130, 10, 130, #c595cf));
    walls.add(new Wall(x + 390, y + 260, 10, 130, #c595cf));
    walls.add(new Wall(x + 390, y + 390, 130, 10, #c595cf));
    walls.add(new Wall(x + 520, y + 390, 10, 130, #c595cf));
    
    walls.add(new Door(x + 520, y + h, 130, 10, "forward"));
    walls.add(new Door(x, y + h - 260, 10, 130, "backward"));
  }
  
  void room8() {
    defaultRoom();
    spawnX = x + 520 + 65;
    spawnY = 65;
    endX = x + 160 + 50;
    endY = y + 390 + 65;
    
    walls.add(new Wall(x + 130, y, 10, 130, #c595cf));
    walls.add(new Wall(x + 130, y + 260, 10, 130, #c595cf));
    walls.add(new Wall(x, y + 390, 140, 10, #c595cf));
    walls.add(new Wall(x + 520, y, 10, 130, #c595cf));
    walls.add(new Wall(x + 260, y + 130, 270, 10, #c595cf));
    walls.add(new Wall(x + 260, y + 130, 10, 130, #c595cf));
    walls.add(new Wall(x + 390, y + 260, 10, 130, #c595cf));
    walls.add(new Wall(x + 390, y + 260, 130, 10, #c595cf));
    walls.add(new Wall(x + 520, y + 260, 10, 130, #c595cf));
    walls.add(new Wall(x + 520, y + 390, 130, 10, #c595cf));
    walls.add(new Wall(x + 260, y + 390, 10, 130, #c595cf));
    
    walls.add(new Door(x + 130, y + 520, 130, 10, "forward"));
    walls.add(new Door(x + 520, y, 130, 10, "backward"));
  }
   
  void room9() {
    defaultRoom();
    spawnX = x + 160 + 50;
    spawnY = 65;
    
    walls.add(new Wall(x + 130, y, 10, 130, #c595cf));
    walls.add(new Wall(x + 260, y, 10, 130, #c595cf));
    walls.add(new Wall(x + 260, y + 130, 130, 10, #c595cf));
    walls.add(new Wall(x + 520, y + 130, 130, 10, #c595cf));
    walls.add(new Wall(x + 520, y + 130, 10, 130, #c595cf));
    walls.add(new Wall(x + 260, y + 260, 270, 10, #c595cf));
    walls.add(new Wall(x, y + 260, 130, 10, #c595cf));
    walls.add(new Wall(x + 130, y + 260, 10, 130, #c595cf));
    walls.add(new Wall(x + 130, y, 10, 130, #c595cf));
    walls.add(new Wall(x + 260, y + 390, 10, 130, #c595cf));
    walls.add(new Wall(x + 260, y + 390, 10, 130, #c595cf));
    walls.add(new Wall(x + 390, y + 390, 10, 130, #c595cf));
    walls.add(new Wall(x + 520, y + 390, 10, 130, #c595cf));
    
    walls.add(new Door(x + 650, y + 390, 10, 130, "forward"));
    walls.add(new Door(x + 130, y, 130, 10, "backward"));
    gun.get(scene.roomNum).add(new Gun("minigun", 500, 500, 2));
  }
} 
