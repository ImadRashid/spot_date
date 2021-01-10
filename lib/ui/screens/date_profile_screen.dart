import 'package:flutter/material.dart';
import 'package:spotadate/components/cacle_date.dart';
import 'package:spotadate/screens/edit_profile_page.dart';
import 'package:spotadate/ui/screens/confrim_date_screen.dart';
import 'package:spotadate/ui/screens/date_profile_send_message_screen.dart';
import 'package:spotadate/ui/screens/re_schadule_screen.dart';

class DateProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ///
            /// Date profile
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DateProfileSendMessage()),
                  );
                },
                child: DateProfile()),

            ///
            ///
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/date_profile/drink.png'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Drink',
                          style: TextStyle(fontSize: 26),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Color(0xFFFF7525)),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'BrewDog, 424 East Street, London',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Text(
                          'View in map',
                          style:
                              TextStyle(color: Color(0xFFFF7525), fontSize: 8),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Color(0xFFFF7525)),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '7:30 pm',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    ///
                    /// Direct message
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DateProfileSendMessage()),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.lock, color: Color(0xFFFF7525)),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Direct message',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    ///
                    /// Time area
                    Row(
                      children: [
                        ///
                        /// Shows days
                        TimeInDate(
                          integer: 0,
                          string: 'Days',
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        ///
                        /// shows hours
                        TimeInDate(
                          integer: 0,
                          string: 'Hours',
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        ///
                        /// show Minutes
                        TimeInDate(
                          integer: 0,
                          string: 'Minutes',
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        ///
                        /// shows Seconds
                        TimeInDate(
                          integer: 4,
                          string: 'Seconds',
                          secondIntegerColor: Color(0xFFFF7525),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    ///
                    /// time in date
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReScheduleScreen())),
                      child: Row(
                        children: [
                          Icon(Icons.access_time, color: Color(0xFFFF7525)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Time in date')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),

                    ///
                    /// Time area
                    Row(
                      children: [
                        ///
                        /// Shows days
                        TimeInDate(
                          integer: 3,
                          string: 'Days',
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        ///
                        /// shows hours
                        TimeInDate(
                          integer: 7,
                          string: 'Hours',
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        ///
                        /// show Minutes
                        TimeInDate(
                          integer: 45,
                          string: 'Minutes',
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        ///
                        /// shows Seconds
                        TimeInDate(
                            integer: 30,
                            string: 'Seconds',
                            secondIntegerColor: Color(0xFFFF7525)),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    ///
                    /// Spot Verification
                    SpotVerification(),
                    SizedBox(
                      height: 26,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

///
/// date user profile
class DateProfile extends StatelessWidget {
  List<String> values = [
    'View Profile',
    'Message',
    'Re-arrange date',
    'Cancel date'
  ];
  String value = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(
        children: [
          ///
          /// User image
          Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/date_profile/user.jpg',
                  fit: BoxFit.fitWidth,
                )),
          ),

          ///
          /// back button and more button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xFFFF7525),
                      size: 30,
                    )),
                DropdownButton<String>(
                  icon: Icon(
                    Icons.more_vert,
                    color: Color(0xFFFF7525),
                    size: 30,
                  ),
                  underline: SizedBox(),
                  items: values.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {

                    switch(value)
                    {
                      case "View Profile":
                        {
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>EditProfile( )));
                        }
                        break;
                      case "Message":
                        {

                        }
                        break;
                      case "Re-arrange date":
                        {
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>ReScheduleScreen( )));
                        }
                        break;
                      case "Cancel date":
                        {
                          CancleDateDialog(
                              context: context,
                              onDismiss: () {
                                //navigateToHomePage();
                              }
                          ).show();
                        }
                        break;
                    }
                  },
                ),
              ],
            ),
          ),

          ///
          /// User Name plus year and distance details
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ben Parkar',
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/image_slider/age.png'),
                      Text(
                        '22 year',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset('assets/images/image_slider/distance.png'),
                      Text(
                        '2 km',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          ///
          /// Heart icon
          Container(
              padding: EdgeInsets.only(bottom: 5, right: 25),
              alignment: Alignment.bottomRight,
              child: Stack(
                children: [
                  Image.asset('assets/images/date_profile/heart.png'),
                ],
              )),
        ],
      ),
    );
  }
}

///
/// Days, hours, minutes and second code
class TimeInDate extends StatelessWidget {
  String string;
  int integer;
  Color secondIntegerColor;

  TimeInDate(
      {@required this.integer, @required this.string, this.secondIntegerColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          width: 50,
          child: Center(
            child: Text(
              '$integer',
              style: TextStyle(fontSize: 30, color: secondIntegerColor),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(2, 2))]),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '$string',
          style: TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

///
/// Spot verification
class SpotVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.camera_alt,
          color: Color(0xFFFF7525),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Spot Verification',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
