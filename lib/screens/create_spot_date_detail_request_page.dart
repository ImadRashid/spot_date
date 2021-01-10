
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spotadate/components/date_type.dart';
import 'package:spotadate/models/resturant.dart';
import 'package:spotadate/models/spot_date.dart';
//import 'package:spot/network/api/spot_apis.dart';
import 'package:spotadate/screens/select_resturant_page.dart';
import 'package:spotadate/utils/colors.dart';
import 'package:spotadate/utils/date_types.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateSpotDateDetailRequestPage extends StatefulWidget {

  CreateSpotDateDetailRequestPage({this.spotDate, this.toId});
  SpotDate spotDate;
  int toId;

  @override
  _CreateSpotDateDetailRequestPageState createState() => _CreateSpotDateDetailRequestPageState(spotDate: spotDate, toId: toId);
}

class _CreateSpotDateDetailRequestPageState extends State<CreateSpotDateDetailRequestPage> {

  _CreateSpotDateDetailRequestPageState({this.spotDate, this.toId});
  SpotDate spotDate;
  int toId;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();
  final _descriptionEditController = TextEditingController();

  List<String> selectedDateTypes = List();
  List<String> dateTypes = DateTypes.getDateTypes();

  String selectedLocationText = "Where would you like to go?";
  String selectedTime = "Slect time";

  List<DateTime> selectedDates = List();

  Resturant selectedResturant;

  //SpotApis api = SpotApis();

  bool isCreateBtnEnabled = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  // build appbar
  Widget buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Center(
        child: Text(
          "Fill date details",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: greyTextColor),
        ),
      ),
    );
  }

  Widget buildBody() {
    return buildBodyContents();
  }

  Widget buildBodyContents() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDescription(),
              buildDateTypes(),
              buildLocation(),
              buildDateCalendar(),
              buildSelectTime(),
              buildCreateBtn(),
            ],
          ),
        ),
      ),
    );
  }

  // build description text form field
  Widget buildDescription() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: _descriptionEditController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty) {
                return "Description cannot cannot be empty";
              }else {
                return null;
              }
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: orangeColor, width: 2.0),
                  borderRadius: BorderRadius.circular(4),
                ),
                hintText: "Enter date description",
                hintStyle: TextStyle(color: greyTextColor,),

            ),
            maxLength: 100,
            buildCounter: (context, {currentLength, isFocused, maxLength}) {
              return Text("$currentLength/$maxLength");
            },
            maxLines: 4,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  // build date types
  Widget buildDateTypes() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Date Types",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              DateType(
                onSelected: (value) {
                  if (selectedDateTypes.contains(value)) {
                    setState(() {
                      selectedDateTypes.remove(value);
                    });
                  }else {
                    setState(() {
                      selectedDateTypes.add(value);
                    });
                  }
                  print(selectedDateTypes.length.toString());
                },
                title: dateTypes[0],
                icon: getDateTypeIcon(0),
                isSelected: selectedDateTypes.contains(dateTypes[0]),
              ),
              DateType(
                onSelected: (value) {
                  if (selectedDateTypes.contains(value)) {
                    setState(() {
                      selectedDateTypes.remove(value);
                    });
                  }else {
                    setState(() {
                      selectedDateTypes.add(value);
                    });
                  }
                },
                title: dateTypes[1],
                icon: getDateTypeIcon(1),
                isSelected: selectedDateTypes.contains(dateTypes[1]),
              ),
              DateType(
                onSelected: (value) {
                  if (selectedDateTypes.contains(value)) {
                    setState(() {
                      selectedDateTypes.remove(value);
                    });
                  }else {
                    setState(() {
                      selectedDateTypes.add(value);
                    });
                  }
                },
                title: dateTypes[2],
                icon: getDateTypeIcon(2),
                isSelected: selectedDateTypes.contains(dateTypes[2]),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              DateType(
                onSelected: (value) {
                  if (selectedDateTypes.contains(value)) {
                    setState(() {
                      selectedDateTypes.remove(value);
                    });
                  }else {
                    setState(() {
                      selectedDateTypes.add(value);
                    });
                  }
                },
                title: dateTypes[3],
                icon: getDateTypeIcon(3),
                isSelected: selectedDateTypes.contains(dateTypes[3]),
              ),
              DateType(
                onSelected: (value) {
                  if (selectedDateTypes.contains(value)) {
                    setState(() {
                      selectedDateTypes.remove(value);
                    });
                  }else {
                    setState(() {
                      selectedDateTypes.add(value);
                    });
                  }
                },
                title: dateTypes[4],
                icon: getDateTypeIcon(4),
                isSelected: selectedDateTypes.contains(dateTypes[4]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // get icon according to date type
  IconData getDateTypeIcon(int index) {
    switch (index) {
      case 0:
        return Icons.local_movies;
        break;
      case 1:
        return Icons.local_drink;
        break;
      case 2:
        return Icons.fastfood; //emoji_food_beverage
        break;
      case 3:
        return Icons.restaurant_menu;
        break;
      case 4:
        return Icons.local_activity;
        break;
    }
  }

  // build location to choose location from map
  Widget buildLocation() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey),
                bottom: BorderSide(width: 1, color: Colors.grey),
                left: BorderSide(width: 1, color: Colors.grey),
                right: BorderSide(width: 1, color: Colors.grey),
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              selectedLocationText,
              style: TextStyle(color: greyTextColor),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: InkWell(
              onTap: () {
                // navigate to select resturant page
                navigateToSelectResturantPage();
              },
              child: Text(
                "Choose from map",
                style: TextStyle(fontWeight: FontWeight.bold, color: orangeColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // build date date calendar to select available days
  Widget buildDateCalendar() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select days available",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(height: 10,),
          SfDateRangePicker(

            selectionMode: DateRangePickerSelectionMode.multiple,
            selectionColor: orangeColor,
            onSelectionChanged: (args) {
              if (args.value != null) {
                selectedDates = args.value;
              }else {
                selectedDates.clear();
              }
              print(selectedDates.length.toString());
            }
          ),
        ],
      ),
    );
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
              "Time",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
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
      });
    }
  }

  // build create button
  Widget buildCreateBtn() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: MaterialButton(
          onPressed: isCreateBtnEnabled? () {
            if (validate()) {
              // encapsulate data into object
              // send date detail request
              spotDate.description = _descriptionEditController.text.toString();
              // add date types
              spotDate.dateTypes.clear();
              for (int i=0; i < selectedDateTypes.length; i++) {
                MyDateType dt = MyDateType();
                dt.type = selectedDateTypes[i];
                spotDate.dateTypes.add(dt);
              }
              spotDate.resturantId = selectedResturant.id;
              spotDate.daysAvailable.clear();
              for (int i=0; i < selectedDates.length; i++) {
                DaysAvailable da = DaysAvailable();
                da.date = "${selectedDates[i].year}-${selectedDates[i].month}-${selectedDates[i].day} 12:00:00";
                spotDate.daysAvailable.add(da);
              }
              spotDate.time = "2020-1-1 $selectedTime:00";
              spotDate.toId = toId;
              // send date detail request
              setState(() {
                isCreateBtnEnabled = false;
              });
              //sendDateDetailRequest(spotDate);
            }
          } : null,
          color: orangeColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            "Create",
            style: TextStyle(fontSize: 14.0, color: Colors.white, fontFamily: 'Lato', fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // validate data, show error message is not valid
  // return true, false
  bool validate() {
    String errorText = "";
    if (_descriptionEditController.text.isEmpty) {
      errorText = "Date description cannot be empty";
    }

    if (selectedDates.isEmpty) {
      errorText += "\nSelect at least 1 Date type";
    }

    if (selectedResturant == null) {
      errorText += "\nSelect Location";
    }

    if (selectedDates.isEmpty) {
      errorText += "\nSelect at least 1 Available day";
    }

    if (selectedTime == null) {
      errorText += "\nSelect time";
    }

    if (errorText.isEmpty) {
      return true;
    }else {
      showSnackbar(errorText);
      return false;
    }
  }

  // send date detail request
  // void sendDateDetailRequest(SpotDate spotDate) {
  //   api.sendDateDetailRequest(spotDate).then((value) {
  //     setState(() {
  //       isCreateBtnEnabled = true;
  //     });
  //     showToast("Date detail request send");
  //     Navigator.pop(context);
  //   }).catchError((error) {
  //     setState(() {
  //       isCreateBtnEnabled = true;
  //     });
  //     showSnackbar(error.toString());
  //   });
  // }

  // show snackbar
  void showSnackbar(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message),)));
  }

  // show toast
  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  // navigate to SelectResturantPage
  void navigateToSelectResturantPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectResturantPage(onSelect: (resturant) {
        selectedResturant = resturant;
        setState(() {
          selectedLocationText = selectedResturant.name;
        });
      },)),
    );
  }
}
