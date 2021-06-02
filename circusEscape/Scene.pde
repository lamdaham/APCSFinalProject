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
  
  void changeRoom(){
    if(room.getMobCount()==0) {
      if (roomNum%2 == 0){
        buffScreen = true;
      }
      roomNum++;
      monsters = new ArrayList();
      createRoom(roomNum);   
    }
  }
  
  
} 
