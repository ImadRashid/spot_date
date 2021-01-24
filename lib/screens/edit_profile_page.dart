import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:spotadate/core/constants/colors.dart';
import 'package:spotadate/screens/navigation/profile.dart';
import 'package:spotadate/services/database.dart';
// import 'package:spotadate/ui/custom_widgets/messages_screens_app_bar.dart';
import 'package:spotadate/utils/colors.dart';
// import 'package:spotadate/utils/colors.dart';
import 'package:uuid/uuid.dart';

class EditProfile extends StatefulWidget {
  final imgUrl;
  final userId;
  final interests;
  final gender;
  final sexP;
  EditProfile(
      {this.imgUrl, this.userId, this.gender, this.interests, this.sexP});
  @override
  _EditProfileState createState() => _EditProfileState();
}

// enum Gender{
//   male
// }
class _EditProfileState extends State<EditProfile> {
  String genderGroupValue; // = 0;
  // String maleValue; // = 1;
  // String femaleValue; //= 2;
  // String nonBinaryValue; //= 3;

  String sexualPreferenceGroupValue;
  // int straightValue = 1;
  // int biValue = 2;
  // int gayValue = 3;
  List<String> _interests = [];
  final _nameEditingController = TextEditingController();
  final _interestEditingController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _usernameEditingController = TextEditingController();
  final _usernameFocusNode = FocusNode();
  final _occupationEditingController = TextEditingController();
  final _occupationFocusNode = FocusNode();
  final _aboutEditingController = TextEditingController();
  final _aboutFocusNode = FocusNode();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    // if (profile == null) {
    //   profile = Profile();
    // }
    // if (profile.interests.length > 0) {
    //   interestList.addAll(profile.interests);
    // }

    //setData();
  }

  final ImagePicker _picker = ImagePicker();
  var pid;
  File _imageFile;
  // final DatabaseService _data = DatabaseService(uid: _auth.user);
  Future getImage() async {
    var image =
        await _picker.getImage(source: ImageSource.gallery, maxWidth: 400);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
        print('Image Path ${_imageFile.path}');
      });
    } else {
      Get.snackbar("ERROR", "Error Fetching Image, Try Again");
      print("Error fetching image from Gallery");
    }
    // dynamic imgUrl = await uploadPic();
    // await DatabaseService(uid: widget.userId).changeProfilePic(
    //   imgUrl: imgUrl,
    // );
  }

  Future uploadPic() async {
    pid = Uuid().v4();
    var localImagePath = _imageFile.path;
    var fileExtension = localImagePath.substring(localImagePath.length - 3);

    print(fileExtension);
    print(pid);
    StorageReference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('profilePictures/$pid.$fileExtension');
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    dynamic url = await firebaseStorageRef.getDownloadURL();
    print(await url);
    setState(() {
      print("Picture uploaded");
      Get.snackbar("Success", "Image Uploaded");
      // Scaffold.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Picture Uploaded'),
      //   ),
      // );
      // Get.snackbar("Success", "Picture Uploaded");
    });

    // return url;
    await DatabaseService(uid: widget.userId).changeProfilePic(
      imgUrl: url,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: buildNavMenuIcon(),
      title: Center(
        child: Text(
          "Edit Profile",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: greyTextColor),
        ),
      ),
    );
  }

  Widget buildNavMenuIcon() {
    return InkWell(
      onTap: () {
        //homeScaffold.currentState.openDrawer();
        Navigator.of(context).pop();
      },
      child: Icon(
        Icons.arrow_back,
        color: Colors.orange,
        size: 24,
      ),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.only(top: 5, left: 16, right: 16, bottom: 5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //buildBackBtn(),
            buildProfileImage(),
            buildTitle(),
            buildForm(),
          ],
        ),
      ),
    );
  }

  Widget buildProfileImage() {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        child: Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: (_imageFile != null)
                      ? DecorationImage(
                          image: FileImage(_imageFile),
                        )
                      : NetworkImage(widget.imgUrl),
                  // image: (profile != null && profile.image != null && profile.image.isNotEmpty)?
                  // NetworkImage(
                  //   profile.image,
                  // ):
                  // AssetImage('assets/ben.png'),
                ),
              ),
            ),

            // edit button
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () async {
                    print("Edit image pressed");
                    await getImage();
                    //pickImage();
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        color: deepOrange,
                        shape: BoxShape.circle,
                        border: Border(
                          top: BorderSide(color: Colors.white, width: 3),
                          bottom: BorderSide(color: Colors.white, width: 3),
                          left: BorderSide(color: Colors.white, width: 3),
                          right: BorderSide(color: Colors.white, width: 3),
                        )),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 1),
        child: Text(
          "Edit Profile",
          style: TextStyle(
              fontSize: 16, color: greyTextColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildForm() {
    return Padding(
      padding: EdgeInsets.only(top: 1),
      child: Form(
        //key: _formKey,
        child: Column(
          children: [
            buildNameField(),
            buildUsernameField(),
            buildOccupationField(),
            //buildHeightDropdown(),
            // buildDobPicker(),
            // buildLocation(),
            buildAboutField(),
            buildGenderRadio(),
            buildSexualPreferenceRadio(),
            // buildStatusRadio(),
            buildInterestList(),
            isLoading
                ? Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: CircularProgressIndicator(),
                  )
                : buildSaveBtn(),
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return TextFormField(
      controller: _nameEditingController,
      focusNode: _nameFocusNode,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return "Name cannot be empty";
        } else {
          return null;
        }
      },
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(_usernameFocusNode);
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(4),
          ),
          labelText: "Name",
          hintText: "Name",
          labelStyle:
              TextStyle(color: greyTextColor, fontWeight: FontWeight.bold)),
    );
  }

  Widget buildUsernameField() {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: TextFormField(
        controller: _usernameEditingController,
        focusNode: _usernameFocusNode,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value.isEmpty) {
            return "Username cannot be empty";
          } else {
            return null;
          }
        },
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(_occupationFocusNode);
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(4),
            ),
            labelText: "Username",
            hintText: "Username",
            labelStyle:
                TextStyle(color: greyTextColor, fontWeight: FontWeight.bold)),
      ),
    );
  }

  // Ocuupation field
  Widget buildOccupationField() {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: TextFormField(
        controller: _occupationEditingController,
        focusNode: _occupationFocusNode,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value.isEmpty) {
            return "Occupation cannot be empty";
          } else {
            return null;
          }
        },
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(_aboutFocusNode);
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(4),
            ),
            labelText: "Occupation",
            hintText: "Occupation",
            labelStyle:
                TextStyle(color: greyTextColor, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget buildAboutField() {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: TextFormField(
        controller: _aboutEditingController,
        focusNode: _aboutFocusNode,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value.isEmpty) {
            return "About cannot cannot be empty";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(4),
            ),
            labelText: "About",
            hintText: "About",
            labelStyle:
                TextStyle(color: greyTextColor, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget buildGenderRadio() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text(
            "Gender",
            style: TextStyle(color: greyTextColor, fontWeight: FontWeight.bold),
          ),
          // margin
          SizedBox(
            height: 1,
          ),
          // radios with title
          Row(
            children: [
              // male
              Row(
                children: [
                  Radio(
                    groupValue: genderGroupValue,
                    value: "Male",
                    activeColor: deepOrange,
                    onChanged: (value) {
                      setState(() {
                        genderGroupValue = value;
                        print("$genderGroupValue");
                      });
                    },
                  ),
                  Text(
                    "Male",
                  ),
                ],
              ),

              // margin
              SizedBox(
                width: 8,
              ),

              // Female
              Row(
                children: [
                  Radio(
                    groupValue: genderGroupValue,
                    value: "Female",
                    activeColor: deepOrange,
                    onChanged: (value) {
                      setState(() {
                        genderGroupValue = value;
                        print("$genderGroupValue");
                      });
                    },
                  ),
                  Text(
                    "Female",
                  ),
                ],
              ),

              // margin
              SizedBox(
                width: 8,
              ),

              // Female
              Row(
                children: [
                  Radio(
                    groupValue: genderGroupValue,
                    value: "Non Binary",
                    activeColor: deepOrange,
                    onChanged: (value) {
                      setState(() {
                        genderGroupValue = value;
                        print("$genderGroupValue");
                      });
                    },
                  ),
                  Text(
                    "Non-Binary",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // build Sexual prefrence radio
  Widget buildSexualPreferenceRadio() {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text(
            "Sexual Preference",
            style: TextStyle(color: greyTextColor, fontWeight: FontWeight.bold),
          ),
          // margin
          SizedBox(
            height: 0,
          ),
          // radios with title
          Row(
            children: [
              // straight
              Row(
                children: [
                  Radio(
                    groupValue: sexualPreferenceGroupValue,
                    value: "Straigh",
                    activeColor: deepOrange,
                    onChanged: (value) {
                      setState(() {
                        sexualPreferenceGroupValue = value;
                      });
                    },
                  ),
                  Text(
                    "Straight",
                  ),
                ],
              ),

              // margin
              SizedBox(
                width: 8,
              ),

              // gay value
              Row(
                children: [
                  Radio(
                    groupValue: sexualPreferenceGroupValue,
                    value: "Gay",
                    activeColor: deepOrange,
                    onChanged: (value) {
                      setState(() {
                        sexualPreferenceGroupValue = value;
                      });
                    },
                  ),
                  Text(
                    "Gay",
                  ),
                ],
              ),

              // margin
              SizedBox(
                width: 8,
              ),

              // bi value
              Row(
                children: [
                  Radio(
                    groupValue: sexualPreferenceGroupValue,
                    value: "Bi",
                    activeColor: deepOrange,
                    onChanged: (value) {
                      setState(() {
                        sexualPreferenceGroupValue = value;
                      });
                    },
                  ),
                  Text(
                    "Bi",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // build interest list
  Widget buildInterestList() {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            Text(
              "Interests",
              style:
                  TextStyle(color: greyTextColor, fontWeight: FontWeight.bold),
            ),
            // margin
            SizedBox(
              height: 4,
            ),
            Container(
              height: 36,
              child: ListView.builder(
                itemCount: _interests.length + 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //buildInterestListAddItem(context, index);
                  if (index == 0) {
                    return buildInterestListAddItem(context, index);
                  } else {
                    return buildInterestItem(context, index - 1);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  // interest list item
  Widget buildInterestItem(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: deepOrange),
            bottom: BorderSide(width: 1, color: deepOrange),
            left: BorderSide(width: 1, color: deepOrange),
            right: BorderSide(width: 1, color: deepOrange),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // delete icon button
            InkWell(
              onTap: () {
                print("Delete interest pressed");
                setState(() {
                  interestList.removeAt(index);
                });
              },
              child: Icon(
                Icons.clear,
                color: deepOrange,
                size: 12,
              ),
            ),
            // margin
            SizedBox(
              width: 4,
            ),
            Text(
              _interests[index],
              style: TextStyle(color: deepOrange),
            ),
          ],
        ),
      ),
    );
  }

  // interest list add item
  Widget buildInterestListAddItem(BuildContext context, int index) {
    return Container(
      child: IconButton(
        onPressed: () {
          print("add interest pressed");
          showDialog(context: context, builder: (_) => showAddInterestDialog());
        },
        icon: Icon(
          Icons.add,
          color: deepOrange,
          size: 16,
        ),
      ),
    );
  }

  // Add interest dialog with text field
  Dialog showAddInterestDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        height: 180.0,
        width: 300.0,
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Text(
                  "Add Interest",
                  style: TextStyle(
                      fontSize: 20.0, color: greyTextColor, fontFamily: 'Lato'),
                  textAlign: TextAlign.center,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: TextFormField(
                  controller: _interestEditingController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.orange, width: 2.0),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      labelText: "Interest",
                      hintText: "e.g. Nature",
                      labelStyle: TextStyle(
                          color: greyTextColor, fontWeight: FontWeight.bold)),
                ),
              ),

              // Add Button
              SizedBox(
                width: 200.0,
                height: 40.0,
                child: MaterialButton(
                  onPressed: () {
                    if (_interestEditingController.text.isEmpty) {
                      Get.snackbar("Error", "Interest cannot be empty");
                    } else {
                      // _interests.remove(null);
                      setState(() {
                        _interests
                            .add(_interestEditingController.text.toString());
                        // interestList.add(null);
                        _interestEditingController.clear();
                      });
                      Navigator.pop(context);
                    }
                  },
                  color: deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Text(
                    "Add",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // save button
  Widget buildSaveBtn() {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: SizedBox(
        width: 100,
        height: 36.0,
        child: MaterialButton(
          onPressed: () async {
            if (_nameEditingController.text.isEmpty ||
                _usernameEditingController.text.isEmpty ||
                _occupationEditingController.text.isEmpty ||
                _aboutEditingController.text.isEmpty) {
              Get.snackbar('Error', "No Field can be left Empty");
            } else {
              try {
                setState(() {
                  isLoading = true;
                });
                await DatabaseService(uid: widget.userId).modifyUserData(
                    name: _nameEditingController.text,
                    username: _usernameEditingController.text,
                    occupation: _occupationEditingController.text,
                    about: _aboutEditingController.text,
                    interests: _interests,
                    gender: genderGroupValue,
                    sexualpreference: sexualPreferenceGroupValue

                    // location: locationController.text
                    );
                Get.snackbar("Success", "Updated User Data");
                setState(() {
                  isLoading = false;
                });
                // Navigator.pop(context);
              } catch (e) {
                setState(() {
                  isLoading = false;
                });
                print("ERROR in updating data : $e");
              }
            }
          },
          color: Colors.orange,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            "Save",
            style: TextStyle(
                fontSize: 16.0, color: Colors.white, fontFamily: 'Lato'),
          ),
        ),
      ),
    );
  }
}
