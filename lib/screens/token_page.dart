
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:spot/models/user.dart';
// import 'package:spot/network/api/spot_apis.dart';
import 'package:spotadate/screens/update_password_page.dart';
import 'package:spotadate/utils/colors.dart';

class TokenPage extends StatefulWidget {

  TokenPage();

  String message = "";
  String email = "";

  @override
  _TokenPageState createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {

  _TokenPageState();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isProgressEnabled = false;

  final _formKey = GlobalKey<FormState>();
  final _tokenEditingController = TextEditingController();

  String message = "";
  String email = "";

  //SpotApis api = SpotApis();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: buildBody(),
    );
  }

  // build body
  // chose show progress or body contents
  Widget buildBody() {
    return isProgressEnabled? buildProgressBar() : buildBodyContent();
  }

  // build progress bar in center
  Widget buildProgressBar() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(orangeColor),
      ),
    );
  }

  // build body contents
  Widget buildBodyContent() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              buildLogo(),
              // margin
              SizedBox(height: 40,),
              // description
              buildDescription(),
              // margin
              SizedBox(height: 60,),
              // form
              buildForm(),
              // margin
              SizedBox(height: 8,),
              // resend code
              buildResendCodeBtn(),
            ],
          ),
        ),
      ),
    );
  }

  // Logo
  Widget buildLogo() {
    return SvgPicture.asset(
      "assets/images/spot_new_logo.svg",
      width: 100,
    );
  }

  // Description
  Widget buildDescription() {
    return Text(
      this.message,
      style: TextStyle(fontSize: 12, fontFamily: 'Lato',),
      textAlign: TextAlign.center,
    );
  }

  // build Form
  Widget buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Email
          TextFormField(
            controller: _tokenEditingController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value.isEmpty) {
                return "Token cannot be empty";
              }else {
                return null;
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(4),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: orangeColor, width: 2.0),
                borderRadius: BorderRadius.circular(4),
              ),
              hintText: "6-digit token",
            ),
          ),
          // end Input field (Email)

          // margin
          SizedBox(height: 8,),

          // Submit button
          SizedBox(
            width: 300,
            height: 40.0,
            child: MaterialButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    isProgressEnabled = true;
                  });
                  navigateToUpdatePasswordPage();
                  //submit();
                }
              },
              color: orangeColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "Submit",
                style: TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: 'Lato'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // build resend code button
  Widget buildResendCodeBtn() {
    return FlatButton(
      onPressed: () {
        setState(() {
          isProgressEnabled = true;
        });
        //resendCode();
      },
      child: Text(
        "Resend Code",
        style: TextStyle(color: orangeColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  // verify token
  // void submit() {
  //   User user = User(email: this.email, token: _tokenEditingController.text.toString());
  //   api.verifyToken(user).then((value) {
  //     setState(() {
  //       isProgressEnabled = false;
  //     });
  //     // token verified
  //     // navigate to
  //     navigateToUpdatePasswordPage();
  //   }).catchError((error) {
  //     setState(() {
  //       isProgressEnabled = false;
  //     });
  //     // show error message
  //     showSnackbar(error.toString());
  //   });
  // }

  // resend token
  // void resendCode() {
  //   User user = User(email: this.email);
  //   api.resetPassword(user).then((value) {
  //     setState(() {
  //       isProgressEnabled = false;
  //     });
  //     showToast("Token resend successfully");
  //   }).catchError((error) {
  //     setState(() {
  //       isProgressEnabled = false;
  //     });
  //     showSnackbar(error.toString());
  //   });
  // }

  // navigate to update Password
  // void navigateToUpdatePasswordPage() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => UpdatePasswordPage(email: this.email,)),
  //   );
  // }
  void navigateToUpdatePasswordPage(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdatePasswordPage()),
    );

  }

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
