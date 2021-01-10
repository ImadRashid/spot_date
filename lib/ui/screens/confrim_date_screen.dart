import 'package:flutter/material.dart';
import 'package:spotadate/components/cacle_date.dart';
import 'package:spotadate/models/spot_verification.dart';
import 'package:spotadate/screens/spot_verification_request_page.dart';

import 'package:spotadate/ui/custom_widgets/messages_screens_app_bar.dart';
import 'package:spotadate/ui/screens/chat_screen.dart';
import 'package:spotadate/ui/screens/re_schadule_screen.dart';
import 'package:spotadate/ui/screens/share_number_screen.dart';
import 'package:spotadate/utils/colors.dart';

class ConfirmDateScreen extends StatefulWidget {
  final String name;
  final String image;
  ConfirmDateScreen({this.name,this.image});

  @override
  _ConfirmDateScreenState createState() => _ConfirmDateScreenState();
}

class _ConfirmDateScreenState extends State<ConfirmDateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: messagesScreenAppBar(
        title: widget.name,
        color: Colors.black,
        leading: Icons.arrow_back,
        leadingOnpress: () => Navigator.pop(context),
        trailing: IconButton(
            icon: Icon(Icons.camera_alt,color: Colors.black,size: 30,),
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>SpotVerificationRequestPage(

              )));

            }
        )
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            ///
            /// Confirm date, Cancel date, re-arrange date .. ... Buttons
            ///
            Column(
              children: [
                Row(
                  children: [

                    Expanded(
                      child: Container(
                        child: MaterialButton(
                          onPressed: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder:(context)=>ReScheduleScreen(


                            )));
                          },
                          color: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(width: 1, color: orangeColor),
                          ),
                          child: Text(
                            "Re-arrange date",
                            style: TextStyle(fontSize: 14.0, color: orangeColor, fontFamily: 'Lato', ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Container(
                        child: MaterialButton(
                          onPressed: ()
                          {
                            CancleDateDialog(
                                context: context,
                                onDismiss: () {
                                  //navigateToHomePage();
                                }
                            ).show();
                          },

                          color: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(width: 1, color: orangeColor),
                          ),
                          child: Text(
                            "Cancle date",
                            style: TextStyle(fontSize: 14.0, color: orangeColor, fontFamily: 'Lato', ),
                          ),
                        ),
                      ),
                    )
                    // dateChangesCircularButtons(
                    //     title: 'Re-arrange date',
                    //     onPressed: ()
                    //     {
                    //       Navigator.push(context, MaterialPageRoute(builder:(context)=>ReScheduleScreen(
                    //
                    //
                    //       )));
                    //     },
                    //     color: orangeColor
                    //
                    // ),
                    // SizedBox(width: 15,),
                    // dateChangesCircularButtons(
                    //     title: 'Cancel date',
                    //     onPressed: null,
                    //     color: orangeColor
                    // ),
                  ],
                ),
                SizedBox(height:5,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: MaterialButton(
                          onPressed: ()
                          {
                            // Navigator.push(context, MaterialPageRoute(builder:(context)=>ConfirmDateScreen(
                            //
                            //
                            // )));
                          },
                          color: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(width: 1, color: orangeColor),
                          ),
                          child: Text(
                            "Confirm arrival",
                            style: TextStyle(fontSize: 14.0, color: orangeColor, fontFamily: 'Lato', ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Container(
                        child: MaterialButton(
                          onPressed: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder:(context)=>ShareNumberScreen(


                                      )));

                          },

                          color: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(width: 1, color: orangeColor),
                          ),
                          child: Text(
                            "Share number",
                            style: TextStyle(fontSize: 14.0, color: orangeColor, fontFamily: 'Lato', ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      /// Custom Bottom Navigation bar
      ///
      bottomNavigationBar: Container(
        height: 51,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\t \t Say something..',style: TextStyle(fontSize: 16,color: Color(0xFF474747)),),
            IconButton(
              icon: Icon(Icons.arrow_forward,color: orangeColor,size: 30,),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(
                name: widget.name,
                image: widget.image,
              ))),
            )
          ],
        ),
      ),
    );
  }

  Widget dateChangesCircularButtons({String title, Function onPressed, Color color}){
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(50),
        ),
        height: 37,
        child: FlatButton(
          color: Colors.white,
          child: Text(title,style: TextStyle(color: color,fontSize: 12,fontWeight: FontWeight.w500),),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
