class ChatModel{
  String message;
  bool isSent;
  bool isReceived;

  ChatModel({this.message,this.isSent = false, this.isReceived = false});
}

List<ChatModel> chatList = [
  ChatModel(
    message: 'Sed ut perspiciatis omnis  culpa.',
    isReceived: true,
  ),
  ChatModel(
    message: 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.',
    isSent: true
  )
];