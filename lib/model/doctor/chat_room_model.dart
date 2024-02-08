class ChatRoomModel {
  String? chatroomId;
  List<String>? partipicesents;

  ChatRoomModel({
    this.chatroomId,
    this.partipicesents,
  });
  ChatRoomModel.fromMap(Map<String, dynamic> map) {
    chatroomId = map['chatroomId'];
    partipicesents = ['partipicesents'];
  }
  Map<String, dynamic> toList() {
    return {'chatroomId': chatroomId, 'partipicesents': partipicesents};
  }
}
