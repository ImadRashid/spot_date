import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'package:spot/models/user.dart';
// import 'package:spot/network/api/spot_apis.dart';
import 'package:spotadate/screens/login_page.dart';
import 'package:spotadate/utils/colors.dart';

class UpdatePasswordPage extends StatefulWidget {
  UpdatePasswordPage();

  String email = "";

  @override
  _UpdatePasswordPageState createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  _UpdatePasswordPageState();

  String email = "";

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  final _passwordEditingController = TextEditingController();
  final _confirmPasswordEditingController = TextEditingController();

  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  bool isProgressEnabled = false;

  bool showPassword1 = false;
  bool showPassword2 = false;

  String password1 = "";
  String password2 = "";

  //SpotApis api = SpotApis();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: buildBody(),
    );
  }

  // build body
  // if progress enabled then show progress only
  // otherwise show body contents
  Widget buildBody() {
    return isProgressEnabled ? buildProgressBar() : buildBodyContent();
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
              SizedBox(
                height: 40,
              ),
              // description
              buildDescription(),
              // margin
              SizedBox(
                height: 60,
              ),
              // form
              buildForm(),
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
      "Create a strong new password for your spot8date account and login again",
      style: TextStyle(fontSize: 12, fontFamily: 'Lato'),
      textAlign: TextAlign.center,
    );
  }

  Widget buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Password
          TextFormField(
            controller: _passwordEditingController,
            focusNode: _passwordFocusNode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            obscureText: !this.showPassword1,
            onFieldSubmitted: (v) {
              FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
            },
            validator: (value) {
              String pattern =
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
              RegExp regExp = new RegExp(pattern);
              if (value.isEmpty) {
                return "Password cannot be empty";
              } else if (!regExp.hasMatch(value)) {
                return "Invalid password";
              } else {
                return null;
              }
            },
            onChanged: (value) {
              setState(() {
                password1 = value;
              });
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
              hintText: "Password",
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: !this.showPassword1 ? Colors.grey : orangeColor,
                ),
                onPressed: () {
                  setState(() => this.showPassword1 = !this.showPassword1);
                },
              ),
            ),
          ),
          // end Input field (Password)

          // margin
          SizedBox(
            height: 8,
          ),

          // Password Confirm
          TextFormField(
            controller: _confirmPasswordEditingController,
            focusNode: _confirmPasswordFocusNode,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            obscureText: !this.showPassword2,
            validator: (value) {
              String pattern =
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
              RegExp regExp = new RegExp(pattern);
              if (value.isEmpty) {
                return "Password cannot be empty";
              } else if (!regExp.hasMatch(value)) {
                return "Invalid password";
              } else {
                return null;
              }
            },
            onChanged: (value) {
              setState(() {
                password2 = value;
              });
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
              hintText: "Confirm Password",
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: !this.showPassword2 ? Colors.grey : orangeColor,
                ),
                onPressed: () {
                  setState(() => this.showPassword2 = !this.showPassword2);
                },
              ),
            ),
          ),
          // end Input field (Password confirm)

          // margin
          SizedBox(
            height: 8,
          ),

          // password stregnth checker
          buildPasswordStrengthChecker(),

          // margin
          SizedBox(
            height: 16,
          ),

          // password tooltip
          buildPasswordTooltips(),

          // margin
          SizedBox(
            height: 16,
          ),

          // Change Password button
          SizedBox(
            width: 300,
            height: 40.0,
            child: MaterialButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  if (password1 == password2) {
                    setState(() {
                      isProgressEnabled = true;
                    });
                    navigateToLoginPage();
                    //updatePassword();
                  } else {
                    showSnackbar("Password did not match");
                  }
                }
              },
              color: orangeColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "Change password",
                style: TextStyle(
                    fontSize: 14.0, color: Colors.white, fontFamily: 'Lato'),
              ),
            ),
          ),
          // end Signup button
        ],
      ),
    );
  }

  // Password tooltips
  Widget buildPasswordTooltips() {
    return Column(
      children: [
        Row(
          children: [
            MyBullet(),
            SizedBox(
              width: 8,
            ),
            Text(
              "Uppercase and lowercase letters",
              style: TextStyle(color: Colors.black87, fontSize: 12),
            ),
          ],
        ),

        // margin
        SizedBox(
          height: 4,
        ),

        Row(
          children: [
            MyBullet(),
            SizedBox(
              width: 8,
            ),
            Text(
              "More than 8 characters",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
              ),
            ),
          ],
        ),

        // margin
        SizedBox(
          height: 4,
        ),

        Row(
          children: [
            MyBullet(),
            SizedBox(
              width: 8,
            ),
            Text(
              "Contains a character or symbol",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // build password progress checker
  Widget buildPasswordStrengthChecker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            width: 100,
            height: 6,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(passwordProgressColor),
              value: getPasswordConditionCount(password2) >= 1 ? 100 : 0,
            ),
          ),
        ),

        // margin
        SizedBox(
          width: 8,
        ),

        Expanded(
          child: Container(
            width: 100,
            height: 6,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(passwordProgressColor),
              value: getPasswordConditionCount(password2) >= 2 ? 100 : 0,
            ),
          ),
        ),

        // margin
        SizedBox(
          width: 8,
        ),

        Expanded(
          child: Container(
            width: 100,
            height: 6,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(passwordProgressColor),
              value: getPasswordConditionCount(password2) == 3 ? 100 : 0,
            ),
          ),
        ),
      ],
    );
  }

  // check password condition counting
  int getPasswordConditionCount(String p) {
    int count = 0;
    if (p.contains(RegExp(r'[0-9]'))) {
      count++;
    }
    if (p.contains(RegExp(r'(?=.*[!@#$%^&*])(?=.*?[A-Z])'))) {
      count++;
    }
    if (p.length >= 8) {
      count++;
    }

    print(count.toString());

    return count;
  }

  // api calls update password
  // void updatePassword() {
  //   User user = User(email: this.email, password: _passwordEditingController.text.toString());
  //   api.updatePassword(user).then((value) {
  //     setState(() {
  //       isProgressEnabled = false;
  //     });
  //     showToast(value);
  //     // navigate to login page
  //     navigateToLoginPage();
  //   }).catchError((error) {
  //     setState(() {
  //       isProgressEnabled = false;
  //     });
  //     showSnackbar(error.toString());
  //   });
  // }

  void navigateToLoginPage()
  {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LoginPage()));

  }

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

// Navigate to LoginPage
// void navigateToLoginPage() {
//   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
//       LoginPage()), (Route<dynamic> route) => false);
// }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 8.0,
      width: 8.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
