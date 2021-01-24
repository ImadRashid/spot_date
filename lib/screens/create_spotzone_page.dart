import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spotadate/components/date_type.dart';
import 'package:spotadate/models/resturant.dart';
import 'package:spotadate/models/spot_date.dart';
import 'package:spotadate/models/spotzone.dart';
import 'package:spotadate/ui/screens/google_map_screen.dart';
//import 'package:spot/network/api/spot_apis.dart';
//import 'package:spotadate/pages/select_resturant_page.dart';
import 'package:spotadate/utils/colors.dart';
import 'package:spotadate/utils/date_types.dart';

// import 'home_page.dart';

class CreateSpotzonePage extends StatefulWidget {
  @override
  _CreateSpotzonePageState createState() => _CreateSpotzonePageState();
}

class _CreateSpotzonePageState extends State<CreateSpotzonePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  List<String> selectedDateTypes = List();
  List<String> dateTypes = DateTypes.getDateTypes();

  String selectedLocationText = "Where would you like to go?";
  String selectedTime = "Slect time";
  String selectedDate = "Select date";

  Resturant selectedResturant;

  //SpotApis api = SpotApis();

  bool isCreateBtnEnabled = true;

  bool male = false;
  bool female = false;

  double minAge = 0.0;
  double maxAge = 100.0;

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
          "Create a Spotzone",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: greyTextColor),
        ),
      ),
    );
  }

  Widget buildBody() {
    return buildBodyContents();

    //buildBodyMyContent();

    //
  }

  // Widget buildBodyMyContent()
  // {
  //   return Container(
  //     height: MediaQuery.of(context).size.height/2,
  //     width: MediaQuery.of(context).size.width,
  //     margin: EdgeInsets.only(left: 10,right: 10),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Flexible(
  //           child: Container(
  //               height: MediaQuery.of(context).size.height,
  //               child: buildTitle()),
  //         ),
  //         Flexible(
  //           child: Container(child: buildDateTypes()),
  //
  //         ),
  //         Flexible(
  //           child: Container(child: buildLocation()),
  //         ),
  //         // Flexible(
  //         //   child: SizedBox(height: 20,),
  //         // )
  //         Flexible(
  //           child: Container(
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 buildSelectDate(),
  //                 buildSelectTime(),
  //               ],
  //             ),
  //           ),
  //         )
  //
  //       ],
  //     ),
  //
  //
  //   );
  // }

  Widget buildBodyContents() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            //height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitle(),
                buildDateTypes(),
                buildLocation(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildSelectDate(),
                    buildSelectTime(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                buildLokkingFor(),
                SizedBox(
                  height: 10,
                ),
                buildMaleSwitch(),
                SizedBox(
                  height: 10,
                ),
                buildFemaleSwitch(),
                SizedBox(
                  height: 20,
                ),
                buildAgeSlider(),
                SizedBox(
                  height: 20,
                ),
                buildCreateBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // build Title
  Widget buildTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Title",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _titleController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty) {
                return "Description cannot cannot be empty";
              } else {
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
              hintText: "Enter spot zone title",
              hintStyle: TextStyle(
                color: greyTextColor,
              ),
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
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              DateType(
                onSelected: (value) {
                  if (selectedDateTypes.contains(value)) {
                    setState(() {
                      selectedDateTypes.remove(value);
                    });
                  } else {
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
                  } else {
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
                  } else {
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
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              DateType(
                onSelected: (value) {
                  if (selectedDateTypes.contains(value)) {
                    setState(() {
                      selectedDateTypes.remove(value);
                    });
                  } else {
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
                  } else {
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
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {},
            // ()
            // {
            //   Navigator.push(context, MaterialPageRoute(builder:(context)=>GoogleMapScreen(

            //   )));
            // },
            child: Container(
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
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: InkWell(
              onTap: () {
                // navigate to select resturant page
                //navigateToSelectResturantPage();
              },
              child: Text(
                "Choose from map",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: orangeColor),
              ),
            ),
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
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
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

  // build select time
  Widget buildSelectDate() {
    return InkWell(
      onTap: () {
        print("date picker selected");
        // show timer picker dialog
        showDatePickerDialog();
      },
      child: Padding(
        padding: EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
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
                    selectedDate,
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

  Widget buildLokkingFor() {
    return // i'm looking for text
        Text(
      "I'm looking for",
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
    );
  }

  // build male switch
  Widget buildMaleSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Male",
          style: TextStyle(color: Colors.black87),
        ),
        Switch(
          value: male,
          activeColor: orangeColor,
          activeTrackColor: Colors.grey,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: (value) {
            setState(() {
              male = value;
            });
          },
        ),
      ],
    );
  }

  // build female switch
  Widget buildFemaleSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Female",
          style: TextStyle(color: Colors.black87),
        ),
        Switch(
          value: female,
          activeColor: orangeColor,
          activeTrackColor: Colors.grey,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: (value) {
            setState(() {
              female = value;
            });
          },
        ),
      ],
    );
  }

  // build age slider
  Widget buildAgeSlider() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Age text
            Text(
              "Age",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),

            Text("${minAge.round()} - ${maxAge.round()}"),
          ],
        ),
        FlutterSlider(
          values: [minAge, maxAge],
          max: 100,
          min: 0,
          rangeSlider: true,
          handlerHeight: 20,
          handlerWidth: 20,
          trackBar: FlutterSliderTrackBar(
            activeTrackBar: BoxDecoration(color: orangeColor),
            inactiveTrackBar: BoxDecoration(color: greyTextColor),
          ),
          onDragging: (handlerIndex, lowerValue, upperValue) {
            setState(() {
              print(lowerValue.toString());
              minAge = lowerValue;
              maxAge = upperValue;
            });
          },
          handler: FlutterSliderHandler(
            foregroundDecoration:
                BoxDecoration(color: orangeColor, shape: BoxShape.circle),
          ),
          rightHandler: FlutterSliderHandler(
            foregroundDecoration:
                BoxDecoration(color: orangeColor, shape: BoxShape.circle),
          ),
        ),
      ],
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

  // show date picker dialog
  Future<Null> showDatePickerDialog() async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
    );
    if (picked != null) {
      print(picked.toString());
      setState(() {
        selectedDate = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  // build create button
  Widget buildCreateBtn() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: MaterialButton(
          onPressed: isCreateBtnEnabled
              ? () {
                  if (validate()) {
                    Spotzone spotzone = Spotzone();
                    spotzone.title = _titleController.text.toString();
                    spotzone.date = "$selectedDate 00:00:00";
                    spotzone.time = "2020-1-1 $selectedTime:00";
                    spotzone.resturantId = selectedResturant.id;
                    spotzone.male = male;
                    spotzone.female = female;
                    spotzone.minAge = minAge.round();
                    spotzone.maxAge = maxAge.round();
                    for (int i = 0; i < selectedDateTypes.length; i++) {
                      SpotDateType dt = SpotDateType();
                      dt.type = selectedDateTypes[i];
                      spotzone.dateTypes.add(dt);
                    }
                    setState(() {
                      isCreateBtnEnabled = false;
                    });
                    //createSpotzone(spotzone);
                  }
                }
              : null,
          color: orangeColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            "Create",
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // validate data, show error message is not valid
  // return true, false
  bool validate() {
    String errorText = "";
    if (_titleController.text.isEmpty) {
      errorText = "title cannot be empty";
    }

    if (selectedResturant == null) {
      errorText += "\nSelect Location";
    }

    if (selectedTime == null) {
      errorText += "\nSelect time";
    }

    if (selectedDate == null) {
      errorText += "\nSelect date";
    }

    if (selectedDateTypes.isEmpty) {
      errorText += "\nSelect at least 1 date type";
    }

    if (errorText.isEmpty) {
      return true;
    } else {
      showSnackbar(errorText);
      return false;
    }
  }

  // show snackbar
  void showSnackbar(String message) {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text(message),
            )));
  }

  // void createSpotzone(Spotzone spotzone) {
  //   api.createSpotzone(spotzone).then((value) {
  //     setState(() {
  //       isCreateBtnEnabled = true;
  //     });
  //     showToast("Spotzone created");
  //     navigateToHomePage();
  //   }).catchError((error) {
  //     setState(() {
  //       isCreateBtnEnabled = true;
  //     });
  //     showSnackbar(error.toString());
  //   });
  // }

  // show toast
  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  // navigate to SelectResturantPage
  // void navigateToSelectResturantPage() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => SelectResturantPage(onSelect: (resturant) {
  //       selectedResturant = resturant;
  //       setState(() {
  //         selectedLocationText = selectedResturant.name;
  //       });
  //     },)),
  //   );
  // }

  // Navigate to HomePage
  void navigateToHomePage() {
    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()),
    //         (Route<dynamic> route) => false);
  }
}
