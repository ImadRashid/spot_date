import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spotadate/components/date_confirmed_dialog.dart';
import 'package:spotadate/components/request_acception_dailogue.dart';
import 'package:spotadate/models/spot_request.dart';
import 'package:spotadate/screens/date_details.dart';
import 'package:spotadate/screens/spot_verification_request_page.dart';

//import 'package:spot/network/api/spot_apis.dart';
// import 'package:spot/pages/spot_date_detail_page.dart';
// import 'package:spot/pages/spot_verification_page.dart';
import 'package:spotadate/utils/colors.dart';
import 'package:spotadate/utils/request_type.dart';

//import 'home_page.dart';

class SpotRequestsPage extends StatefulWidget {
  @override
  _SpotRequestsPageState createState() => _SpotRequestsPageState();
}

class _SpotRequestsPageState extends State<SpotRequestsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<SpotRequest> spotRequests = List();

  //SpotApis api = SpotApis();

  @override
  void initState() {
    super.initState();
    //getSpotRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return buildMybodyContent();
  }

  // build body contents

  Widget buildMybodyContent() {
    return Container(
      padding: EdgeInsets.only(left: 12,right: 12),
      child: Column(
        children: [
          buildImageAndName(),
        ],
      ),
    );
  }

  Widget buildImageAndName(){
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>SpotVerificationRequestPage(

                  )));
                },
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          // image: (notification != null && notification.from != null && notification.from.profile != null
                          //     && notification.from.profile.image != null)?
                          // NetworkImage(
                          //   notification.from.profile.image,
                          // ):
                          image: AssetImage('assets/images/messages_screen/robert.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Steven Smith',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 3,),
                        Text(
                          'Spot Verification',
                          style: TextStyle(
                              fontSize: 16,

                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(child: Container(child: SvgPicture.asset('assets/images/cross.svg', width: 25, height: 25, color: Colors.black,))),

              InkWell(
                child: Container(child: SvgPicture.asset('assets/images/check.svg', width: 25, height: 25, color: orangeColor,)),
              ),





            ],
          ),
          SizedBox(height: 10,),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: ()
                {
                  ResquestAcceptionDialog(
                      context: context,
                      onDismiss: () {
                        //navigateToHomePage();
                      }
                  ).show();
                },
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          // image: (notification != null && notification.from != null && notification.from.profile != null
                          //     && notification.from.profile.image != null)?
                          // NetworkImage(
                          //   notification.from.profile.image,
                          // ):
                          image: AssetImage('assets/images/messages_screen/john.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tim Pan',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 3,),
                        Text(
                          'Date Request',
                          style: TextStyle(
                              fontSize: 16,

                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),






            ],
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>DateDetails( )));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          // image: (notification != null && notification.from != null && notification.from.profile != null
                          //     && notification.from.profile.image != null)?
                          // NetworkImage(
                          //   notification.from.profile.image,
                          // ):
                          image: AssetImage('assets/ben.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Wayne',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 3,),
                        Text(
                          'Date details request',
                          style: TextStyle(
                              fontSize: 16,

                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(child: Container(child: SvgPicture.asset('assets/images/cross.svg', width: 25, height: 25, color: Colors.black,))),

                InkWell(
                  child: Container(child: SvgPicture.asset('assets/images/check.svg', width: 25, height: 25, color: orangeColor,)),
                ),





              ],
            ),
          ),
        ],
      )
    );
  }

  Widget buildBodyContents() {
    return ListView.builder(
      itemCount: spotRequests.length,
      itemBuilder: (context, index) {
        return RequestListItem(
          spotRequest: spotRequests[index],
        );
      },
    );
  }

  // build empty body messages
  Widget buildEmptyBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No requests found",
          ),
          // margin
          SizedBox(
            height: 8,
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              "REFRESH",
              style: TextStyle(color: orangeColor),
            ),
          ),
        ],
      ),
    );
  }

  // get spot requests
  // void getSpotRequests() {
  //   api.getSpotRequests().then((value) {
  //     setState(() {
  //       spotRequests = value;
  //     });
  //     print(spotRequests.toString());
  //   }).catchError((error) {
  //     print(error.toString());
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
}

// spot request list item
class RequestListItem extends StatefulWidget {
  RequestListItem({
    @required this.spotRequest,
  });

  SpotRequest spotRequest;

  @override
  _RequestListItemState createState() => _RequestListItemState(
        spotRequest: spotRequest,
      );
}

class _RequestListItemState extends State<RequestListItem> {
  _RequestListItemState({
    @required this.spotRequest,
  });

  SpotRequest spotRequest;

  //SpotApis api = SpotApis();

  String subtitle = "";

  bool isShowApproveBtn = true;
  bool isShowDeclineBtn = true;

  @override
  void initState() {
    super.initState();
    getRequestType(spotRequest.type);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (spotRequest.type == RequestType.SPOT_DATE_DETAIL_REQUEST) {
          // navigate to date detail page
          navigateToSpotDateDetailPage();
        } else if (spotRequest.type == RequestType.SPOT_VERIFICATION_REQUEST) {
          // navigate to spot verification page
          //navigateToSpotVerificationPage();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            buildUserImage(),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildUserName(),
                SizedBox(
                  height: 10,
                ),
                buildRequestType(),
              ],
            ),
            Spacer(),
            buildDeclineBtn(),
            SizedBox(
              width: 20,
            ),
            buildAcceptBtn(),
          ],
        ),
      ),
    );
  }

  // build user image
  Widget buildUserImage() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image:
              // (spotRequest != null && spotRequest.from != null && spotRequest.from.profile != null
              //     && spotRequest.from.profile.image != null)?
              // NetworkImage(
              //   spotRequest.from.profile.image,
              // ):
              AssetImage('assets/images/placeholder.jpg'),
        ),
      ),
    );
  }

  // build user name
  Widget buildUserName() {
    return Text(
      "Profile Name",
      //spotRequest.from.profile.name,
      style: TextStyle(fontWeight: FontWeight.w700),
    );
  }

  // build request type
  Widget buildRequestType() {
    return Text(
      subtitle,
      style: TextStyle(fontWeight: FontWeight.w500, color: greyTextColor),
    );
  }

  // decline icon button
  Widget buildDeclineBtn() {
    return isShowDeclineBtn
        ? IconButton(
            onPressed: () {
              if (spotRequest.type == RequestType.SPOT_DATE_REQUEST) {
                // spot date request
                // declineDateRequest();
                Navigator.pop(context);
              } else if (spotRequest.type ==
                  RequestType.SPOT_DATE_DETAIL_REQUEST) {
                // date detail request
                //declineDateRequest();
                Navigator.pop(context);
              }
            },
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
          )
        : Container();
  }

  // accpet icon button
  Widget buildAcceptBtn() {
    return isShowApproveBtn
        ? IconButton(
            onPressed: () {
              if (spotRequest.type == RequestType.SPOT_DATE_REQUEST) {
                //approveDateRequest();
              } else if (spotRequest.type ==
                  RequestType.SPOT_DATE_DETAIL_REQUEST) {
                // date detail request
                //approveDateDetailRequest();
              } else if (spotRequest.type ==
                  RequestType.SPOT_VERIFICATION_REQUEST) {
                // approve spot verification request
                //approveSpotVerification();
              }
            },
            icon: Icon(
              Icons.done,
              color: orangeColor,
            ),
          )
        : Container();
  }

  // get request type message
  void getRequestType(String type) {
    switch (type) {
      case RequestType.SPOT_DATE_REQUEST:
        {
          setState(() {
            subtitle = "Date request";
          });
        }
        break;
      case RequestType.SPOT_DATE_DETAIL_REQUEST:
        {
          setState(() {
            subtitle = "Date detail request";
          });
        }
        break;
      case RequestType.SPOT_VERIFICATION_REQUEST:
        {
          setState(() {
            subtitle = "Spot verification request";
          });
        }
        break;
    }
  }

  // date request declined
  // void approveDateRequest() {
  //   int toId = spotRequest.fromId;
  //   int spotDateId = spotRequest.spotDate.id;
  //   api.approveSpotDateRequest(spotDateId, toId, spotRequest.id).then((value) {
  //     showToast("Date Request approved");
  //     setState(() {
  //       subtitle = "You approved the request";
  //       isShowDeclineBtn = false;
  //       isShowApproveBtn = false;
  //     });
  //     spotRequest.spotDate.spotDateApproved = true;
  //     navigateToHomePage();
  //   }).catchError((error) {
  //     showToast(error.toString());
  //   });
  // }

  // date request approved
  // void declineDateRequest() {
  //   int toId = spotRequest.fromId;
  //   int spotDateId = spotRequest.spotDate.id;
  //   api.declineSpotDateRequest(spotDateId, toId, spotRequest.id).then((value) {
  //     showToast("Date Request declined");
  //     setState(() {
  //       subtitle = "You declined the request";
  //       isShowDeclineBtn = false;
  //       isShowApproveBtn = false;
  //     });
  //     spotRequest.spotDate.decline = true;
  //   }).catchError((error) {
  //     showToast(error.toString());
  //   });
  // }
  //
  // // approve date detail request
  // void approveDateDetailRequest() {
  //   int dateId = spotRequest.spotDate.id;
  //   int toId = spotRequest.fromId;
  //   api.approveDateDetailRequest(dateId, toId, spotRequest.id).then((value) {
  //     showToast("Date request accepted");
  //     setState(() {
  //       subtitle = "You accepted date detail request";
  //       isShowDeclineBtn = false;
  //       isShowApproveBtn = false;
  //     });
  //   }).catchError((error) {
  //     showToast(error.toString());
  //   });
  // }

  // approve spot verification
  // void approveSpotVerification() {
  //   api.approveSpotVerification(spotRequest.id, spotRequest.spotDate.id, spotRequest.spotVerification.id, spotRequest.fromId).then((value) {
  //     showToast("verification approved");
  //     if (value.confirmed) {
  //       print("confirmed");
  //       DateConfirmedDialog(
  //         context: context,
  //         onDismiss: () {
  //           navigateToHomePage();
  //         }
  //       ).show();
  //     }else {
  //       navigateToHomePage();
  //     }
  //   }).catchError((error) {
  //     showToast(error.toString());
  //   });
  // }
  void navigateToHomePage() {
    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    //     HomePage()), (Route<dynamic> route) => false);
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

  // navigate to spot date detail page
  void navigateToSpotDateDetailPage() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => SpotDateDetailPage(spotDate: spotRequest.spotDate,
    //     requestId: spotRequest.id, toId: spotRequest.fromId, toUser: spotRequest.from, onApprove: () {
    //
    //     },)),
    // );
  }

  // Navigate to HomePage
  // void navigateToHomePage()() {
  //   // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
  //   //     HomePage()), (Route<dynamic> route) => false);
  // }

// navigate to spot verification page
// void navigateToSpotVerificationPage() {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => SpotVerificationPage(
//       requestId: spotRequest.id,
//       spotDateId: spotRequest.spotDate.id,
//       toId: spotRequest.fromId,
//       spotVerificationId: spotRequest.spotVerification.id,
//       image1: spotRequest.from.profile.image,
//       image2: spotRequest.spotVerification.image,
//       userName: spotRequest.from.profile.name,
//     )),
//   );
// }
}
