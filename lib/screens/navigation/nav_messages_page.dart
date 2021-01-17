


import 'package:flutter/material.dart';
import 'package:spotadate/ui/screens/confrim_date_screen.dart';
import 'package:spotadate/utils/colors.dart';
import 'package:spotadate/models/messages_model.dart';

import '../home_page.dart';

class MessagesScreen extends StatefulWidget {
  MessagesScreen({@required this.homeScaffold});

  final GlobalKey<ScaffoldState> homeScaffold;
  @override
  _MessagesScreenState createState() => _MessagesScreenState(homeScaffold: homeScaffold);
}

class _MessagesScreenState extends State<MessagesScreen> {
  _MessagesScreenState({@required this.homeScaffold});

  final GlobalKey<ScaffoldState> homeScaffold;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),  //HomePage()
        ); // Action to perform on back pressed
        return false;
      },
      child: Scaffold(
          backgroundColor: Color(0xFFF9F9F9),
          appBar: buildAppBar(),
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
                    // Navigator.push(context, MaterialPageRoute(builder: (_) => ConfirmDateScreen(
                    //   name: messagesList[index].name,
                    // )));
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ConfirmDateScreen(
                      name: messagesList[index].name,
                      image: messagesList[index].image,
                    )));
                  },
                  child: Column(
                    children: [
                      ListTile(
                        leading: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              // image: (notification != null && notification.from != null && notification.from.profile != null
                              //     && notification.from.profile.image != null)?
                              // NetworkImage(
                              //   notification.from.profile.image,
                              // ):
                              image: AssetImage(messagesList[index].image),
                            ),
                          ),
                        ),

                        //Image.asset(messagesList[index].image),
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
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          // image: (notification != null && notification.from != null && notification.from.profile != null
                          //     && notification.from.profile.image != null)?
                          // NetworkImage(
                          //   notification.from.profile.image,
                          // ):
                          image: AssetImage(messagesList[index].image),
                        ),
                      ),
                    ),
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
      ),
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
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  // image: (notification != null && notification.from != null && notification.from.profile != null
                  //     && notification.from.profile.image != null)?
                  // NetworkImage(
                  //   notification.from.profile.image,
                  // ):
                  image: AssetImage(messagesList[index].image),
                ),
              ),
            ),
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
                              style: TextStyle(color: orangeColor),
                          ),
                          TextSpan(
                              text: ' days',
                              style: TextStyle(fontSize: 10,color: Colors.black54)
                          ),
                          TextSpan(
                              text: '   7',
                            style: TextStyle(color: orangeColor),
                              //style: lockMessagesStyle
                          ),
                          TextSpan(
                              text: ' hrs',
                              style: TextStyle(fontSize: 10,color: Colors.black54)
                          ),
                          TextSpan(
                              text: '   45',
                            style: TextStyle(color: orangeColor),
                              //style: lockMessagesStyle
                          ),
                          TextSpan(
                              text: ' mins',
                              style: TextStyle(fontSize: 10,color: Colors.black54)
                          ),
                          TextSpan(
                              text: '   30',
                              //style: lockMessagesStyle
                            style: TextStyle(color: orangeColor),
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
  Widget buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: buildNavMenuIcon(),
      title: Center(
        child: Text(
          "Notifications",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: greyTextColor),
        ),
      ),
    );
  }
  Widget buildNavMenuIcon() {
    return InkWell(
      onTap: () {
        homeScaffold.currentState.openDrawer();
      },
      child: Icon(
        Icons.menu,
        color: orangeColor,
        size: 24,
      ),
    );
  }
}
