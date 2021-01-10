import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spotadate/screens/spot_verification_page.dart';

//import 'package:spot/network/api/spot_apis.dart';
import 'package:spotadate/utils/colors.dart';

//import 'home_page.dart';

class SpotVerificationRequestPage extends StatefulWidget {
  // SpotVerificationRequestPage();

  // int toId;
  // int spotDateId;

  @override
  _SpotVerificationRequestPageState createState() =>
      _SpotVerificationRequestPageState();
}

class _SpotVerificationRequestPageState
    extends State<SpotVerificationRequestPage> {
  // _SpotVerificationRequestPageState({@required this.spotDateId, @required this.toId});
  //
  // int toId;
  // int spotDateId;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  File imageFile;

  bool isVerifyBtnEnabled = true;

  //SpotApis api = new SpotApis();

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
          "Spot Verification",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: greyTextColor),
        ),
      ),
    );
  }

  // build body contents
  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          buildCameraWidget(),
          SizedBox(
            height: 10,
          ),
          buildDescription(),
          SizedBox(
            height: 10,
          ),
          buildVerifyBtn(),
        ],
      ),
    );
  }

  // build camera widget
  Widget buildCameraWidget() {
    return imageFile == null
        ? Expanded(
            child: InkWell(
              onTap: () {
                // pick image from camera
                getImage();
              },
              child: Stack(
                children: [
                  Container(
                    color: Colors.grey[200],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey[800],
                      size: 100,
                    ),
                  ),
                ],
              ),
            ),
          )
        : Expanded(
            child: Image.file(
              imageFile,
            ),
          );
  }

  // description
  Widget buildDescription() {
    return Text(
      "Pease upload a picture of yourself from the frot camera for verification",
      style: TextStyle(color: greyTextColor),
    );
  }

  // verify button
  Widget buildVerifyBtn() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SpotVerificationPage()));
          },
          color: orangeColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            "Verify",
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

  // pick image from camera
  Future getImage() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );

    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  // // upload image
  // void uploadImage() {
  //   api.uploadImage(imageFile.path).then((value) {
  //     sendVerificationRequest(value);
  //   }).catchError((error) {
  //     setState(() {
  //       isVerifyBtnEnabled = true;
  //     });
  //     showSnackbar(error.toString());
  //   });
  // }

  // send spot verification request
  // void sendVerificationRequest(String imageUrl) {
  //   api.sendSpotVerificationRquest(imageUrl, spotDateId, toId).then((value) {
  //     setState(() {
  //       isVerifyBtnEnabled = true;
  //     });
  //     showToast("Verification request send");
  //     navigateToHomePage();
  //   }).catchError((error) {
  //     setState(() {
  //       isVerifyBtnEnabled = true;
  //     });
  //     showSnackbar(error.toString());
  //   });
  // }

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

// // Navigate to HomePage
// void navigateToHomePage() {
//   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
//       HomePage()), (Route<dynamic> route) => false);
// }
}
