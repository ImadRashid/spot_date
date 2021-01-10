import 'package:flutter/material.dart';
import 'package:spotadate/core/models/chat_model.dart';
import 'package:spotadate/core/models/messages_model.dart';
import 'package:spotadate/ui/screens/date_profile_screen.dart';

import 'chat_screen.dart';
import 'confrim_date_screen.dart';

class DateProfileSendMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DateProfile(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:25.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/date_profile/drink.png'),
                      SizedBox(width: 10,),
                      Text('Drink',style: TextStyle(fontSize: 26),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on,color: Color(0xFFFF7525)),
                          SizedBox(width: 8,),
                          Text('BrewDog, 424 East Street, London',style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      Text('View in map',style: TextStyle(color: Color(0xFFFF7525),fontSize: 8),)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.access_time,color: Color(0xFFFF7525)),
                      SizedBox(width: 10,),
                      Text('7:30 pm',style: TextStyle(fontSize: 12),),
                    ],
                  ),
                  SizedBox(height: 30,),
                  ///
                  /// Direct message
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.lock_open,color: Color(0xFFFF7525)),
                          SizedBox(width: 10,),
                          Text('Direct message'),
                        ],
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>ConfirmDateScreen(
                            name: messagesList[2].name,
                            image: messagesList[4].image,

                          )));
                        },
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Send message',style: TextStyle(color: Color(0xFFFF7525)),),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFFF7525)),
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Icon(Icons.access_time,color: Color(0xFFFF7525)),
                      SizedBox(width: 10,),
                      Text('Time in date')
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      ///
                      /// Shows days
                      TimeInDate(integer: 3,string: 'Days',),
                      SizedBox(width: 10,),
                      ///
                      /// shows hours
                      TimeInDate(integer: 7,string: 'Hours',),
                      SizedBox(width: 10,),
                      ///
                      /// show Minutes
                      TimeInDate(integer: 45,string: 'Minutes',),
                      SizedBox(width: 10,),
                      ///
                      /// shows Seconds
                      TimeInDate(integer: 30,string: 'Seconds',secondIntegerColor: Color(0xFFFF7525)),
                      SizedBox(width: 10,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CircleAvatar(radius: 25,),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Spot Verification'),
                          SizedBox(height: 5,),
                          Text('view full selfie'),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
