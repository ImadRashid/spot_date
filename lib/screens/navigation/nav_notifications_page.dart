
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spotadate/models/notification.dart' as MyNotification;
//import 'package:spot/network/api/spot_apis.dart';
import 'package:spotadate/screens/create_spot_date_detail_request_page.dart';
import 'package:spotadate/screens/fill_date_details.dart';
import 'package:spotadate/screens/spot_verification_request_page.dart';
import 'package:spotadate/utils/colors.dart';
import 'package:spotadate/utils/date_utils.dart';
import 'package:spotadate/utils/notification_type.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

class NavNotificationsPage extends StatefulWidget {

  NavNotificationsPage({@required this.homeScaffold});

  final GlobalKey<ScaffoldState> homeScaffold;

  @override
  _NavNotificationsPageState createState() => _NavNotificationsPageState(homeScaffold: homeScaffold);
}

class _NavNotificationsPageState extends State<NavNotificationsPage> {

  _NavNotificationsPageState({@required this.homeScaffold});

  final GlobalKey<ScaffoldState> homeScaffold;

  List<MyNotification.Notification> notifications = List();

  //SpotApis api = SpotApis();

  @override
  void initState() {
    super.initState();
    //getNotifications();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  // build appbar
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


  // nav menu icon
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

  // build body
  Widget buildBody() {
    return buildBodyContents();
  }

  // build body contents
  Widget buildBodyContents() {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text(
            "Today",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>SpotVerificationRequestPage(


                )));
              },
              child: buildUserImage('assets/ben.png','Ben parker accepted your spot zone\n request. Spot verification nadeed.')),
          SizedBox(height: 10,),
          InkWell(
            onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>FillDateDetails( )));
              },

              child: buildUserImage('assets/images/messages_screen/robert.png','Tim accepted your spot\nrequest send the date detail.')),
          SizedBox(height: 10,),
          buildUserImage('assets/images/messages_screen/chad.png','Emily clarke send you a spot request.'),
          SizedBox(height: 10,),
          buildUserImage('assets/images/messages_screen/chris.png','Ben parker accepted your spot zone\n request. Spot verification nadeed.'),


        ],
      ),
    );

  }
  Widget buildUserImage(String imagePath,String imageText) {
    return Container(
      child: Row(
        children: [
        Container(
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
            image:
            AssetImage(imagePath),
          ),
        ),
      ),
          Column(
            children: [
              Text(
                '$imageText',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }


  // build empty body messages
  Widget buildEmptyBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No requests found",
          ),
          // margin
          SizedBox(height: 8,),
          FlatButton(
            onPressed: () {

            },
            child: Text(
              "REFRESH",
              style: TextStyle(color: orangeColor),
            ),
          ),
        ],
      ),
    );
  }



  // show toast
  // void showToast(String msg) {
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.black,
  //       textColor: Colors.white,
  //       fontSize: 16.0
  //   );
  // }
}

