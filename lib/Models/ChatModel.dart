// ignore_for_file: file_names

class ChatModel {
  String? name;
  String? icon;
  bool? isGroup;
  String? time;
  String? currentMessage;
  String? status;
  bool selected;
  ChatModel(
      {this.name,
      this.icon,
      this.isGroup,
      this.time,
      this.currentMessage,
      this.status,
      this.selected = false});
}
