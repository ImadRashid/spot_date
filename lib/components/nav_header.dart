
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:spot/models/user.dart';
// import 'package:spot/network/api/spot_apis.dart';
import 'package:spotadate/utils/colors.dart';
import 'package:spotadate/utils/date_utils.dart';
import 'package:spotadate/utils/strings.dart';

class NavHeader extends StatefulWidget {

  NavHeader({@required this.context, @required this.homeScaffold});

  BuildContext context;
  final GlobalKey<ScaffoldState> homeScaffold;

  @override
  _NavHeaderState createState() => _NavHeaderState(context: context, homeScaffold: homeScaffold);
}

class _NavHeaderState extends State<NavHeader> {

  _NavHeaderState({@required this.context, @required this.homeScaffold});

  BuildContext context;
  final GlobalKey<ScaffoldState> homeScaffold;

  // SpotApis api = SpotApis();
  // User user;

  @override
  void initState() {
    super.initState();
    //getAuthUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDrawerIcon(),
          // user image(circle)
          buildUserImage(),
          // margin
          SizedBox(height: 16,),
          // name
          buildUserName(),
          // margin
          SizedBox(height: 8,),
          // Row(female icon, age, location)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // female icon if user is female
              buildFemaleIcon(),
              // margin
              SizedBox(width: 8,),
              // age
              buildAge(),
              // margin
              SizedBox(width: 16,),
              // location arrow if location exists
              buildLocationArrow(),
              // margin
              SizedBox(width: 4,),
              // address
              buildAddress(),
            ],
          ),

        ],
      ),
    );
  }

  // build drawer icon
  Widget buildDrawerIcon() {
    return // drawer icon for close
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              if (homeScaffold.currentState.isDrawerOpen) {
                Navigator.pop(context);
              }
            },
            child: Icon(
              Icons.menu,
              color: orangeColor,
              size: 24,
            ),
          ),
        ],
      );
  }

  // build user image (cirlce)
  Widget buildUserImage() {
    return InkWell(
      onTap: () async {
        print("Drawer image taped");
        // if (user != null && user.profile != null) {
        //   final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
        //   if (pickedFile.path != null) {
        //     api.uploadImage(pickedFile.path).then((value) {
        //       setState(() {
        //         user.profile.image = value;
        //       });
        //       api.updateProfile(user.profile);
        //     }).catchError((error) {
        //       print(error.toString());
        //       showSnackbar(error.toString());
        //     });
        //   }
        // }else {
        //   showSnackbar("Please create your profile first");
        // }
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image:AssetImage('assets/ben.png'),

          )
          // image: DecorationImage(
          //   fit: BoxFit.cover,
          //   image: (user != null && user.profile != null && user.profile.image != null && user.profile.image.isNotEmpty)?
          //   // NetworkImage(
          //   //   user.profile.image,
          //   // ):

          //   AssetImage('assets/images/placeholder.jpg'),
          // ),
        ),
      ),
    );
  }

  // build user name
  Widget buildUserName() {
    return Text(
      "Ben Parker",
      //(user != null && user.profile != null && user.profile.image != null)? user.profile.name : "",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
    );
  }

  // build female icon
  Widget buildFemaleIcon() {
    return SvgPicture.asset(
      // (user != null && user.profile != null && user.profile.gender != null
      //     && user.profile.gender == GENDER_FEMALE)?
      "assets/images/female.svg",
      width: 12,
      height: 12,
      // width: (user != null && user.profile != null && user.profile.gender != null
      //     && user.profile.gender == GENDER_FEMALE)? 12 : 0,
      // height: (user != null && user.profile != null && user.profile.gender != null
      //     && user.profile.gender == GENDER_FEMALE)? 12 : 0,
      color: orangeColor,
    );
  }

  // build age
  Widget buildAge() {
    return Text(
      // (user != null && user.profile != null && user.profile.dob != null)?
      // DateUtils.getAgeFromDob(user.profile.dob).toString(): "",
      "22",
      style: TextStyle(fontSize: 12,),
    );
  }

  // build location icon(Arrow)
  Widget buildLocationArrow() {
    return SvgPicture.asset(
      //(user != null && user.profile != null && user.profile.latitude != null)?
      "assets/images/location_arrow.svg",
      width: 12,
      height: 12,
      color: orangeColor,
    );
  }

  // build address
  Widget buildAddress() {
    return Expanded(
      child: Text(
        // (user != null && user.profile != null && user.profile.address != null)?
        // user.profile.address: "",
        "London, England",
        style: TextStyle(fontSize: 12,),
      ),
    );
  }

  // get auth user and assign to global variable user
  // void getAuthUser() {
  //   api.getUser().then((value) {
  //     print(value.toString());
  //     setState(() {
  //       this.user = value;
  //     });
  //     print(user.email);
  //   }).catchError((error) {
  //     showSnackbar(error.toString());
  //   });
  // }

  // show snackbar
  void showSnackbar(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        homeScaffold.currentState.showSnackBar(SnackBar(content: Text(message),)));
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
