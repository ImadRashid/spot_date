
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotadate/models/home_images_model.dart';
import 'package:spotadate/models/spot_filter.dart';
import 'package:spotadate/utils/colors.dart';

import 'nav_home_page.dart';

class NavBookmarksPage extends StatefulWidget {

  NavBookmarksPage({this.homeScaffold});

  final GlobalKey<ScaffoldState> homeScaffold;

  @override
  _NavBookmarksPageState createState() => _NavBookmarksPageState(homeScaffold: homeScaffold);
}

class _NavBookmarksPageState extends State<NavBookmarksPage> {

  _NavBookmarksPageState({this.homeScaffold});

  final GlobalKey<ScaffoldState> homeScaffold;
  int currentSpotIndex = 0;

 // List<String> spots = ['assets/ben.png','assets/man.png','assets/ben.png','assets/man.png','assets/ben.png','assets/man.png'];

  PageController spotPageController = PageController(viewportFraction: 0.99999,);
  StreamController<SpotFilter> spotFilterController = StreamController<SpotFilter>();
  ScrollController _spotScrollController = ScrollController();
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:buildAppBar() ,
      body:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // spot list(viewpager)

              Expanded(
                //flex: 6,
                child: buildSpotListview(),
              ),

              // spot image list
              Container(
                height: 100,
                //flex: 1,
                child:buildSpotImageListView(),
              ),
            ],
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

  Widget buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: buildNavMenuIcon(),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 20),
          child: SvgPicture.asset(
            "assets/images/filter.svg",
            width: 20,
            height: 20,
            color: orangeColor,
          ),
        ),
      ],

      title: Center(
        child: Text(
          "Bookmarks",
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

  Widget buildBookmarksBody()
  {
    return Container(
      child: Text("hello"),
    );
  }

  Widget buildSpotImages(BuildContext context, int index) {
    return Expanded(
      //flex: 6,
      //       child: Center(
      //     child: Container(child: Text("hello",style: TextStyle(fontSize: 35),),),
      // ),

      child: Container(
        margin: EdgeInsets.only(left: 15,right: 15),
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
                        //print("page tap $index");
                        //navigateToProfileDetailPage(spots[index]);
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
  Widget buildSpotImageListView() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount:  homeImagesList.length,
     // physics: AlwaysScrollableScrollPhysics(),
      controller: _spotScrollController,
      itemBuilder: (context, index) {
        return buildSpotImageListItem(context, index);
      },
    );
  }
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
                spotPageController.animateToPage(index, duration: Duration(milliseconds: 1), curve: Curves.fastOutSlowIn);
              });
            },
            child: Container(
              width: currentSpotIndex == index? 90 : 70,
              height: currentSpotIndex == index? 90: 70,
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                border: Border(
                  top: BorderSide(
                    width: currentSpotIndex == index? 2 : 0,
                    color: currentSpotIndex == index? orangeColor: Colors.transparent,
                  ),
                  bottom: BorderSide(
                    width: currentSpotIndex == index? 2 : 0,
                    color: currentSpotIndex == index? orangeColor: Colors.transparent,
                  ),
                  left: BorderSide(
                    width: currentSpotIndex == index? 2 : 0,
                    color: currentSpotIndex == index? orangeColor: Colors.transparent,
                  ),
                  right: BorderSide(
                    width: currentSpotIndex == index? 2 : 0,
                    color: currentSpotIndex == index? orangeColor: Colors.transparent,
                  ),
                ),
                image: DecorationImage(
                    image:  AssetImage(homeImagesList[index].image),
                    fit: BoxFit.cover
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
