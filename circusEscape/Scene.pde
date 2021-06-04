public class Scene {

  Room room;
  int roomNum;

  Scene() {
    roomNum = 0;
  }

  void clearBoard() {
    clear();
  }

  void createRoom(int num) {
    room = new Room(num);
  }

  void changeRoom() {
    if (room.getMobCount()==0) {
      clearBoard();
      roomNum++;
      if (roomNum%2 == 0) {
        buffScreen = true;
      }
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
        room.room1();
        room.spawnMobs();
      }
    }
  }
} 
