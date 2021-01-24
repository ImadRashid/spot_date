import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:spotadate/models/user.dart';
import 'package:spotadate/screens/navigation/profile.dart';
import 'package:spotadate/ui/screens/upload_images/upload_image_screen.dart';
import 'package:spotadate/utils/colors.dart';
import '../edit_profile_page.dart';

class NavSettingsPage extends StatefulWidget {
  final name;
  final imgUrl;
  NavSettingsPage({@required this.homeScaffold, this.name, this.imgUrl});

  final GlobalKey<ScaffoldState> homeScaffold;

  @override
  _NavSettingsPageState createState() =>
      _NavSettingsPageState(homeScaffold: homeScaffold);
}

class _NavSettingsPageState extends State<NavSettingsPage> {
  _NavSettingsPageState({@required this.homeScaffold});

  final GlobalKey<ScaffoldState> homeScaffold;

  Profile profile;

  @override
  void initState() {
    super.initState();
    //getAuthUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, '/wrapper', (context) => false); //HomePage()
        // ); // Action to perform on back pressed
        return false;
      },
      child: Container(
        padding: EdgeInsets.only(top: 40, left: 16),
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    // return
    // StreamBuilder(
    // stream: userData,
    // builder: (context, snapshot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildActionBarWidgets(),
        buildProfileWidgets(),
        buildMenuWidgets(),
      ],
    );
    // }
    // );
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

  // build actionbar widgets
  Widget buildActionBarWidgets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildNavMenuIcon(),
        Text(
          "Settings",
          style: TextStyle(
              fontSize: 16, color: greyTextColor, fontWeight: FontWeight.bold),
        ),
        // empty container
        Container(),
      ],
    );
  }

  // profile image, name, edit profile button
  Widget buildProfileWidgets() {
    final user = Provider.of<User>(context);
    final userData = Firestore.instance
        .collection("userData")
        .document(user.uid)
        .snapshots();
    return StreamBuilder(
        stream: userData,
        builder: (context, snapshot) {
          return Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  // user image(circle)
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(snapshot.data['imgUrl']),
                        // (profile != null &&
                        //         profile.image != null &&
                        //         profile.image.isNotEmpty)
                        //     ? NetworkImage(profile.image)
                        //     : AssetImage('assets/ben.png'),
                      ),
                    ),
                  ),
                  // end user circle image
                  //
                  //

                  // margin
                  SizedBox(
                    height: 1,
                  ),

                  // name
                  Text(
                    snapshot.data['name'],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        color: Colors.black),
                  ),
                  // end name
                  //
                  //

                  // margin
                  SizedBox(
                    height: 8,
                  ),

                  // edit profile button
                  SizedBox(
                    width: 250,
                    child: FlatButton(
                      onPressed: () {
                        print("Edit profile pressed");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile(
                                    imgUrl: snapshot.data['imgUrl'],
                                    userId: user.uid,
                                    interests: snapshot.data['interests'],
                                    gender: snapshot.data['gender'],
                                    sexP: snapshot.data['sexualPreferences'],
                                  )),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: deepOrange,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: deepOrange),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // build menus
  Widget buildMenuWidgets() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 8, top: 36),
        child: Column(
          children: [
            // notifications
            InkWell(
              onTap: () {
                print("Notifications taped");
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/notifications.svg',
                    color: deepOrange,
                    width: 16,
                    height: 16,
                  ),
                  // margin
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(fontSize: 14, fontFamily: 'Lato'),
                  ),
                ],
              ),
            ),
            // end notifications
            //
            //

            // margin
            SizedBox(
              height: 24,
            ),

            // General
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.settings_input_svideo,
                    color: deepOrange,
                    size: 16,
                  ),
                  // margin
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    "General",
                    style: TextStyle(fontSize: 14, fontFamily: 'Lato'),
                  ),
                ],
              ),
            ),
            // end General
            //
            //

            // margin
            SizedBox(
              height: 24,
            ),

            // Account
            InkWell(
              onTap: () {
                print("Account taped");
              },
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: deepOrange,
                    size: 16,
                  ),
                  // margin
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    "Account",
                    style: TextStyle(fontSize: 14, fontFamily: 'Lato'),
                  ),
                ],
              ),
            ),
            // end Account
            //
            //

            // margin
            SizedBox(
              height: 24,
            ),

            // Gallery
            InkWell(
              onTap: () {
                print("Gallery taped");
                navigateToGalleryPage();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.image,
                    color: deepOrange,
                    size: 16,
                  ),
                  // margin
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(fontSize: 14, fontFamily: 'Lato'),
                  ),
                ],
              ),
            ),
            // end Gallery
            //
            //

            // margin
            SizedBox(
              height: 24,
            ),

            // Privacy
            InkWell(
              onTap: () {
                print("Privacy taped");
              },
              child: Row(
                children: [
                  Icon(
                    Icons.lock,
                    color: deepOrange,
                    size: 16,
                  ),
                  // margin
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    "Privacy",
                    style: TextStyle(fontSize: 14, fontFamily: 'Lato'),
                  ),
                ],
              ),
            ),
            // end Privacy
            //
            //

            // margin
            SizedBox(
              height: 24,
            ),

            // Block
            InkWell(
              onTap: () {
                print("Block taped");
              },
              child: Row(
                children: [
                  Icon(
                    Icons.block,
                    color: deepOrange,
                    size: 16,
                  ),
                  // margin
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    "Block",
                    style: TextStyle(fontSize: 14, fontFamily: 'Lato'),
                  ),
                ],
              ),
            ),
            // end block
            //
            //

            // margin
            SizedBox(
              height: 24,
            ),

            // Help
            InkWell(
              onTap: () {
                print("Help taped");
              },
              child: Row(
                children: [
                  Icon(
                    Icons.help,
                    color: deepOrange,
                    size: 16,
                  ),
                  // margin
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    "Help",
                    style: TextStyle(fontSize: 14, fontFamily: 'Lato'),
                  ),
                ],
              ),
            ),
            // end Help
            //
            //
          ],
        ),
      ),
    );
  }

  // get auth user and assign to global variable user
  // void getAuthUser() {
  //   api.getUser().then((value) {
  //     print(value.toString());
  //     setState(() {
  //       this.profile = value.profile;
  //     });
  //   }).catchError((error) {
  //     showSnackbar(error.toString());
  //   });
  // }

  // void navigateToEditProfilePage() {

  // }

  void navigateToGalleryPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UploadImageScreen()));
  }

  // show snackbar
  void showSnackbar(String message) {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => homeScaffold.currentState.showSnackBar(SnackBar(
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
}
