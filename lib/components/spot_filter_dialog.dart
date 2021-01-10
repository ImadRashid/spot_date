
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:spotadate/models/spot_filter.dart';
import 'package:spotadate/models/spot_filter.dart';
import 'package:spotadate/utils/colors.dart';

class SpotFilterDialog {
  SpotFilterDialog({this.context, this.spotFilter, this.onApply});

  BuildContext context;
  SpotFilter spotFilter;
  Function onApply;

  YYDialog show() {
    return YYDialog().build()
      ..width = double.infinity
      ..height = 400
      ..backgroundColor = Colors.white
      ..gravity = Gravity.top
      ..gravityAnimationEnable = true
      ..showCallBack = () {
        print("showCallBack invoke");
      }
      ..dismissCallBack = () {
        print("dismissCallBack invoke");
      }
      ..widget(Padding(
        padding: EdgeInsets.only(top: 30, bottom: 5, left: 21, right: 21),
        child: Center(
          child: SpotFilterDialogWidget(context: context, spotFilter: spotFilter, onApply: onApply,),
        ),
      ))
      /*..animatedFunc = (child, animation) {
        return ScaleTransition(
          child: child,
          //scale: Tween(begin: 1.5, end: 0.0, ).animate(animation),
        );
      }*/
      ..show();
  }
}

class SpotFilterDialogWidget extends StatefulWidget {

  SpotFilterDialogWidget({this.context, this.spotFilter, this.onApply});

  BuildContext context;
  SpotFilter spotFilter;
  Function onApply;


  @override
  _SpotFilterDialogWidgetState createState() =>
      _SpotFilterDialogWidgetState(context: context, spotFilter: spotFilter, onApply: onApply);
}

class _SpotFilterDialogWidgetState extends State<SpotFilterDialogWidget> {

  _SpotFilterDialogWidgetState({this.context, this.spotFilter, this.onApply});
  BuildContext context;
  SpotFilter spotFilter;
  Function onApply;

  bool straight = false;
  bool bi = false;
  bool gay = false;
  double minAge = 0.0;
  double maxAge = 0.0;
  double distance = 0.0;

  @override
  void initState() {
    super.initState();
    straight = spotFilter.straight;
    bi = spotFilter.female;
    gay = spotFilter.male;
    minAge = spotFilter.minAge.toDouble();
    maxAge = spotFilter.maxAge.toDouble();
    distance = spotFilter.distance.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // filter heading
          Center(
            child: Text(
              "Filter",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey),
            ),
          ),

          // margin
          SizedBox(height: 30,),

          // i'm looking for text
          Text(
            "I'm looking for",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
          ),

         // buildStraightSwitch(),
          buildFemaleSwitch(),
          buildMaleSwitch(),
          SizedBox(height: 10,),
          buildAgeSlider(),
          SizedBox(height: 10,),
          buildDistanceSlider(),
          SizedBox(height: 10,),
          buildApplyBtn(),
        ],
      ),
    );
  }

  // build straight switch
  // Widget buildStraightSwitch() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Text(
  //         "Straight",
  //         style: TextStyle(color: Colors.black87),
  //       ),
  //       Switch(
  //         value: straight,
  //         activeColor: orangeColor,
  //         activeTrackColor: Colors.grey,
  //         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //         onChanged: (value) {
  //           setState(() {
  //             straight = value;
  //           });
  //         },
  //       ),
  //     ],
  //   );
  // }

  // build bi switch
  Widget buildFemaleSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Female",
          style: TextStyle(color: Colors.black87),
        ),
        Switch(
          value: bi,
          activeColor: orangeColor,
          activeTrackColor: Colors.grey,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: (value) {
            setState(() {
              bi = value;
            });
          },
        ),
      ],
    );
  }

  // build gay switch
  Widget buildMaleSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Male",
          style: TextStyle(color: Colors.black87),
        ),
        Switch(
          value: gay,
          activeColor: orangeColor,
          activeTrackColor: Colors.grey,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: (value) {
            setState(() {
              gay = value;
            });
          },
        ),
      ],
    );
  }

  Widget buildAgeSlider() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Age text
            Text(
              "Age",
              style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),

            Text(
                "${minAge.round()} - ${maxAge.round()}"
            ),
          ],
        ),

        FlutterSlider(
          values: [minAge, maxAge],
          max: 100,
          min: 0,
          rangeSlider: true,
          handlerHeight: 20,
          handlerWidth: 20,
          trackBar: FlutterSliderTrackBar(
            activeTrackBar: BoxDecoration(
                color: orangeColor
            ),
            inactiveTrackBar: BoxDecoration(
                color: greyTextColor
            ),
          ),
          onDragging: (handlerIndex, lowerValue, upperValue) {
            setState(() {
              print(lowerValue.toString());
              minAge = lowerValue;
              maxAge = upperValue;
            });
          },
          handler: FlutterSliderHandler(
            foregroundDecoration: BoxDecoration(
                color: orangeColor,
                shape: BoxShape.circle
            ),
          ),
          rightHandler: FlutterSliderHandler(
            foregroundDecoration: BoxDecoration(
                color: orangeColor,
                shape: BoxShape.circle
            ),
          ),
        ),
      ],
    );
  }

  // build distance slider
  Widget buildDistanceSlider() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Age text
            Text(
              "Distance",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
            ),

            Text(
                "${distance.round()} km"
            ),
          ],
        ),

        FlutterSlider(
          values: [distance],
          max: 100,
          min: 0,
          rangeSlider: false,
          rtl: false,
          handlerHeight: 20,
          handlerWidth: 20,
          trackBar: FlutterSliderTrackBar(
            activeTrackBar: BoxDecoration(
                color: orangeColor
            ),
            inactiveTrackBar: BoxDecoration(
                color: greyTextColor
            ),
          ),
          onDragging: (handlerIndex, lowerValue, upperValue) {
            setState(() {
              distance = lowerValue;
            });
          },
          handler: FlutterSliderHandler(
            foregroundDecoration: BoxDecoration(
                color: orangeColor,
                shape: BoxShape.circle
            ),
          ),
        ),
      ],
    );
  }

  // build apply button
  Widget buildApplyBtn() {
    return Center(
      child: SizedBox(
        width: 100,
        height: 40.0,
        child: MaterialButton(
          onPressed: () {
            spotFilter.straight = straight;
            spotFilter.female = bi;
            spotFilter.male = gay;
            spotFilter.minAge = minAge.toInt();
            spotFilter.maxAge = maxAge.toInt();
            spotFilter.distance = distance.toInt();
            onApply(spotFilter);
            Navigator.pop(context);
          },
          color: orangeColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            "Apply",
            style: TextStyle(fontSize: 14.0, color: Colors.white, fontFamily: 'Lato'),
          ),
        ),
      ),
    );
  }

}

