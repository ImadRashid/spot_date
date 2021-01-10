
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spotadate/screens/navigation/profile.dart';
//import 'package:spot/network/api/spot_apis.dart';
import 'package:spotadate/utils/colors.dart';

class GalleryPage extends StatefulWidget {

  GalleryPage({@required this.profile});

  Profile profile;

  @override
  _GalleryPageState createState() => _GalleryPageState(profile: profile);
}

class _GalleryPageState extends State<GalleryPage> {

  _GalleryPageState({@required this.profile});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Profile profile;

  //SpotApis api = SpotApis();

  List<Gallery> gallery = List();
  String image1;
  String image2;
  String image3;
  String image4;

  @override
  void initState() {
    super.initState();
    if (profile != null) {
      if (profile.gallery.length == 1) {
        image1 = profile.gallery[0].image;
      }else if (profile.gallery.length == 2) {
        image1 = profile.gallery[0].image;
        image2 = profile.gallery[1].image;
      }else if (profile.gallery.length == 3) {
        image1 = profile.gallery[0].image;
        image2 = profile.gallery[1].image;
        image3 = profile.gallery[2].image;
      }else if (profile.gallery.length == 4) {
        image1 = profile.gallery[0].image;
        image2 = profile.gallery[1].image;
        image3 = profile.gallery[2].image;
        image4 = profile.gallery[3].image;
      }
    }else {
      showToast("Please create your profile first");
      Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 16, right: 16,),
      child: Column(
        children: [
          buildActionItems(),
          buildGalleryContainer(),
        ],
      ),
    );
  }

  Widget buildActionItems() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildBackBtn(),
          buildActionTitle(),
          Container(),
        ],
      ),
    );
  }

  // build back button
  Widget buildBackBtn() {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back, color: deepOrange, size: 24,),
    );
  }

  Widget buildActionTitle() {
    return Text(
      "Gallery",
      style: TextStyle(fontSize: 18, color: greyTextColor, fontWeight: FontWeight.bold),
    );
  }

  Widget buildGalleryContainer() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - 100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    print("image 1 tapped");
                    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
                    // if (pickedFile.path != null) {
                    //   api.uploadImage(pickedFile.path).then((value) {
                    //     print(value);
                    //     setState(() {
                    //       image1 = value;
                    //     });
                    //   }).catchError((error) {
                    //     print(error.toString());
                    //     showSnackbar(error.toString());
                    //   });
                    // }
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1, color: Colors.grey[400]),
                        bottom: BorderSide(width: 1, color: Colors.grey[400]),
                        left: BorderSide(width: 1, color: Colors.grey[400]),
                        right: BorderSide(width: 1, color: Colors.grey[400]),
                      ),
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: image1 != null? NetworkImage(
                            image1,
                        ): AssetImage('assets/images/plus.png',),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // margin
                SizedBox(width: 16,),

                InkWell(
                  onTap: () async {
                    print("image 2 tapped");
                    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
                    // if (pickedFile.path != null) {
                    //   api.uploadImage(pickedFile.path).then((value) {
                    //     setState(() {
                    //       image2 = value;
                    //     });
                    //   }).catchError((error) {
                    //     print(error.toString());
                    //     showSnackbar(error.toString());
                    //   });
                    // }
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1, color: Colors.grey[400]),
                        bottom: BorderSide(width: 1, color: Colors.grey[400]),
                        left: BorderSide(width: 1, color: Colors.grey[400]),
                        right: BorderSide(width: 1, color: Colors.grey[400]),
                      ),
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: image2 != null? NetworkImage(
                            image2
                        ): AssetImage('assets/images/plus.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // margin
            SizedBox(height: 16,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    print("image 3 tapped");
                    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
                    // if (pickedFile.path != null) {
                    //   api.uploadImage(pickedFile.path).then((value) {
                    //     setState(() {
                    //       image3 = value;
                    //     });
                    //   }).catchError((error) {
                    //     print(error.toString());
                    //     showSnackbar(error.toString());
                    //   });
                    // }
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1, color: Colors.grey[400]),
                        bottom: BorderSide(width: 1, color: Colors.grey[400]),
                        left: BorderSide(width: 1, color: Colors.grey[400]),
                        right: BorderSide(width: 1, color: Colors.grey[400]),
                      ),
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: image3 != null? NetworkImage(
                            image3
                        ): AssetImage('assets/images/plus.png',),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // margin
                SizedBox(width: 16,),

                InkWell(
                  onTap: () async {
                    print("image 4 tapped");
                    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
                    // if (pickedFile.path != null) {
                    //   api.uploadImage(pickedFile.path).then((value) {
                    //     setState(() {
                    //       image4 = value;
                    //     });
                    //   }).catchError((error) {
                    //     print(error.toString());
                    //     showSnackbar(error.toString());
                    //   });
                    // }
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1, color: Colors.grey[400]),
                        bottom: BorderSide(width: 1, color: Colors.grey[400]),
                        left: BorderSide(width: 1, color: Colors.grey[400]),
                        right: BorderSide(width: 1, color: Colors.grey[400]),
                      ),
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: image4 != null? NetworkImage(
                            image4
                        ): AssetImage('assets/images/plus.png',),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // margin
            SizedBox(height: 16,),

            buildSaveBtn(),
          ],
        ),
      ),
    );
  }

  // save button
  Widget buildSaveBtn() {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: SizedBox(
        width: 100,
        height: 36.0,
        child: MaterialButton(
          onPressed: () {
            if (image1 == null && image2 == null && image3 == null && image4 == null) {
              showSnackbar("Please select at least 1 image");
            }else {
              saveImages();
            }
          },
          color: orangeColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            "Save",
            style: TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: 'Lato'),
          ),
        ),
      ),
    );
  }

  void saveImages() {
    profile.gallery.clear();
    gallery.clear();
    if (image1 != null) {
      gallery.add(Gallery(image: image1));
    }

    if (image2 != null) {
      gallery.add(Gallery(image: image2));
    }

    if (image3 != null) {
      gallery.add(Gallery(image: image3));
    }

    if (image4 != null) {
      gallery.add(Gallery(image: image4));
    }

    // Map<String, dynamic> json = Map();
    // json['images'] = gallery;
    // api.updateGallery(json).then((value) {
    //   profile.gallery = gallery;
    //   showToast("Gallery updated");
    //   Navigator.pop(context);
    // }).catchError((error) {
    //   showSnackbar(error.toString());
    // });
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
