import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:spotadate/utils/colors.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';

class ReScheduleScreen extends StatefulWidget {
  @override
  _ReScheduleScreenState createState() => _ReScheduleScreenState();
}

class _ReScheduleScreenState extends State<ReScheduleScreen> {
  ///
  /// two bool veriables
  bool addTime = false, dateReschedule = false;
  CalendarController _calendarController;
  List<DateTime> selectedDates = List();
  String selectedTime = "Slect time";

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select 3 days available',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),

            ///
            /// Calender
            buildCalendar(),
            buildSelectTime(),

            ///
            /// Select time
            Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'Select time',
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     setState(() {
                  //       addTime = true;
                  //     });
                  //   },
                  //   child: Container(
                  //     width: 150,
                  //     height: 50,
                  //     decoration: BoxDecoration(border: Border.all()),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),

                  ///
                  /// Add time button
                  Center(
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color:
                              addTime ? Color(0xFFFF7525) : Color(0xFFFFD4BC),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'Add',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  dateReschedule?
                  Text('Date Selected'):Text("No date added"),

                  ///
                  /// Re Schedule date button
                  Center(
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: dateReschedule
                              ? Color(0xFFFF7525)
                              : Color(0xFFFFD4BC),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'Re-Schedule',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // show timer picker dialog
  Future<Null> showTimePickerDialog() async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      print(picked.toString());
      setState(() {
        selectedTime = "${picked.hour}:${picked.minute}";
        addTime=true;
        dateReschedule=true;
      });
    }
  }

  // build select time
  Widget buildSelectTime() {
    return InkWell(
      onTap: () {
        print("time picker selected");
        // show timer picker dialog
        showTimePickerDialog();
      },
      child: Padding(
        padding: EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Time",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 10,),
            Container(
              width: 150,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Colors.grey),
                  bottom: BorderSide(width: 1, color: Colors.grey),
                  left: BorderSide(width: 1, color: Colors.grey),
                  right: BorderSide(width: 1, color: Colors.grey),
                ),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedTime,
                    style: TextStyle(color: greyTextColor),
                  ),
                  SvgPicture.asset(
                    'assets/images/double_arrow.svg',
                    color: greyTextColor,
                    width: 12,
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCalendar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   "Select days available",
        //   style: TextStyle(fontWeight: FontWeight.bold, color: greyTextColor),
        // ),
        // SizedBox(
        //   height: 10,
        // ),
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
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: orangeColor,
          size: 24,
        ),
      ),
      title: Center(
        child: Text(
          "Re-Schedule Date",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: greyTextColor),
        ),
      ),
    );
  }
}
