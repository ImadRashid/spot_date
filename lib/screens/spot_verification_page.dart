
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spotadate/components/date_confirmed_dialog.dart';
import 'package:spotadate/screens/spot_verification_request_page.dart';
import 'package:spotadate/utils/colors.dart';

import 'home_page.dart';

class SpotVerificationPage extends StatefulWidget {



  @override
  _SpotVerificationPageState createState() => _SpotVerificationPageState(
  );
}

class _SpotVerificationPageState extends State<SpotVerificationPage> {



  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isVerifyBtnEnabled = true;
  bool isDeclineBtnEnabled = true;

  //SpotApis api = SpotApis();

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
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: greyTextColor),
        ),
      ),
    );
  }

  // build body contents
  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          buildDescription(),
          SizedBox(height: 10,),
          Row(
            children: [
              buildImage1(),
              SizedBox(width: 10,),
              buildImage2(),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildVerifyBtn(),
              buildDeclineBtn(),
            ],
          ),
          SizedBox(height: 30,),
          buildRetakePicture(),
        ],
      ),
    );
  }

  // description
  Widget buildDescription() {
    return Text(
      "Does Steven Smith is selfie match the person in his profile picture?"
    );
  }

  // image 1
  Widget buildImage1() {
    return Expanded(
      flex: 1,
      child: Container(
        //width: (MediaQuery.of(context).size.width / 2.0) - 20,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image:AssetImage(
                "assets/ben.png",
            ),
          ),
        ),
      ),
    );
  }

  // image 2
  Widget buildImage2() {
    return Expanded(
      flex: 1,
      child: Container(
        //width: (MediaQuery.of(context).size.width / 2.0) - 20,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image:AssetImage(
              "assets/ben.png",
            ),
          ),
        ),
      ),
    );
  }

  // verify btn
  Widget buildVerifyBtn() {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: MaterialButton(
        onPressed:()
        {
          DateConfirmedDialog(
              context: context,
              onDismiss: () {
                navigateToHomePage();
              }
          ).show();

        },

        // isVerifyBtnEnabled? () {
        //   setState(() {
        //     isVerifyBtnEnabled = false;
        //   });
        //   approveSpotVerification();
        // } : null,
        color: orangeColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          "Verify",
          style: TextStyle(fontSize: 14.0, color: Colors.white, fontFamily: 'Lato', fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // build decline btn
  Widget buildDeclineBtn() {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: MaterialButton(
        onPressed: ()
        {

        },
        // isVerifyBtnEnabled? () {
        //   setState(() {
        //     isDeclineBtnEnabled = false;
        //   });
        //   declineRequest();
        // } : null,
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(width: 2, color: orangeColor),
        ),
        child: Text(
          "Decline",
          style: TextStyle(fontSize: 14.0, color: orangeColor, fontFamily: 'Lato', fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // build retake picture
  Widget buildRetakePicture() {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder:(context)=>SpotVerificationRequestPage(


          )));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.autorenew,
              color: orangeColor,
              size: 24,
            ),
            SizedBox(width: 10,),
            Text(
              "Retake picture",
              style: TextStyle(color: orangeColor),
            ),
          ],
        ),
      ),
    );
  }

  // approve spot verification
  void approveSpotVerification() {
    // api.approveSpotVerification(requestId, spotDateId, spotVerificationId, toId).then((value) {
    //   setState(() {
    //     isVerifyBtnEnabled = true;
    //   });
    //   showToast("verification approved");
    //   print(value.confirmed.toString());
    //   if (value.confirmed) {
    //     DateConfirmedDialog(
    //       context: context,
    //       onDismiss: () {
    //         navigateToHomePage();
    //       }
    //     ).show();
    //   }else {
    //     navigateToHomePage();
    //   }
    // }).catchError((error) {
    //   setState(() {
    //     isVerifyBtnEnabled = true;
    //   });
    //   showToast(error.toString());
    // });
  }

  // declined date request
  void declineRequest() {
    // api.declineSpotDateRequest(spotDateId, toId, requestId).then((value) {
    //   setState(() {
    //     isDeclineBtnEnabled = true;
    //   });
    //   showToast("Date Request declined");
    //   navigateToHomePage();
    // }).catchError((error) {
    //   setState(() {
    //     isDeclineBtnEnabled = true;
    //   });
    //   showToast(error.toString());
    // });
  }

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

  // Navigate to HomePage
  void navigateToHomePage() {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        HomePage()), (Route<dynamic> route) => false);
  }

  // show dialog
  void show() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Container(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCrossBtn(),
            SizedBox(height: 10,),
            buildDialogDescription(),
            SizedBox(height: 10,),
            buildLogo(),
          ],
        ),
      ),
    );
  }

  Widget buildCrossBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.clear,
            color: orangeColor,
            size: 16,
          ),
        ),
      ],
    );
  }

  // description
  Widget buildDialogDescription() {
    return Text(
      "Date Confirmed",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  // build logo
  Widget buildLogo() {
    return SvgPicture.asset(
      'assets/images/spot_logo.svg',
      width: 48,
      height: 48,
    );
  }
}
