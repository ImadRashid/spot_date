import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotadate/components/cacle_date.dart';
import 'package:spotadate/components/spot_filter_dialog.dart';
import 'package:spotadate/models/home_images_model.dart';
import 'package:spotadate/models/spot_filter.dart';
import 'package:spotadate/screens/authentication/login_page.dart';
import 'package:spotadate/screens/navigation/profile.dart';

//import 'package:letsgetstarted/models/profile.dart';
import 'package:spotadate/screens/profile_detail_page.dart';
import 'package:spotadate/ui/screens/images_slider_screen.dart';
import 'package:spotadate/utils/colors.dart';

import '../create_spotzone_page.dart';

class NavHomePage extends StatefulWidget {
  NavHomePage({this.homeScaffold});

  final GlobalKey<ScaffoldState> homeScaffold;

  @override
  _NavHomePageState createState() =>
      _NavHomePageState(homeScaffold: homeScaffold);
}

class _NavHomePageState extends State<NavHomePage> {
  _NavHomePageState({this.homeScaffold});

  final GlobalKey<ScaffoldState> homeScaffold;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String TAB_SPOT = "spot";
  String TAB_SPOTZONE = "spot_zone";

  String SELECTED_TAB = "spot";
  bool isOpenedFilterContainer = false;
  bool isShotEmptyMessage = false;
  PageController spotPageController = PageController(
    viewportFraction: 0.99999,
  );
  SpotFilter spotFilter = SpotFilter();

  List<String> spots = [
    'assets/ben.png',
    'assets/man.png',
    'assets/ben.png',
    'assets/man.png',
    'assets/ben.png',
    'assets/man.png'
  ];
  var items = List<String>();

  @override
  void initState() {
    items.addAll(spots);
    super.initState();
  }

  int currentSpotIndex = 0;
  bool straight = false;
  bool female = false;
  bool male = false;
  double minAge = 0.0;
  double maxAge = 100.0;
  double distance = 100.0;

  bool selectedStraight = false;
  bool selectedFemale = false;
  bool selectedMale = false;
  double selectedMinAge = 0.0;
  double selectedMaxAge = 100.0;
  double selectedDistance = 100.0;
  StreamController<SpotFilter> spotFilterController =
      StreamController<SpotFilter>();
  ScrollController _spotScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        CancleDateDialog(
                context: context,
                msg: " Are you sure you want to logout?",
                onDismiss: () {
                  //navigateToHomePage();
                })
            .show(); // to perform on back pressed
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return /*TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        SpotPage(spotFilterController: spotFilterController,),
        SpotzonePage(),
      ],
    );*/
        Container(
      padding: EdgeInsets.only(top: 25, bottom: 10, left: 20, right: 20),
      child: Column(
        children: [
          Container(
            height: 50,
            child: Center(child: buildTabs()),
          ),
          SELECTED_TAB == TAB_SPOT ? buildSpotBody() : buildSpotzoneBody(),
        ],
      ),
    );
  }

  // spotzone body

  Widget buildAddActionItem() {
    return Padding(
      padding: EdgeInsets.only(right: 0),
      child: InkWell(
        onTap: () {
          print("Add selected");
          navigateToCreateSpotzoneRequest();
        },
        child: SvgPicture.asset(
          "assets/images/add_circle.svg",
          width: 24,
          height: 24,
          color: orangeColor,
        ),
      ),
    );
  }

  // navigate to CreateSpotzone request
  void navigateToCreateSpotzoneRequest() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateSpotzonePage()),
    );
  }

  Widget buildFilterActionItem() {
    return Padding(
      padding: EdgeInsets.only(right: 0),
      child: InkWell(
        onTap: () {
          print("Filter selected");
          // show spot filter dialog
          SpotFilterDialog(
              context: homeScaffold.currentContext,
              spotFilter: spotFilter,
              onApply: (spotFilter) {
                this.spotFilter = spotFilter;
                this.selectedStraight = this.spotFilter.straight;
                this.selectedFemale = this.spotFilter.female;
                this.selectedMale = this.spotFilter.male;
                this.selectedMinAge = this.spotFilter.minAge.toDouble();
                this.selectedMaxAge = this.spotFilter.maxAge.toDouble();
                this.selectedDistance = this.spotFilter.distance.toDouble();
                spotFilterController.add(spotFilter);
                // getSpotData();
              }).show();
        },
        child: SvgPicture.asset(
          "assets/images/filter.svg",
          width: 20,
          height: 20,
          color: orangeColor,
        ),
      ),
    );
  }

  // build spot tab
  Widget buildSpot() {
    return InkWell(
      onTap: () {
        print("Spot selected");
        setState(() {
          SELECTED_TAB = TAB_SPOT;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // text
          Text(
            "Spot",
            style: TextStyle(
                fontWeight: SELECTED_TAB == TAB_SPOT
                    ? FontWeight.w700
                    : FontWeight.w200),
          ),
          // margin
          SizedBox(
            height: 4,
          ),
          // selected icon
          Icon(
            Icons.lens,
            color: SELECTED_TAB == TAB_SPOT ? orangeColor : Colors.transparent,
            size: 12,
          ),
        ],
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

  // build spotzone tab
  Widget buildSpotzone() {
    return InkWell(
      onTap: () {
        print("Spotzone selected");
        setState(() {
          SELECTED_TAB = TAB_SPOTZONE;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // text
          Text(
            "Spotzone",
            style: TextStyle(
                fontWeight: SELECTED_TAB == TAB_SPOTZONE
                    ? FontWeight.w700
                    : FontWeight.w200),
          ),
          // margin
          SizedBox(
            height: 4,
          ),
          // selected icon
          Icon(
            Icons.lens,
            color:
                SELECTED_TAB == TAB_SPOTZONE ? orangeColor : Colors.transparent,
            size: 12,
          ),
        ],
      ),
    );
  }

  // filter icon
  Widget buildFilterIcon() {
    return InkWell(
      onTap: () {
        print("Filter selected");
        if (isOpenedFilterContainer) {
          // close filter container
          setState(() {
            isOpenedFilterContainer = false;
          });
        } else {
          // open filter container
          setState(() {
            isOpenedFilterContainer = true;
          });
        }
      },
      child: SvgPicture.asset(
        "assets/images/filter.svg",
        width: 10,
        height: 10,
        color: orangeColor,
      ),
    );
  }

  Widget buildAddIcon() {
    return InkWell(
      onTap: () {
        print("Add selected");
        navigateToCreateSpotzoneRequest();
      },
      child: SvgPicture.asset(
        "assets/images/add_circle.svg",
        width: 24,
        height: 24,
        color: orangeColor,
      ),
    );
  }

  // spot body
  Widget buildSpotBody() {
    return isShotEmptyMessage
        ? buildSpotEmptyMessage()
        : buildSpotBodyContent();
  }

  Widget buildSpotEmptyMessage() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No data found",
            ),
            // margin
            SizedBox(
              height: 8,
            ),
            FlatButton(
              onPressed: () {
                if (SELECTED_TAB == TAB_SPOT) {
                  //getSpotData();
                }
              },
              child: Text(
                "REFRESH",
                style: TextStyle(color: orangeColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // spot body content
  Widget buildSpotBodyContent() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // spot list(viewpager)

            //buildSpotImages(),
            Expanded(
              //flex: 6,
              child: buildSpotListview(),
            ),

            // spot image list
            Container(
              height: 100,
              //flex: 1,
              child: buildSpotImageListView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSpotListview() {
    return PageView.builder(
      itemCount: homeImagesList.length,
      scrollDirection: Axis.horizontal,
      physics: AlwaysScrollableScrollPhysics(),
      onPageChanged: (value) {
        setState(() {
          currentSpotIndex = value;
        });
      },
      controller: spotPageController,
      itemBuilder: (context, index) {
        return buildSpotImages(context, index);
      },
    );
  }

  Widget buildSpotImages(BuildContext context, int index) {
    return Expanded(
      //flex: 6,
      //       child: Center(
      //     child: Container(child: Text("hello",style: TextStyle(fontSize: 35),),),
      // ),

      child: Container(
        child: Column(
          children: [
            // main card
            Expanded(
              flex: 5,
              child: Card(
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                //elevation: 5,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // image
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImagesSliderScreen()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              // image: NetworkImage(
                              //   "assets/images/placeholder.jpg",
                              //   //spots[index].image,
                              // ),
                              image: AssetImage(homeImagesList[index].image),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),

                    // card bottom contents
                    Align(
                      alignment: FractionalOffset.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            Text(
                              //spots[index].name != null? spots[index].name : "",
                              "Ben Parker",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato',
                                  color: Colors.white),
                            ),

                            // margin
                            SizedBox(
                              height: 8,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/female.svg',
                                      width: 12,
                                      height: 12,
                                      color: orangeColor,
                                    ),
                                    // margin
                                    SizedBox(
                                      width: 8,
                                    ),
                                    // age
                                    Text(
                                      "22 years",
                                      //"${spots[index].dob != null? DateUtils.getAgeFromDob(spots[index].dob) : 0} years",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),

                                // distance
                                Row(
                                  children: [
                                    // location arrow
                                    SvgPicture.asset(
                                      'assets/images/location_arrow.svg',
                                      width: 12,
                                      height: 12,
                                      color: orangeColor,
                                    ),
                                    // margin
                                    SizedBox(
                                      width: 4,
                                    ),
                                    // distance
                                    Text(
                                      "2 km",
                                      // "${spots[index].longitude != null && spots[index].longitude != null?
                                      // LocationUtils.calculateDistance(spots[index].latitude, spots[index].longitude,
                                      //     latitude, longitude).toStringAsFixed(2) : 0} km",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // button
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        width: 48,
                        height: 48,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: SvgPicture.asset(
                          'assets/images/block.svg',
                          color: Colors.red[600],
                        ),
                      ),
                    ),
                  ),
                  // margin
                  SizedBox(
                    width: 16,
                  ),

                  // heart
                  InkWell(
                    onTap: () {
                      print("Heart Taped");
                      //sendSpotDateRequest(spots[index]);
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
                              colors: <Color>[
                                heartBackgroundColor1,
                                heartBackgroundColor2,
                                heartBackgroundColor3,
                                heartBackgroundColor4,
                                heartBackgroundColor5
                              ],
                              //stops: [0.1, 0.5],
                              begin: Alignment.topLeft),
                        ),
                        child: SvgPicture.asset(
                          'assets/images/heart.svg',
                          color: Colors.white,
                          width: 48,
                          height: 48,
                        ),
                      ),
                    ),
                  ),

                  // margin
                  SizedBox(
                    width: 16,
                  ),

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
                        width: 48,
                        height: 48,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: SvgPicture.asset(
                          'assets/images/bookmark_spot.svg',
                          color: orangeColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      //buildSpotListview(),
    );
  }

  // Widget buildSpotImageListView() {
  //   return ListView.builder(
  //     shrinkWrap: true,
  //     scrollDirection: Axis.horizontal,
  //     itemCount: spots.length,
  //     controller: _spotScrollController,
  //     itemBuilder: (context, index) {
  //       return buildSpotImageListItem(context, index);
  //     },
  //   );
  // }
  Widget buildSpotImageListView() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: homeImagesList.length,
      controller: _spotScrollController,
      itemBuilder: (context, index) {
        return buildSpotImageListItem(context, index);
      },
    );
  }

  // build spot image list item
  Widget buildSpotImageListItem(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: InkWell(
            onTap: () {
              print("List image selected $index");
              setState(() {
                currentSpotIndex = index;
                spotPageController.animateToPage(index,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.fastOutSlowIn);
              });
            },
            child: Container(
              width: currentSpotIndex == index ? 90 : 70,
              height: currentSpotIndex == index ? 90 : 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border(
                  top: BorderSide(
                    width: currentSpotIndex == index ? 2 : 0,
                    color: currentSpotIndex == index
                        ? orangeColor
                        : Colors.transparent,
                  ),
                  bottom: BorderSide(
                    width: currentSpotIndex == index ? 2 : 0,
                    color: currentSpotIndex == index
                        ? orangeColor
                        : Colors.transparent,
                  ),
                  left: BorderSide(
                    width: currentSpotIndex == index ? 2 : 0,
                    color: currentSpotIndex == index
                        ? orangeColor
                        : Colors.transparent,
                  ),
                  right: BorderSide(
                    width: currentSpotIndex == index ? 2 : 0,
                    color: currentSpotIndex == index
                        ? orangeColor
                        : Colors.transparent,
                  ),
                ),
                image: DecorationImage(
                    image: AssetImage(homeImagesList[index].image),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        )
      ],
    );
  }

  //spotzone body started from here

  Widget buildSpotzoneBody() {
    return buildSpotzonneBodyContent();
  }

  Widget buildTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // navigation menu icon
        buildNavMenuIcon(),
        // Spot
        buildSpot(),
        // spotzone

        buildSpotzone(),

        SELECTED_TAB == TAB_SPOT
            ? buildFilterActionItem()
            : buildAddActionItem(),
      ],
    );
  }

  Widget buildSpotzonneBodyContent() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // spot list(viewpager)

            Expanded(child: buildSpotZoneListview()),
            //buildSpotZoneImages(),

            // spot image list
            Container(
              height: 100,

              //flex: 1,
              child: buildSpotZoneImageListView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSpotZoneListview() {
    return PageView.builder(
      itemCount: homeImagesList.length,
      scrollDirection: Axis.horizontal,
      physics: AlwaysScrollableScrollPhysics(),
      onPageChanged: (value) {
        setState(() {
          currentSpotIndex = value;
        });
      },
      controller: spotPageController,
      itemBuilder: (context, index) {
        return buildSpotZoneImages(context, index);
      },
    );
  }

  Widget buildSpotZoneImageListView() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: homeImagesList.length,
      controller: _spotScrollController,
      itemBuilder: (context, index) {
        return buildSpotZoneImageListItem(context, index);
      },
    );
  }

  Widget buildSpotZoneImageListItem(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: InkWell(
            onTap: () {
              print("List image selected $index");
              setState(() {
                currentSpotIndex = index;
                spotPageController.animateToPage(index,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.fastOutSlowIn);
              });
            },
            child: Container(
              width: currentSpotIndex == index ? 90 : 70,
              height: currentSpotIndex == index ? 90 : 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border(
                  top: BorderSide(
                    width: currentSpotIndex == index ? 2 : 0,
                    color: currentSpotIndex == index
                        ? orangeColor
                        : Colors.transparent,
                  ),
                  bottom: BorderSide(
                    width: currentSpotIndex == index ? 2 : 0,
                    color: currentSpotIndex == index
                        ? orangeColor
                        : Colors.transparent,
                  ),
                  left: BorderSide(
                    width: currentSpotIndex == index ? 2 : 0,
                    color: currentSpotIndex == index
                        ? orangeColor
                        : Colors.transparent,
                  ),
                  right: BorderSide(
                    width: currentSpotIndex == index ? 2 : 0,
                    color: currentSpotIndex == index
                        ? orangeColor
                        : Colors.transparent,
                  ),
                ),
                image: DecorationImage(
                    image: AssetImage(homeImagesList[index].image),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildSpotZoneImages(BuildContext context, int index) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.65,
          child: Card(
            borderOnForeground: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            //elevation: 5,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // image
                InkWell(
                  onTap: () {
                    //print("page tap $index");
                    //navigateToProfileDetailPage(spots[index]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImagesSliderScreen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          // image: NetworkImage(
                          //   "assets/images/placeholder.jpg",
                          //   //spots[index].image,
                          // ),
                          image: AssetImage(homeImagesList[index].image),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),

                // card bottom contents
                Align(
                  alignment: FractionalOffset.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/music.svg',
                              width: 20,
                              height: 20,
                              color: orangeColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  //spots[index].name != null? spots[index].name : "",
                                  "Got ticked to Coldplay anyone fancy?",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato',
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),

                        // margin
                        SizedBox(
                          height: 15,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/date_range.svg',
                                  width: 12,
                                  height: 12,
                                  color: orangeColor,
                                ),
                                // margin
                                SizedBox(
                                  width: 8,
                                ),
                                // age
                                Text(
                                  "15th sept, tuesday",
                                  //"${spots[index].dob != null? DateUtils.getAgeFromDob(spots[index].dob) : 0} years",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ],
                            ),

                            // distance
                            Row(
                              children: [
                                // location arrow
                                SvgPicture.asset(
                                  'assets/images/location_arrow.svg',
                                  width: 12,
                                  height: 12,
                                  color: orangeColor,
                                ),
                                // margin
                                SizedBox(
                                  width: 4,
                                ),
                                // distance
                                Text(
                                  "2 km",
                                  // "${spots[index].longitude != null && spots[index].longitude != null?
                                  // LocationUtils.calculateDistance(spots[index].latitude, spots[index].longitude,
                                  //     latitude, longitude).toStringAsFixed(2) : 0} km",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 380),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: <Color>[
                      heartBackgroundColor1,
                      heartBackgroundColor2,
                      heartBackgroundColor3,
                      heartBackgroundColor4,
                      heartBackgroundColor5
                    ],
                    //stops: [0.1, 0.5],
                    begin: Alignment.topLeft),
              ),
              child: SvgPicture.asset(
                'assets/images/heart.svg',
                color: Colors.white,
                width: 40,
                height: 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  void navigateToProfileDetailPage(Profile profile) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProfileDetailPage(
                profile: profile,
                latitude: 100,
                longitude: 100,
              )),
    );
  }
}
