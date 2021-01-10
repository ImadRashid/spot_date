import 'package:flutter/material.dart';
import 'package:spotadate/core/constants/colors.dart';
import 'package:spotadate/core/constants/text_styles.dart';
import 'package:spotadate/core/models/messages_model.dart';
import 'package:spotadate/ui/custom_widgets/messages_screens_app_bar.dart';
import 'package:spotadate/ui/screens/confrim_date_screen.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: messagesScreenAppBar(
        title: 'Messages',
        color: appBarGreyColor,
        leading: Icons.drag_handle,
        trailing: Container()
      ),
      body: ListView.builder(
        itemCount: messagesList.length,
          itemBuilder: (context, index){
            return messagesList[index].haveLock == true ?
              messagesList[index].isLocked == true ?
              /// Locked contacts .... where direct messages are forbidden
              ///
             lockedMessages(messagesList, index):
              /// Unlock messages ... can send direct messages
              ///
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ConfirmDateScreen(
                    name: messagesList[index].name,
                  )));
                },
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.asset(messagesList[index].image),
                      title: Text(messagesList[index].name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      subtitle: Row(
                        children: [
                          Image.asset('assets/images/messages_screen/open_lock.png'),
                          Text('\t${messagesList[index].message}',style: TextStyle(fontSize: 10),),
                        ],
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ) :
            /// Already started messages
            ///
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => ConfirmDateScreen(
                  name: messagesList[index].name,
                  image: messagesList[index].image,
                )));
              },
              child: ListTile(
                leading: Image.asset(messagesList[index].image),
                title: Text(messagesList[index].name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                subtitle: Text(messagesList[index].message,style: TextStyle(fontSize: 10),),
                trailing: Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Text(messagesList[index].lastSeen,style: TextStyle(fontSize: 8),),
                ),
              ),
            );
          }
      )
    );
  }
  /// Locked contacts .... where direct messages are forbidden
  ///
  Widget lockedMessages(List messagesList, int index){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => ConfirmDateScreen(
          name: messagesList[index].name,
          image: messagesList[index].image,
        )));
      },
      child: Column(
        children: [
          Divider(height: 0.0,),
          SizedBox(height: 10,),
          ListTile(
            leading: Image.asset(messagesList[index].image),
            title: Text(messagesList[index].name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.lock,color: orangeColor,size: 15,),
                    Text('Direct Message',style: TextStyle(fontSize: 10),),
                  ],
                ),
                RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: '8',
                              style: lockMessagesStyle
                          ),
                          TextSpan(
                              text: ' days',
                              style: TextStyle(fontSize: 10,color: Colors.black54)
                          ),
                          TextSpan(
                              text: '   7',
                              style: lockMessagesStyle
                          ),
                          TextSpan(
                              text: ' hrs',
                              style: TextStyle(fontSize: 10,color: Colors.black54)
                          ),
                          TextSpan(
                              text: '   45',
                              style: lockMessagesStyle
                          ),
                          TextSpan(
                              text: ' mins',
                              style: TextStyle(fontSize: 10,color: Colors.black54)
                          ),
                          TextSpan(
                              text: '   30',
                              style: lockMessagesStyle
                          ),
                          TextSpan(
                              text: ' secs',
                              style: TextStyle(fontSize: 10,color: Colors.black54)
                          ),
                        ]
                    )
                )
              ],
            ),
          ),
          SizedBox(height: 8,),
        ],
      ),
    );
  }
}
