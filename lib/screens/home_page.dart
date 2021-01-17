
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:spotadate/components/nav_header.dart';
import 'package:spotadate/components/nav_item.dart';
import 'package:spotadate/screens/login_page.dart';
import 'package:spotadate/screens/navigation/nav_requests_page.dart';
import 'package:spotadate/screens/navigation/nav_settings_page.dart';

import 'navigation/nav_bookmarks_page.dart';
import 'navigation/nav_data_calendar_page.dart';
import 'navigation/nav_home_page.dart';
import 'navigation/nav_messages_page.dart';
import 'navigation/nav_notifications_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext context;
  int navSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    YYDialog.init(context);
    this.context = context;

    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: buildNavigationDrawer(),
        body: navPages()[navSelectedIndex],



    );
  }
  List<Widget> navPages () {
    return [
      NavHomePage(homeScaffold: _scaffoldKey,),
      NavNotificationsPage(homeScaffold: _scaffoldKey,),
      NavRequestsPage(homeScaffold: _scaffoldKey,),
      NavDataCalendarPage(homeScaffold: _scaffoldKey,),
      MessagesScreen(homeScaffold: _scaffoldKey,),
      NavBookmarksPage(homeScaffold: _scaffoldKey,),
      NavSettingsPage(homeScaffold: _scaffoldKey,),

    ];
  }
// open nav drawer
  void openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }
  // build navigation drawer
  Widget buildNavigationDrawer() {
    return Container(
      width: 250,
      child: Drawer(
        child: Container(
          padding: EdgeInsets.only(left: 24, right: 16, top: 40, bottom: 24),
          child: Column(
            children: [
              // navigation header
              NavHeader(context: context, homeScaffold: _scaffoldKey),
              // margin
              SizedBox(height: 40,),
              // navigation drawer menu
              buildNavigationMenu(),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildNavigationMenu() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Home
          buildHomeItem(),
          // margin
          SizedBox(height: 8,),
          // Notifications
          buildNotificationsItem(),
          // margin
          SizedBox(height: 8,),
          // Requests
          buildRequestsItem(),
          // margin
          SizedBox(height: 8,),
          // Date calender
          buildDateCalendarItem(),
          // margin
          SizedBox(height: 8,),
          // Messages
          buildMessagesItem(),
          // margin
          SizedBox(height: 8,),
          // Bookmarks
          buildBookmarksItem(),
          // spacer
          Spacer(),
          // Settings
          buildSettingsItem(),
          // margin
          SizedBox(height: 8,),
          // Logout
          buildLogoutItem(),
        ],
      ),
    );
  }

  // build nav home item
  Widget buildHomeItem() {
    return NavItem(
      onPressed: () {
        print("Home taped");
        setState(() {
          navSelectedIndex = 0;
        });
        closeDrawer();
      },
      title: "Home",
      imgPath: "assets/images/home.svg",
      fontWeight: navSelectedIndex == 0? FontWeight.w700 : FontWeight.w400,
    );
  }

  // build nav notification item
  Widget buildNotificationsItem() {
    return NavItem(
      onPressed: () {
        print("Notifications taped");
        setState(() {
          navSelectedIndex = 1;
        });
        closeDrawer();
      },
      title: "Notifications",
      imgPath: "assets/images/notifications.svg",
      fontWeight: navSelectedIndex == 1? FontWeight.w700 : FontWeight.w400,
    );
  }

  // build nav requests item
  Widget buildRequestsItem() {
    return NavItem(
      onPressed: () {
        print("Requests taped");
        setState(() {
          navSelectedIndex = 2;
        });
        closeDrawer();
      },
      title: "Requests",
      imgPath: "assets/images/add_person.svg",
      fontWeight: navSelectedIndex == 2? FontWeight.w700 : FontWeight.w400,
    );
  }

  // build nav date calendar item
  Widget buildDateCalendarItem() {
    return NavItem(
      onPressed: () {
        print("Date Calendar taped");
        setState(() {
          navSelectedIndex = 3;
        });
        closeDrawer();
      },
      title: "Date Calendar",
      imgPath: "assets/images/date_range.svg",
      fontWeight: navSelectedIndex == 3? FontWeight.w700 : FontWeight.w400,
    );
  }


  // build nav messages item
  Widget buildMessagesItem() {
    return NavItem(
      onPressed: () {
        print("Messages taped");
        setState(() {
          navSelectedIndex = 4;
        });
        closeDrawer();
      },
      title: "Messages",
      imgPath: "assets/images/chatboxes.svg",
      fontWeight: navSelectedIndex == 4? FontWeight.w700 : FontWeight.w400,
    );
  }

  // build nav Bookmarks item
  Widget buildBookmarksItem() {
    return NavItem(
      onPressed: () {
        print("Bookmarks taped");
        setState(() {
          navSelectedIndex = 5;
        });
        closeDrawer();
      },
      title: "Bookmarks",
      imgPath: "assets/images/bookmarks.svg",
      fontWeight: navSelectedIndex == 5? FontWeight.w700 : FontWeight.w400,
    );
  }

  // build nav Settings item
  Widget buildSettingsItem() {
    return NavItem(
      onPressed: () {
        print("Settings taped");
        setState(() {
          navSelectedIndex = 6;
        });
        closeDrawer();
      },
      title: "Settings",
      imgPath: "assets/images/settings.svg",
      fontWeight: navSelectedIndex == 6? FontWeight.w700 : FontWeight.w400,
    );
  }
  Widget buildLogoutItem() {
    return NavItem(
      onPressed: () {
        print("Logout taped");
        closeDrawer();
        logout();
      },
      title: "Logout",
      imgPath: "assets/images/logout.svg",
      fontWeight: navSelectedIndex == 7? FontWeight.w700 : FontWeight.w400,
    );
  }
  // close drawer
  void closeDrawer() {
    if (_scaffoldKey.currentState.isDrawerOpen) {
      Navigator.pop(context);
    }
  }
  // logout
  void logout() {
    // PrefUtils.saveToken(null);
    Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginPage( )));
  }
}
