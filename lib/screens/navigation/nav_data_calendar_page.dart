
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotadate/ui/screens/date_profile_screen.dart';
import 'package:spotadate/utils/colors.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';

import '../home_page.dart';

class NavDataCalendarPage extends StatefulWidget {

  NavDataCalendarPage({this.homeScaffold});

  final GlobalKey<ScaffoldState> homeScaffold;

  @override
  _NavDataCalendarPageState createState() => _NavDataCalendarPageState(homeScaffold: homeScaffold);
}

class _NavDataCalendarPageState extends State<NavDataCalendarPage> {

  _NavDataCalendarPageState({this.homeScaffold});

  final GlobalKey<ScaffoldState> homeScaffold;
  CalendarController _controller;
  List<DateTime> selectedDates = List();

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),  //HomePage()
        ); // Action to perform on back pressed
        return false;
      },
      child: Scaffold(

        appBar:buildAppBar(),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildCalendar(),
              buildMybodyContent(),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildCalendar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(
          height: 10,
        ),
        SfDateRangePicker(
            initialSelectedDates: selectedDates,
            selectionMode: DateRangePickerSelectionMode.multiple,
            selectionColor: orangeColor,
            onSelectionChanged: (args) {}),
      ],
    );
  }

  Widget buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: buildNavMenuIcon(),

      title: Center(
        child: Text(
          "Date Calender",
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

  Widget buildMybodyContent() {
    return Container(
      padding: EdgeInsets.only(left: 12,right: 12),
      child: Column(
        children: [
          buildImageAndName(),
        ],
      ),
    );
  }

  Widget buildImageAndName(){
    return InkWell(
      onTap: ()
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DateProfileScreen()),
        );
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      // image: (notification != null && notification.from != null && notification.from.profile != null
                      //     && notification.from.profile.image != null)?
                      // NetworkImage(
                      //   notification.from.profile.image,
                      // ):
                      image: AssetImage('assets/ben.png'),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ben Parker',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    //SizedBox(height: 1,),
                   Row(
                     children: [
                       Icon(
                         Icons.local_drink,
                         color: orangeColor,
                         size: 16,
                       ),
                       //InkWell(child: Container(child: SvgPicture.asset('assets/images/female.svg', width: 16, height: 16, color: Colors.orange,))),
                       SizedBox(width: 7,),
                       Text("Drink",style: TextStyle(color: Colors.grey),)
                     ],
                   ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: orangeColor,
                          size: 16,
                        ),
                        //InkWell(child: Container(child: SvgPicture.asset('assets/images/female.svg', width: 16, height: 16, color: Colors.orange,))),
                        SizedBox(width: 7,),
                        Text("404 East Street",style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: orangeColor,
                          size: 16,
                        ),
                        //InkWell(child: Container(child: SvgPicture.asset('assets/images/female.svg', width: 16, height: 16, color: Colors.orange,))),
                        SizedBox(width: 7,),
                        Text("7:30pm",style: TextStyle(color: Colors.grey),)
                      ],
                    )
                  ],
                ),
              ],
            ),
            // InkWell(child: Container(child: SvgPicture.asset('assets/images/cross.svg', width: 25, height: 25, color: Colors.black,))),
            //
            // InkWell(
            //   child: Container(child: SvgPicture.asset('assets/images/check.svg', width: 25, height: 25, color: orangeColor,)),
            // )


          ],
        ),
      ),
    );
  }

}
