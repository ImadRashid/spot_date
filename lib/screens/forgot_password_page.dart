






import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotadate/screens/token_page.dart';
// import 'package:spot/models/user.dart';
// import 'package:spot/network/api/spot_apis.dart';
// import 'package:spot/pages/token_page.dart';
import 'package:spotadate/utils/colors.dart';

class ResetPasswordPage extends StatefulWidget {

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isProgressEnabled = false;

  final _formKey = GlobalKey<FormState>();

  final _emailEditingController = TextEditingController();

  //SpotApis api = SpotApis();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: buildBody(),
    );
  }

  // build body
  // choose wheather show progress or body contents
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

              SizedBox(height: 16,),

              buildResendEmail()


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
      "Forget password for your account so we will send an email to you and send a 6-digit token to rest your password",
      style: TextStyle(fontSize: 12, fontFamily: 'Lato'),
      textAlign: TextAlign.center,
    );
  }

  // build form
  Widget buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email
          TextFormField(
            controller: _emailEditingController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              var reg = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
              if (value.isEmpty) {
                return "Email cannot be empty";
              }else if (!reg.hasMatch(value)){
                return "Input valid email address";
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
              hintText: "Email",
            ),
          ),
          // end Input field (Email)

          // margin
          SizedBox(height: 16,),

          // Login button
          SizedBox(
            width: 300,
            height: 40.0,
            child: MaterialButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    isProgressEnabled = true;
                  });
                  navigateToTokenPage();
                }
              },
              color: orangeColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "Send Email",
                style: TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: 'Lato'),
              ),
            ),
          ),
          // end login button
        ],
      ),
    );
  }
  Widget buildResendEmail() {
    return FlatButton(
      onPressed: () {
        //navigateToResetPasswordPage();
      },
      child: Text(
        "Resend email",
        style: TextStyle(fontSize: 14, color: orangeColor),
      ),
    );
  }

  void showSnackbar(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message),)));
  }

  // void resetPassword() {
  //   User user = User(email: _emailEditingController.text.toString());
  //   api.resetPassword(user).then((value) {
  //     setState(() {
  //       isProgressEnabled = false;
  //     });
  //     // navigate to token page
  //     navigateToTokenPage(_emailEditingController.text.toString(), value);
  //   }).catchError((error) {
  //     setState(() {
  //       isProgressEnabled = false;
  //     });
  //     showSnackbar(error.toString());
  //   });
  // }

  //navigate to token page
  // void navigateToTokenPage(String email, String message) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => TokenPage(message: message, email: email,)),
  //   );
  // }
  void navigateToTokenPage()
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TokenPage()),
    );
  }

}
