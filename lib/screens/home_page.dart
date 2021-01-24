import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:provider/provider.dart';
import 'package:spotadate/components/nav_header.dart';
import 'package:spotadate/components/nav_item.dart';
import 'package:spotadate/models/user.dart';
import 'package:spotadate/screens/authentication/login_page.dart';
import 'package:spotadate/screens/navigation/nav_requests_page.dart';
import 'package:spotadate/screens/navigation/nav_settings_page.dart';
import 'package:spotadate/services/auth.dart';

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
  final AuthService _auth = AuthService();
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

  List<Widget> navPages() {
    return [
      NavHomePage(
        homeScaffold: _scaffoldKey,
      ),
      NavNotificationsPage(
        homeScaffold: _scaffoldKey,
      ),
      NavRequestsPage(
        homeScaffold: _scaffoldKey,
      ),
      NavDataCalendarPage(
        homeScaffold: _scaffoldKey,
      ),
      MessagesScreen(
        homeScaffold: _scaffoldKey,
      ),
      NavBookmarksPage(
        homeScaffold: _scaffoldKey,
      ),
      NavSettingsPage(
        homeScaffold: _scaffoldKey,
      ),
    ];
  }

// open nav drawer
  void openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  // build navigation drawer
  Widget buildNavigationDrawer() {
    final user = Provider.of<User>(context);
    final userData = Firestore.instance
        .collection("userData")
        .document(user.uid)
        .snapshots();
    return Container(
      width: 250,
      child: Drawer(
        child: Container(
          padding: EdgeInsets.only(left: 24, right: 16, top: 40, bottom: 24),
          child: Column(
            children: [
              // navigation header
              StreamBuilder(
                  stream: userData,
                  builder: (context, snapshot) {
                    return NavHeader(
                      context: context,
                      homeScaffold: _scaffoldKey,
                      imgUrl: snapshot.data['imgUrl'],
                      age: snapshot.data['age'],
                      gender: snapshot.data['gender'],
                      address: snapshot.data['address'],
                      name: snapshot.data['name'],
                    );
                  }),
              // margin
              SizedBox(
                height: 40,
              ),
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
          buildNavItem(
            title: "Home",
            imgPath: "assets/images/home.svg",
            index: 0,
          ),
          // margin
          SizedBox(
            height: 8,
          ),
          // Notifications
          // buildNotificationsItem(),
          buildNavItem(
              title: "Notifications",
              imgPath: "assets/images/notifications.svg",
              index: 1),
          // margin
          SizedBox(
            height: 8,
          ),
          // Requests
          buildNavItem(
              title: "Requests",
              imgPath: "assets/images/add_person.svg",
              index: 2),
          // margin
          SizedBox(
            height: 8,
          ),
          // Date calender
          // buildDateCalendarItem(),
          buildNavItem(
              title: "Date Calendar",
              imgPath: "assets/images/date_range.svg",
              index: 3),

          // margin
          SizedBox(
            height: 8,
          ),
          // Messages
          // buildMessagesItem(),
          buildNavItem(
              title: "Messages",
              imgPath: "assets/images/chatboxes.svg",
              index: 4),

          // margin
          SizedBox(
            height: 8,
          ),
          // Bookmarks
          // buildBookmarksItem(),
          buildNavItem(
              title: "Bookmarks",
              imgPath: "assets/images/bookmarks.svg",
              index: 5),

          // spacer
          Spacer(),
          // Settings
          // buildSettingsItem(),
          buildNavItem(
              title: "Settings",
              imgPath: "assets/images/settings.svg",
              index: 6),

          // margin
          SizedBox(
            height: 8,
          ),
          // Logout
          // buildLogoutItem(),
          buildNavItem(
              title: "Logout", imgPath: "assets/images/logout.svg", index: 7),
        ],
      ),
    );
  }

  // build nav home item
  Widget buildNavItem({String title, String imgPath, int index}) {
    return NavItem(
      onPressed: () {
        print("$title taped");
        if (index != 7) {
          setState(() {
            navSelectedIndex = index;
          });
        } else {
          logout();
        }
        closeDrawer();
      },
      title: title,
      imgPath: imgPath,
      fontWeight: navSelectedIndex == index ? FontWeight.w700 : FontWeight.w400,
    );
  }

  void closeDrawer() {
    if (_scaffoldKey.currentState.isDrawerOpen) {
      Navigator.pop(context);
    }
  }

  // logout
  void logout() {
    _auth.signOut();
    // Navigator.pushNamedAndRemoveUntil(context, '/wrapper', (context) => false);
    // PrefUtils.saveToken(null);
    // Navigator.p(context, MaterialPageRoute(builder:(context)=>LoginPage()));
  }
}
