


import 'package:flutter/material.dart';
import 'package:spotadate/core/constants/colors.dart';
import 'package:spotadate/screens/navigation/profile.dart';
import 'package:spotadate/ui/custom_widgets/messages_screens_app_bar.dart';
import 'package:spotadate/utils/colors.dart';
import 'package:spotadate/utils/colors.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  int genderGroupValue = 0;
  int maleValue = 1;
  int femaleValue = 2;
  int nonBinaryValue = 3;

  int sexualPreferenceGroupValue = 0;
  int straightValue = 1;
  int biValue = 2;
  int gayValue = 3;


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar(),
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
                  image:
                  // image: (profile != null && profile.image != null && profile.image.isNotEmpty)?
                  // NetworkImage(
                  //   profile.image,
                  // ):
                  AssetImage('assets/ben.png'),
                ),
              ),
            ),

            // edit button
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () {
                    print("Edit image pressed");
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
                        )
                    ),
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
          style: TextStyle(fontSize: 16, color: greyTextColor, fontWeight: FontWeight.bold),
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
             buildSaveBtn(),
          ],
        ),
      ),
    );
  }
  Widget buildNameField() {
    return TextFormField(
      // controller: _nameEditingController,
      // focusNode: _nameFocusNode,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return "Name cannot be empty";
        } else {
          return null;
        }
      },
      // onFieldSubmitted: (v) {
      //   FocusScope.of(context).requestFocus(_usernameFocusNode);
      // },
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
          labelStyle: TextStyle(color: greyTextColor, fontWeight: FontWeight.bold)),
    );
  }
  Widget buildUsernameField() {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: TextFormField(
        // controller: _usernameEditingController,
        // focusNode: _usernameFocusNode,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value.isEmpty) {
            return "Username cannot be empty";
          }else {
            return null;
          }
        },
        // onFieldSubmitted: (v) {
        //   FocusScope.of(context).requestFocus(_occupationFocusNode);
        // },
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
            labelStyle: TextStyle(color: greyTextColor, fontWeight: FontWeight.bold)
        ),
      ),
    );
  }
  // Ocuupation field
  Widget buildOccupationField() {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: TextFormField(
        // controller: _occupationEditingController,
        // focusNode: _occupationFocusNode,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value.isEmpty) {
            return "Occupation cannot be empty";
          }else {
            return null;
          }
        },
        // onFieldSubmitted: (v) {
        //   FocusScope.of(context).requestFocus(_aboutFocusNode);
        // },
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
            labelStyle: TextStyle(color: greyTextColor, fontWeight: FontWeight.bold)
        ),
      ),
    );
  }

  Widget buildAboutField() {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: TextFormField(
        // controller: _aboutEditingController,
        // focusNode: _aboutFocusNode,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value.isEmpty) {
            return "About cannot cannot be empty";
          }else {
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
            labelStyle: TextStyle(color: greyTextColor, fontWeight: FontWeight.bold)
        ),
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
          SizedBox(height: 1,),
          // radios with title
          Row(
            children: [
              // male
              Row(
                children: [
                  Radio(
                    groupValue: genderGroupValue,
                    value: maleValue,
                    activeColor: deepOrange,
                    onChanged: (value) {
                      setState(() {
                        genderGroupValue = value;
                      });
                    },
                  ),
                  Text(
                    "Male",
                  ),
                ],
              ),

              // margin
              SizedBox(width: 8,),

              // Female
              Row(
                children: [
                  Radio(
                    groupValue: genderGroupValue,
                    value: femaleValue,
                    activeColor: deepOrange,
                    onChanged: (value) {
                      setState(() {
                        genderGroupValue = value;
                      });
                    },
                  ),
                  Text(
                    "Female",
                  ),
                ],
              ),

              // margin
              SizedBox(width: 8,),

              // Female
              Row(
                children: [
                  Radio(
                    groupValue: genderGroupValue,
                    value: nonBinaryValue,
                    activeColor: deepOrange,
                    onChanged: (value) {
                      setState(() {
                        genderGroupValue = value;
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
          SizedBox(height: 0,),
          // radios with title
          Row(
            children: [
              // straight
              Row(
                children: [
                  Radio(
                    groupValue: sexualPreferenceGroupValue,
                    value: straightValue,
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
              SizedBox(width: 8,),

              // gay value
              Row(
                children: [
                  Radio(
                    groupValue: sexualPreferenceGroupValue,
                    value: gayValue,
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
              SizedBox(width: 8,),

              // bi value
              Row(
                children: [
                  Radio(
                    groupValue: sexualPreferenceGroupValue,
                    value: biValue,
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
              style: TextStyle(color: greyTextColor, fontWeight: FontWeight.bold),
            ),
            // margin
            SizedBox(height: 4,),
            Container(
              height: 36,
              child: ListView.builder(
                itemCount: interestList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return
                    //buildInterestListAddItem(context, index);
                     buildInterestItem(context, index);
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
            SizedBox(width: 4,),
            Text(
              interestList[index].interest,
              style: TextStyle(color: deepOrange),
            ),
          ],
        ),
      ),
    );
  }

  // interest list add item
  Widget buildInterestListAddItem(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Container(
        child: IconButton(
          onPressed: () {
            print("add interest pressed");
            showDialog(context: context, builder:(_) => showAddInterestDialog());
          },
          icon: Icon(
            Icons.add,
            color: deepOrange,
            size: 16,
          ),
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
        child:Center(
          child: Column(
            children: [
              Expanded(
                child: Text(
                  "Add Interest",
                  style: TextStyle(fontSize: 20.0, color: greyTextColor, fontFamily: 'Lato'),
                  textAlign: TextAlign.center,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: TextFormField(
                  //controller: _interestEditingController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange, width: 2.0),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      labelText: "Interest",
                      hintText: "Interest",
                      labelStyle: TextStyle(color: greyTextColor, fontWeight: FontWeight.bold)
                  ),
                ),
              ),

              // Add Button
              SizedBox(
                width: 200.0,
                height: 40.0,
                child: MaterialButton(
                  onPressed: () {
                    // if (_interestEditingController.text.isEmpty) {
                    //   showToast("Interest cannot be empty");
                    // }else {
                    //   interestList.remove(null);
                    //   setState(() {
                    //     interestList.add(Interest(
                    //         interest: _interestEditingController.text
                    //             .toString()));
                    //     interestList.add(null);
                    //     _interestEditingController.clear();
                    //   });
                    //   Navigator.pop(context);
                    // }
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
          onPressed: () {
            // if (_formKey.currentState.validate()) {
            //   /*if (profile.latitude != null && profile.longitude != null) {
            //     update();
            //   }else {
            //     showSnackbar("Please select location");
            //   }*/
            //   update();
            // }
          },
          color: Colors.orange,
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


}
