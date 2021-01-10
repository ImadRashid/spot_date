
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:spotadate/models/resturant.dart';
//import 'package:spot/network/api/spot_apis.dart';
import 'package:spotadate/utils/colors.dart';
import 'package:spotadate/utils/date_utils.dart';
import 'package:spotadate/utils/location_utils.dart';


class SelectResturantPage extends StatefulWidget {

  SelectResturantPage({@required this.onSelect});

  Function onSelect;

  @override
  _SelectResturantPageState createState() => _SelectResturantPageState(onSelect: onSelect);
}

class _SelectResturantPageState extends State<SelectResturantPage> {

  _SelectResturantPageState({@required this.onSelect});

  Function onSelect;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Completer<GoogleMapController> _controller = Completer();
  LatLng currentLocation;// = LatLng(37.42796133580664, -122.085749655962);
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  List<Resturant> resturants = List();

  //SpotApis api = SpotApis();

  BitmapDescriptor pinLocationIcon;

  Resturant selectedResturant;

  SolidController solidController = SolidController();

  String bottomSheetViewMoreText = "view more details";

  bool isExpanded = false;

  Function onMoreDetails;

  @override
  void initState() {
    super.initState();
    getMarkerIcon();
    getCurrentLocation();
    //getResturants();

    solidController.addListener(() {
      setState(() {
        if (solidController.isOpened) {
          bottomSheetViewMoreText = "view less details";
        }else {
          bottomSheetViewMoreText = "view more details";
        }
      });
    });
  }

  // get current location
  void getCurrentLocation() async {
    //Position position = await Geolocator.getLastKnownPosition();
    setState(() {
      //currentLocation = LatLng(position.latitude, position.longitude);
    });
  }

  // get marker icon from asset
  void getMarkerIcon() {
    getBytesFromAsset('assets/images/resturant.png', 64).then((onValue) {
      pinLocationIcon =BitmapDescriptor.fromBytes(onValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(),
      body: buildBody(),
      bottomSheet: bottomSheet(),
    );
  }

  // build appbar
  Widget buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Center(
        child: Text(
          "Select Resturant",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: greyTextColor),
        ),
      ),
    );
  }

  Widget buildBody() {
    return buildMap();
  }

  // build map widget with locations
  Widget buildMap() {
    return GoogleMap(
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: currentLocation,
        zoom: 15,
      ),
      markers: Set<Marker>.of(markers.values),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  // add markers to map
  void addMarkers() {
    for (int i=0; i < resturants.length; i++) {
      createNewMarker(resturants[i]);
    }
  }

  // add single marker to map
  void createNewMarker(Resturant resturant) {
    print("marker adding");
    var markerIdVal = markers.length + 1;
    String mar = markerIdVal.toString();
    final MarkerId markerId = MarkerId(mar);
    final Marker marker = Marker(markerId: markerId, position: LatLng(resturant.lat, resturant.lng),
      icon: pinLocationIcon, onTap: () {
      onMarkerTap(resturant);
    });

    setState(() {
      markers[markerId] = marker;
    });
  }

  // on marker tap
  void onMarkerTap(Resturant resturant) {
    print(resturant.name);
    setState(() {
      selectedResturant = resturant;
    });
  }

  // Bottom sheet
  Widget bottomSheet() {
    return selectedResturant != null? SolidBottomSheet(
      controller: solidController,
      maxHeight: 350,
      draggableBody: false,
      canUserSwipe: false,
      autoSwiped: false,
      showOnAppear: isExpanded,
      smoothness: Smoothness.medium,
      headerBar: buildBottomSheetHeader(),
      body: buildBottomSheetBody(),
    ): Container(height: 0,);
  }

  // bottom sheet header
  Widget buildBottomSheetHeader() {
    return Container(
      color: Theme.of(context).primaryColor,
      height: selectedResturant != null? 150 : 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildResturantIcon(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildResturantName(),
                SizedBox(height: 3,),
                buildResturantRating(),
                SizedBox(height: 3,),
                buildResturantTime(),
                SizedBox(height: 3,),
                isExpanded? buildViewLessDetails() : buildViewMoreDetails(),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildResturantDistance(),
                buildResturantSelectBtn(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // resturant icon image
  Widget buildResturantIcon() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: selectedResturant.image != null? Image.network(
        selectedResturant.image,
        height: 100,
      ): Image.asset(
        'assets/images/placeholder.jpg',
        height: 100,
      ),
    );
  }

  // resturant name
  Widget buildResturantName() {
    return Text(
      selectedResturant.name,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  // resturant distance with icon
  Widget buildResturantDistance() {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/location_arrow.svg',
          color: orangeColor,
          width: 12,
          height: 12,
        ),
        SizedBox(width: 4,),
        Text(
          "${LocationUtils.calculateDistance(currentLocation.latitude,
              currentLocation.longitude, selectedResturant.lat, selectedResturant.lng).ceil()} km",
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget buildResturantRating() {
    return Row(
      children: [
        Text(
          getAvgRating().toString(),
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(width: 2,),
        RatingBar(
          ignoreGestures: true,
          itemSize: 12,
          initialRating: getAvgRating(),
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: Icon(Icons.star, color: Colors.amber,),
            half: Icon(Icons.star_half, color: Colors.amber,),
            empty: Icon(Icons.star_border, color: Colors.amber,),
          ),
          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
      ],
    );
  }

  // resturant time
  Widget buildResturantTime() {
    return Text(
      "${DateUtils.isInTime(selectedResturant.fromTime, selectedResturant.toTime)? "Open" : "Close"} | Closes "
          "${DateUtils.getTime(selectedResturant.toTime)}",
      style: TextStyle(fontSize: 10),
    );
  }

  // resturant select button
  Widget buildResturantSelectBtn() {
    return MaterialButton(
      onPressed: () {
        onSelect(selectedResturant);
        Navigator.pop(context);
      },
      color: orangeColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        "Select",
        style: TextStyle(fontSize: 14.0, color: Colors.white, fontFamily: 'Lato', fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildViewMoreDetails() {
    return InkWell(
      onTap: () {
        setState(() {
          isExpanded = true;
        });
      },
      child: Text(
        "view more details",
        style: TextStyle(fontSize: 12, color: orangeColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildViewLessDetails() {
    return InkWell(
      onTap: () {
        setState(() {
          isExpanded = false;
        });
      },
      child: Text(
        "view less details",
        style: TextStyle(fontSize: 12, color: orangeColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  // bottom sheet body
  Widget buildBottomSheetBody() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            buildResturantDescription(),
            SizedBox(height: 10,),
            buildResturantDownloadMenu(),
            SizedBox(height: 10,),
            Spacer(),
            buildResturantImageList(),
          ],
        ),
      ),
    );
  }

  // resturant description
  Widget buildResturantDescription() {
    return Text(
      selectedResturant.description,
      style: TextStyle(fontSize: 12),
    );
  }

  // resturant menu
  Widget buildResturantDownloadMenu() {
    return Row(
      children: [
        Icon(
          Icons.restaurant_menu,
          color: orangeColor,
          size: 24,
        ),
        SizedBox(width: 10,),
        Text(
          "Download Menu",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
        ),
      ],
    );
  }

  // resturant image list
  Widget buildResturantImageList() {
    print(selectedResturant.resturantImages[0].image);
    return Container(
      height: 150,
      width: double.infinity,
      child: Expanded(
        child: ListView.builder(
          itemCount: selectedResturant.resturantImages.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(right: 20),
              //height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  selectedResturant.resturantImages[index].image,
                  height: 150,
                ),
              ),
              //child: Image.network(selectedResturant.resturantImages[index].image, ),
            );
          },
        ),
      ),
    );
  }

  // calculate avg rating from selected resturant and return in string format
  double getAvgRating() {
    double rating = 0.0;
    int counter = 0;
    for (int i=0; i < selectedResturant.reviews.length; i++) {
      rating += selectedResturant.reviews[i].rating;
      counter++;
    }

    return counter == 0? 0.0 : (rating / counter);
  }

  // get resturants
  // void getResturants() {
  //   print("resturant getting");
  //   api.getResturants().then((value) {
  //     resturants = value;
  //     addMarkers();
  //   }).catchError((error) {
  //     showSnackbar(error.toString());
  //   });
  // }

  // Show snackbar with message
  void showSnackbar(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message),)));
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png)).buffer.asUint8List();
  }
}


