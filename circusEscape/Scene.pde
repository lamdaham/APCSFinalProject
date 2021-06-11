public class Scene {

  Room room;
  int roomNum;
  boolean onDoor, backDoor;

  Scene() {
    roomNum = 0;
    onDoor = true;
  }


//creates a new room with the room number
  void createRoom(int num) {
    room = new Room(num);
  }

//change rooms if player goes through a door
  void changeRoom() {
    if (onDoor) {
      if (roomNum%2 == 0 && roomNum != 0) {
        buffScreen = true;
      }

      if (roomNum == 11) {
        end = true;
      }

      walls.clear();
      monsters.clear();
      createRoom(roomNum);
      room.createRoom();
      if (roomNum>cleared) {
        room.spawnMobs();
      }
      if (backDoor) {
        p1.setX(room.endX);
        p1.setY(room.endY);
        monsters.clear();
        onDoor = false;
        backDoor = false;
      } else {
        p1.setX(room.spawnX);
        p1.setY(room.spawnY);
        onDoor = false;
      }
      room.spawnedMobs = true;
    }
  }
}
 
