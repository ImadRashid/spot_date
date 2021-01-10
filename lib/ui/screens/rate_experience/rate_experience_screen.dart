import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotadate/core/constants/colors.dart';
import 'package:spotadate/ui/screens/rate_experience/rate_experience_model.dart';

class RateExperienceScreen extends StatefulWidget {
  @override
  _RateExperienceScreenState createState() => _RateExperienceScreenState();
}

class _RateExperienceScreenState extends State<RateExperienceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RateExperienceModel>(
        builder: (context, model, child) => Stack(
          children: [
            /// Background Image
            ///
            Container(
              color: Colors.black87,
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/rate_experience/background_image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            /// All showing Work ... Like rate experience etc .....
            ///
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(height: MediaQuery.of(context).size.height*0.10,),
                    Image.asset('assets/images/rate_experience/pizza_hut.png'),
                    SizedBox(height: 18,),
                    Text('Pizza Hut, East London',style: TextStyle(color: Colors.white,fontSize: 14),textAlign: TextAlign.center,),
                    SizedBox(height: 40,),
                    Text('Rate your experience',style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    /// Rate Experience [ROW] .... here
                    ///
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            model.rateList.length, (index) => GestureDetector(
                          onTap: (){
                            model.rateExperience(index);
                          },
                          child: model.rateList[index].icon,
                        ))
                    ),
                  ],
                ),
                SizedBox(height: 60,),
                /// Bottom White Container with [Service Buttons]
                ///
                circularButtonsArea(),
              ],
            )
          ],
        ),
      ),
      /// Custom Bottom Navigation bar
      ///
      bottomNavigationBar: Container(
        color: orangeColor,
        height: 41,
        child: FlatButton(
          child: Text('Submit',style: TextStyle(fontSize: 14,color: Colors.white),),
          onPressed: () => Navigator.pushNamed(context, 'share_number'),
        )
      ),
    );
  }

  Widget circularButtonsArea(){
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15),)
          ),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          child: Column(
            children: [
              Text('What went well?',style: TextStyle(fontSize: 16),),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customCircularButton(text: 'Food Quality',onPressed: null),
                  SizedBox(width: 15),
                  customCircularButton(text: 'Quantity',onPressed: null),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customCircularButton(text: 'Varity',onPressed: null),
                  SizedBox(width: 15),
                  customCircularButton(text: 'Price',onPressed: null),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customCircularButton(text: 'Customer Servic',onPressed: null),
                  SizedBox(width: 15),
                  customCircularButton(text: 'Other',onPressed: null),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customCircularButton({String text, Function onPressed}){
    return Expanded(
        child: Container(
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(color: appBarGreyColor),
                borderRadius: BorderRadius.circular(30)
            ),
            child: FlatButton(
              child: Text(text,style: TextStyle(fontSize: 10,color: Colors.black),),
              onPressed: onPressed,
            )
        )
    );
  }
}
