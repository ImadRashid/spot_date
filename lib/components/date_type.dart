
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotadate/utils/colors.dart';

class DateType extends StatelessWidget {

  DateType({@required this.onSelected, @required this.title, @required this.icon, @required this.isSelected});
  bool isSelected;
  IconData icon;
  String title;
  Function onSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelected(title);
        // if date type already selected then remove it otherwise add it
        /*if (selectedDateTypes.contains(dateTypes[index])) {
          selectedDateTypes.remove(dateTypes[index]);
        }else {
          selectedDateTypes.add(dateTypes[index]);
        }
        print(selectedDateTypes.length.toString());*/
      },
      child: Padding(
        padding: EdgeInsets.only(right: 15),
        child: isSelected? Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 2, color: orangeColor),
              bottom: BorderSide(width: 2, color: orangeColor),
              left: BorderSide(width: 2, color: orangeColor),
              right: BorderSide(width: 2, color: orangeColor),
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: orangeColor,
                size: 16,
              ),
              SizedBox(width: 5,),
              Text(
                title,
                style: TextStyle(color: orangeColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ): Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: Colors.deepOrangeAccent[100]),
              bottom: BorderSide(width: 1, color: Colors.deepOrangeAccent[100]),
              left: BorderSide(width: 1, color: Colors.deepOrangeAccent[100]),
              right: BorderSide(width: 1, color: Colors.deepOrangeAccent[100]),
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.deepOrangeAccent[100],
                size: 16,
              ),
              SizedBox(width: 5,),
              Text(
                title,
                style: TextStyle(color: Colors.deepOrangeAccent[100],),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
