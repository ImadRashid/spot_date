
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:spot/pages/spot_requests_page.dart';
// import 'package:spotadate/screens/spot_zone_request_page.dart';
import 'package:spotadate/utils/colors.dart';

import '../home_page.dart';
import '../spot_requests_page.dart';

class NavRequestsPage extends StatefulWidget {

  NavRequestsPage({@required this.homeScaffold});

  final GlobalKey<ScaffoldState> homeScaffold;

  @override
  _NavRequestsPageState createState() => _NavRequestsPageState(homeScaffold: homeScaffold);
}

class _NavRequestsPageState extends State<NavRequestsPage> {

  _NavRequestsPageState({@required this.homeScaffold});

  final GlobalKey<ScaffoldState> homeScaffold;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int SELECTED_TAB = 0;

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
      child: DefaultTabController(
        length: 2,
        child: new Scaffold(
          key: _scaffoldKey,
          appBar: buildAppBar(),
          body: buildBody(),
        ),
      ),
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
          "Requests",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: greyTextColor),
        ),
      ),
      bottom:  TabBar(
        onTap: (index) {
          print("selected tab $index");
          setState(() {
            SELECTED_TAB = index;
          });
        },
        tabs: [
          buildSpotTab(),
          buildSpotzoneTab(),
        ],
        //indicatorColor: Colors.transparent,
        indicator: BoxDecoration(),
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

  // build action spot tab
  Widget buildSpotTab() {
    return Container(
      child: Column(
        children: [
          // text
          Text(
            "Spot",
            style: TextStyle(color:Colors.black,fontWeight: SELECTED_TAB == 0? FontWeight.w700 : FontWeight.w200),
          ),
          // margin
          SizedBox(height: 4,),
          // selected icon
          Icon(
            Icons.lens,
            color: SELECTED_TAB == 0? orangeColor: Colors.transparent,
            size: 12,
          ),
        ],
      ),
    );
  }

  // build action spotzone tab
  Widget buildSpotzoneTab() {
    return Container(
      child: Column(
        children: [
          // text
          Text(
            "Spotzone",
            style: TextStyle(color:Colors.black,fontWeight: SELECTED_TAB == 1? FontWeight.w700 : FontWeight.w200),
          ),
          // margin
          SizedBox(height: 4,),
          // selected icon
          Icon(
            Icons.lens,
            color: SELECTED_TAB == 1? orangeColor: Colors.transparent,
            size: 12,
          ),
        ],
      ),
    );
  }

  // build boyd contents
  Widget buildBody() {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        SpotRequestsPage(),
        HEllo(),
        // SpotZoneRequestsPage(),
      ],
    );
  }
}

class HEllo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

