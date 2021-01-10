import 'package:flutter/material.dart';
import 'package:spotadate/core/constants/colors.dart';
import 'package:spotadate/core/models/chat_model.dart';
import 'package:spotadate/ui/custom_widgets/messages_screens_app_bar.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String image;
  ChatScreen({this.name, this.image});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: messagesScreenAppBar(
          title: widget.name,
          color: Colors.black,
          leading: Icons.arrow_back,
          leadingOnpress: () => Navigator.pop(context),
          trailing: Stack(
            children: [
              IconButton(
                  icon: Icon(Icons.camera_alt,color: Colors.black,size: 30,),
                  onPressed: null
              ),
              Container(
                padding: EdgeInsets.only(left: 28,top: 10),
                alignment: Alignment.centerRight,
                  child: Image.asset('assets/images/chat_screen/check.png')),
            ],
          ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: chatList.length,
                itemBuilder: (context, index){
                  return chatList[index].isReceived ?
                  /// Received Messages
                  ///
                     receivedMessages(index: index)  :
                  /// Send Messages
                  ///
                      sendMessages(index);
                }),
          ),
          /// Text field at the bottom
          ///
          Container(
            height: 51,
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                hintText: '\t \tSay Something...',
                border: InputBorder.none,
                suffixIcon: IconButton(
                    icon: Icon(Icons.arrow_forward,color: orangeColor,size: 30,),
                    onPressed: () => Navigator.pushNamed(context, 'image_slider')
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget receivedMessages({int index}){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
      child: Row(
        children: [
          Image.asset('assets/images/chat_screen/image.png',height: 57,width: 57,),
          SizedBox(width: 6,),
          Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: orangeColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('${chatList[index].message}'),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 28),
                      alignment: Alignment.bottomLeft,
                      child: Image.asset('assets/images/chat_screen/down_arrow.png'))
                ],
              )
          )
        ],
      ),
    );
  }

  Widget sendMessages(index){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
      child: Row(
        children: [
          Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFE9E9E9),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('${chatList[index].message}'),
                    ),
                  ),
                  Positioned(
                      left: 265,
                      bottom: 60,
                      child: Image.asset('assets/images/chat_screen/arrow_up.png'))
                ],
              )
          ),
          Container(width: 6,color: Colors.transparent,),
          Image.asset(widget.image,height: 57,width: 57,),
        ],
      ),
    );
  }
}
