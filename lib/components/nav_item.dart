
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotadate/utils/colors.dart';

class NavItem extends StatelessWidget {

  NavItem({this.onPressed, this.title, this.imgPath, this.fontWeight});

  String imgPath;
  String title;
  Function onPressed;
  FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this.onPressed();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              this.imgPath,
              width: 16,
              height: 16,
              color: orangeColor,
            ),
            // margin
            SizedBox(width: 16,),
            Text(
              this.title,
              style: TextStyle(fontWeight: this.fontWeight),
            ),
          ],
        ),
      ),
    );
  }
}
