import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoder/geocoder.dart';

//import 'package:location/location.dart';
import 'package:spotadate/components/date_type.dart';
import 'package:spotadate/models/spot_date.dart';

// import 'package:spot/models/user.dart';
// import 'package:spot/network/api/spot_apis.dart';
import 'package:spotadate/utils/colors.dart';
import 'package:spotadate/utils/date_utils.dart';
import 'package:spotadate/utils/location_utils.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'home_page.dart';

class SpotDateDetailPage extends StatefulWidget {
  // SpotDateDetailPage({this.spotDate, this.requestId, this.toId, this.toUser, this.onApprove});
  //
  // SpotDate spotDate;
  // int toId;
  // int requestId;
  // User toUser;
  // Function onApprove;

  @override
  _SpotDateDetailPageState createState() => _SpotDateDetailPageState();
}

class _SpotDateDetailPageState extends State<SpotDateDetailPage> {
  // _SpotDateDetailPageState({this.spotDate, this.requestId, this.toId, this.toUser, this.onApprove});
  //
  // SpotDate spotDate;
  // int toId;
  // int requestId;
  //User toUser;
  Function onApprove;

  //User user;

  bool isLocationFected = false;

  String distance = "";
  String resturantAddress = "";

  List<DateTime> selectedDates = List();

  //Location location = Location();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isApproveBtnEnabled = true;

  //SpotApis api = SpotApis();

  @override
  void initState() {
    super.initState();
    // get to user
    //user = toUser;
    requestLocation();
    getAddress();
    toDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //appBar: buildAppBar(),
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
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: greyTextColor),
        ),
      ),
    );
  }

  // build body contents
  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // user info
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.black,
            child: Stack(
              children: [
                // user image
                buildUserImage(),
                // user info
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: orangeColor,
                      size: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      buildUserName(),
                      SizedBox(
                        height: 10,
                      ),
                      buildDistance(),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                buildAnyoneText(),
                SizedBox(
                  height: 20,
                ),
                buildDateTypes(),
                SizedBox(
                  height: 20,
                ),
                buildResturantAddress(),
                SizedBox(
                  height: 20,
                ),
                buildCalendar(),
                SizedBox(
                  height: 20,
                ),
                buildAvailableTime(),
                SizedBox(
                  height: 20,
                ),
                buildApproveBtn(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // user image
  Widget buildUserImage() {
    return
        //   user.profile.image != null? Image.network(
        //   user.profile.image,
        //   width: double.infinity,
        //   height: 400,
        //   fit: BoxFit.fitHeight,
        // ):
        Image.asset(
      'assets/ben.png',
      width: double.infinity,
      height: 300,
      fit: BoxFit.cover,
    );
  }

  // user name
  Widget buildUserName() {
    return Text(
      "Chad",
      style: TextStyle(fontSize: 18, color: Colors.white),
    );
  }

  // user distance
  Widget buildDistance() {
    return Text(
      distance,
      style: TextStyle(fontSize: 18, color: Colors.white),
    );
  }

  // anyone text description
  Widget buildAnyoneText() {
    return Center(
      child: Text(
        "Anyone else free for a coffe, let know",
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
      ),
    );
  }

  // build date types
  Widget buildDateTypes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What would you like to do?",
          style: TextStyle(fontWeight: FontWeight.bold, color: greyTextColor),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            height: 24,
            width: 80,
            decoration: BoxDecoration(
              border: Border.all(color: orangeColor),
              borderRadius: BorderRadius.circular(20),
            ),
            child: FlatButton(
              onPressed: () {},
              child: Text("Coffee",style: TextStyle(color: Colors.orange),),
            )),
      ],
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

  Widget buildResturantAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Where would you like to go?",
          style: TextStyle(fontWeight: FontWeight.bold, color: greyTextColor),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on,
              color: orangeColor,
              size: 16,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                "Cosa Nosta, East Street 424 London,",
                // resturantAddress,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "view in map",
                style: TextStyle(fontSize: 10, color: orangeColor),
              ),
            ),
          ],
        ),
      ],
    );
  }

  //  availalbe to dates in clendar
  Widget buildCalendar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Available dates",
          style: TextStyle(fontWeight: FontWeight.bold, color: greyTextColor),
        ),
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

  // available time
  Widget buildAvailableTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Available time",
          style: TextStyle(fontWeight: FontWeight.bold, color: greyTextColor),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.access_time,
              color: orangeColor,
              size: 16,
            ),
            SizedBox(
              width: 10,
            ),
            Text("7:30pm"
                //DateUtils.getTime(spotDate.time),
                ),
          ],
        ),
      ],
    );
  }

  // build approve button
  Widget buildApproveBtn() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: MaterialButton(
          onPressed: isApproveBtnEnabled
              ? () {
                  setState(() {
                    isApproveBtnEnabled = false;
                  });
                  approveDateDetailRequest();
                }
              : null,
          color: orangeColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            "Approve",
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

  // request current location
  void requestLocation() async {
    // bool _serviceEnabled;
    // PermissionStatus _permissionGranted;
    // LocationData _locationData;
    //
    // _serviceEnabled = await location.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await location.requestService();
    //   if (!_serviceEnabled) {
    //     showSnackbar("Location service not enabled");
    //     return;
    //   }
    // }
    //
    // _permissionGranted = await location.hasPermission();
    // if (_permissionGranted == PermissionStatus.denied) {
    //   _permissionGranted = await location.requestPermission();
    //   if (_permissionGranted != PermissionStatus.granted) {
    //     showSnackbar("Location permission not granted");
    //     return;
    //   }
    // }
    //
    // _locationData = await location.getLocation();
    // location.onLocationChanged.listen((LocationData currentLocation) {
    //   if (!isLocationFected) {
    //     setState(() {
    //       distance = LocationUtils.calculateDistance(currentLocation.latitude, currentLocation.longitude,
    //           user.profile.location.lat, user.profile.longitude).ceil().toString();
    //     });
    //   }
    //   isLocationFected = true;
    // });
  }

  // convert available to dates to date time list
  void toDateTime() {
    // for (int i = 0; i < spotDate.daysAvailable.length; i++) {
    //   selectedDates.add(DateUtils.toDateTime(spotDate.daysAvailable[i].date));
    // }
  }

  // get address from coordinates
  void getAddress() async {
    // From coordinates
    // final coordinates = new Coordinates(
    //     spotDate.resturant.lat, spotDate.resturant.lng);
    // var addresses = await Geocoder.local.findAddressesFromCoordinates(
    //     coordinates);
    // setState(() {
    //   resturantAddress = addresses.first.addressLine.toString();
    // });
  }

  // show snackbar
  void showSnackbar(String message) {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text(message),
            )));
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
        fontSize: 16.0);
  }

  // approve date detail request
  void approveDateDetailRequest() {
    // int dateId = spotDate.id;
    // int toId = this.toId;
    // api.approveDateDetailRequest(dateId, toId, requestId).then((value) {
    //   showToast("Date detail request accepted");
    //   onApprove();
    //   navigateToHomePage();
    // }).catchError((error) {
    //   setState(() {
    //     isApproveBtnEnabled = true;
    //   });
    //   showToast(error.toString());
    // });
  }

  // Navigate to HomePage
  void navigateToHomePage() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()),
        (Route<dynamic> route) => false);
  }
}
