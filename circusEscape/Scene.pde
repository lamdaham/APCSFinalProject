public class Scene {

  Room room;
  int roomNum;
  boolean onDoor, backDoor;

  Scene() {
    roomNum = 0;
    onDoor = true;
    
  }

  void clearBoard() {
    clear();
  }

  void createRoom(int num) {
    room = new Room(num);
  }

  void changeRoom() {
    if (onDoor) {
      //if (roomNum % 2 == 1) {
      //  int r = (int) random(0, 3);
      //  for (int i = 0; i < r; i++) {
      //    potions.get(scene.roomNum).add(new Potions());
      //  }
      //}
      //if (roomNum%2 == 0) {
      //  buffScreen = true;
      //}

      if (roomNum == 11) {
        end = true;
      }
      if (roomNum==10) {
        walls.clear();
        room.bossRoom();
      } else {
        walls.clear();
        monsters = new ArrayList();
        createRoom(roomNum);
        room.createRoom();
        if (backDoor) {
          p1.x = room.endX;
          p1.y = room.endY;
          onDoor = false;
          backDoor = false;
        } else {
          p1.x = room.spawnX;
          p1.y = room.spawnY;
          //print(roomNum);
          if(!cleared[roomNum]){
            room.spawnMobs();
            //print(cleared[roomNum]);
          }
          onDoor = false;
        }
      }
    }
  }
} 
