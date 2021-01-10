
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:letsgetstarted/models/profile.dart';
import 'package:spotadate/models/spot_date.dart';
// import 'package:letsgetstarted/models/spot_request.dart';
// import 'package:spot/network/api/spot_apis.dart';
import 'package:spotadate/utils/colors.dart';
import 'package:spotadate/utils/date_utils.dart';
import 'package:spotadate/utils/location_utils.dart';

import 'navigation/profile.dart';

class ProfileDetailPage extends StatefulWidget {

  ProfileDetailPage({@required this.profile, @required this.latitude, @required this.longitude});

  Profile profile;
  double latitude;
  double longitude;

  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState(profile: this.profile,
      latitude: this.latitude, longitude: this.longitude);
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {

  _ProfileDetailPageState({@required this.profile, @required this.latitude, @required this.longitude});

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Profile profile;
  double latitude;
  double longitude;

  int currentImageIndex = 0;

  //SpotApis api = SpotApis();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Stack(
      children: [
        buildProfileInfoContents(),
        buildImageSliderDots(),
        buildBackBtn(),
        buildIconBtns(),
      ],
    );
  }

  Widget buildProfileInfoContents() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if image gallery is 0 then show empty container otherwise show image slider
        profile.gallery.length < 1? buildEmptyContainer() : buildImageSlider(),
        // margin
        //SizedBox(height: 8,),
        buildUserInfoWidgets(),
      ],
    );
  }

  // build empty container replacement of image slider
  Widget buildEmptyContainer() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      child: Center(
        child: Text(
          "No images found",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: greyTextColor),
        ),
      ),
    );
  }

  // build image slider
  Widget buildImageSlider() {
    return CarouselSlider.builder(
      itemCount: profile.gallery.length,
      itemBuilder: (context, index) {
        return Container(
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                profile.gallery[index].image,
              ),
              fit: BoxFit.cover
            )
          ),
        );
      },
      options: CarouselOptions(
        //height: MediaQuery.of(context).size.height/2,
        aspectRatio: 1.0,
        enlargeCenterPage: false,
        //viewportFraction: 1.0,
        autoPlay: true,
        onPageChanged: (index, reason) {
          print(index);
          setState(() {
            currentImageIndex = index;
          });
        },
      ),

    );
  }

  Widget buildImageSliderDots() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        height: 20,
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: profile.gallery.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 8),
                child: Container(
                  width: currentImageIndex == index? 10 : 8,
                  height: currentImageIndex == index? 5 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentImageIndex == index? orangeColor : Colors.white
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildUserInfoWidgets() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    profile.name != null? profile.name : "",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Lato',
                        color: Colors.black87),
                  ),

                  // margin
                  SizedBox(height: 16,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/female.svg', width: 12, height: 12, color: orangeColor,),
                          // margin
                          SizedBox(width: 8,),
                          // age
                          Text(
                            "${profile.dob != null? DateUtils.getAgeFromDob(profile.dob) : 0} years",
                            style: TextStyle(color: Colors.black87, fontSize: 12),
                          ),
                        ],
                      ),

                      // margin
                      SizedBox(width: 16,),

                      // distance
                      Row(
                        children: [
                          // location arrow
                          SvgPicture.asset('assets/images/location_arrow.svg', width: 12, height: 12, color: orangeColor,),
                          // margin
                          SizedBox(width: 4,),
                          // distance
                          Text(
                            "${profile.longitude != null && profile.longitude != null?
                            LocationUtils.calculateDistance(profile.latitude, profile.longitude,
                                latitude, longitude).toStringAsFixed(2) : 0} km",
                            style: TextStyle(color: Colors.black87, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // margin
                  SizedBox(height: 16,),

                  // About me
                  Text(
                    "About me",
                    style: TextStyle(color: greyTextColor, fontWeight: FontWeight.bold),
                  ),
                  // margin
                  SizedBox(height: 8,),
                  Text(
                    profile.about != null? profile.about : "",
                    style: TextStyle(fontSize: 12),
                  ),

                  // margin
                  SizedBox(height: 16,),

                  // Status
                  Text(
                    "Status",
                    style: TextStyle(color: greyTextColor, fontWeight: FontWeight.bold),
                  ),
                  // margin
                  SizedBox(height: 8,),
                  Text(
                    //profile.status != null? profile.status : "Single",
                    "Single",
                    style: TextStyle(fontSize: 12),
                  ),

                  // margin
                  SizedBox(height: 16,),

                  // Height
                  Text(
                    "Height",
                    style: TextStyle(color: greyTextColor, fontWeight: FontWeight.bold),
                  ),
                  // margin
                  SizedBox(height: 8,),
                  Text(
                    //profile.height != null? profile.height : "5.9",
                    "5.9",
                    style: TextStyle(fontSize: 12),
                  ),

                  // margin
                  SizedBox(height: 16,),

                  // Occupation
                  Text(
                    "Occupation",
                    style: TextStyle(color: greyTextColor, fontWeight: FontWeight.bold),
                  ),
                  // margin
                  SizedBox(height: 8,),
                  Text(
                    //profile.occupation != null? profile.occupation : "",
                    "Mobile Developer",
                    style: TextStyle(fontSize: 12),
                  ),

                  // margin
                  SizedBox(height: 16,),

                  // Interests
                  Text(
                    "Interests",
                    style: TextStyle(color: greyTextColor, fontWeight: FontWeight.bold),
                  ),
                  // margin
                  SizedBox(height: 8,),
                  Container(
                    height: 36,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: profile.interests.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border(
                                top: BorderSide(color: deepOrange, width: 1),
                                bottom: BorderSide(color: deepOrange, width: 1),
                                left: BorderSide(color: deepOrange, width: 1),
                                right: BorderSide(color: deepOrange, width: 1),
                              ),
                            ),
                            child: Text(
                              profile.interests[index].interest,
                              style: TextStyle(color: orangeColor),
                            ),
                          ),
                        );
                      },
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

  // build back button
  Widget buildBackBtn() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 24, left: 8),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: deepOrange, size: 24,),
        ),
      ),
    );
  }

  Widget buildIconBtns() {
    return Padding(
      padding: EdgeInsets.only(top: 90),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // block
            InkWell(
              onTap: () {
                print("Block Taped");
              },
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                  ),
                  child: SvgPicture.asset(
                    'assets/images/block.svg',
                    color: Colors.red[600],
                  ),
                ),
              ),
            ),

            // margin
            SizedBox(width: 8,),

            // bookmark
            InkWell(
              onTap: () {
                print("Bookmark Taped");
              },
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                  ),
                  child: SvgPicture.asset(
                    'assets/images/bookmark_spot.svg',
                    color: orangeColor,
                  ),
                ),
              ),
            ),

            // margin
            SizedBox(width: 8,),

            // heart
            InkWell(
              onTap: () {
                print("Heart Taped");
                //sendSpotDateRequest();
              },
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: <Color> [heartBackgroundColor1, heartBackgroundColor2, heartBackgroundColor3,
                          heartBackgroundColor4, heartBackgroundColor5],
                        //stops: [0.1, 0.5],
                        begin: Alignment.topLeft,
                    ),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/heart.svg',
                    color: Colors.white,
                    width: 36,
                    height: 36,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // send spot date request
  // void sendSpotDateRequest() {
  //   SpotRequest spotRequest = SpotRequest();
  //   spotRequest.toId = profile.userId;
  //   api.sendSpotDateRequest(spotRequest).then((value) {
  //     showToast("Date request sent successfully");
  //   }).catchError((error) {
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
}


