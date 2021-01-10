import 'package:flutter/material.dart';
import 'package:spotadate/core/constants/colors.dart';
import 'package:spotadate/core/constants/text_styles.dart';
import 'package:timeline_tile/timeline_tile.dart';


class ImagesSliderScreen extends StatefulWidget {
  @override
  _ImagesSliderScreenState createState() => _ImagesSliderScreenState();
}

class _ImagesSliderScreenState extends State<ImagesSliderScreen>
    with TickerProviderStateMixin {

  List<String> images = [
    "assets/images/image_slider/image1.png",
    "assets/images/image_slider/image3.png",
    "assets/images/image_slider/image3.png",
    "assets/images/image_slider/image3.png"
  ];
  int currentPage = 0;
  PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: currentPage);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          /// sliding images area
          ///
          slidingImages(),

          /// List Tiles Half Screen
          ///
          listTilesHalfScreen(),

          /// Bottom Rounded Buttons
          ///
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                roundedButton(text: 'Nature'),
                roundedButton(text: 'Music'),
                roundedButton(text: 'Travel', onPressed: null),
                Container(height: 24,width: MediaQuery.of(context).size.width/3.5,),
              ],
            ),
          )
        ],
      ),
    );
  }

  slidingImages() {
    return Container(
      height: MediaQuery.of(context).size.height*0.44,
      child: Stack(
        children: [
          PageView.builder(
            controller: pageController,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              onPageChanged: (index) {
                currentPage = index;
                setState(() {});
              },
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.asset(
                    images[index],
                  fit: BoxFit.cover,
                );
              }),
          Container(
            padding: EdgeInsets.only(top: 20,left: 5),
            child: IconButton(
              icon: Icon(Icons.arrow_back,size: 30,color: orangeColor,),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          /// Right arrow
          ///
          GestureDetector(
            onTap: (){
              currentPage != 3 ? pageController.animateToPage(
                  currentPage+1,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut
              ) : null;
            },
            child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 15),
                child: Image.asset('assets/images/image_slider/right_arrow.png')),
          ),
          /// Left Arrow
          ///
          GestureDetector(
            onTap: (){
              currentPage != 0 ?pageController.animateToPage(
                  currentPage-1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut
              ) : null;
              print('tap');
            },
            child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15),
                child: Image.asset('assets/images/image_slider/left_arrow.png')),
          ),
          /// Dot Indicator
          ///
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: FractionalOffset(0,0.98),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                images.length,
                    (index) => DotIndicator(
                    index: index, currentPage: currentPage),
              ),
            ),
          ),
          /// Favourite button + block button etc
          ///
          Container(
            padding: EdgeInsets.only(right: 20),
            alignment: FractionalOffset(00, 1.12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/images/image_slider/block_button.png'),
                Image.asset('assets/images/image_slider/text_button.png'),
                Image.asset('assets/images/image_slider/favourite_button.png')
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listTilesHalfScreen(){
    return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text('Robert',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
              SizedBox(height: 5,),
              Row(
                children: [
                  Image.asset('assets/images/image_slider/age.png'),
                  Text('\t 22 years',style: TextStyle(fontSize: 8),),
                  SizedBox(width: 10,),
                  Image.asset('assets/images/image_slider/distance.png'),
                  Text('\t 2 km',style: TextStyle(fontSize: 8),),
                ],
              ),
              SizedBox(height: 10,),
              timeLineTiles(isFirst: false, isLast: true, text: 'About me', color: Color(0xFFA7A7A7),bottom: 2.0),
              Padding(
                padding: EdgeInsets.only(left: 2.4),
                child: timeLineTiles(
                    isFirst: false,
                    isLast: false,
                    text: 'Lorem ipsum dolor sit amet, consetetur sadipscing '
                        'elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna '
                        'aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet',
                    color: Colors.black,
                    isIndicator: false,
                    bottom: 10.0,
                    left: 13.0
                ),
              ),
              timeLineTiles(isFirst: false, isLast: false, text: 'Status', color: Color(0xFFA7A7A7),bottom: 3.0),
              Padding(
                padding: EdgeInsets.only(left: 2.4),
                child: timeLineTiles(
                    isFirst: false,
                    isLast: false,
                    text: 'Single',
                    color: Colors.black,
                    isIndicator: false,
                    bottom: 10.0,
                    left: 13.0
                ),
              ),
              timeLineTiles(isFirst: false, isLast: false, text: 'Height', color: Color(0xFFA7A7A7),bottom: 3.0),
              Padding(
                padding: EdgeInsets.only(left: 2.4),
                child: timeLineTiles(
                    isFirst: false,
                    isLast: false,
                    text: "5'9",
                    color: Colors.black,
                    isIndicator: false,
                    bottom: 10.0,
                    left: 13.0
                ),
              ),
              timeLineTiles(isFirst: false, isLast: false, text: 'Occupation', color: Color(0xFFA7A7A7),bottom: 3.0),
              Padding(
                padding: EdgeInsets.only(left: 2.4),
                child: timeLineTiles(
                    isFirst: false,
                    isLast: false,
                    text: 'Graphic Designer',
                    color: Colors.black,
                    isIndicator: false,
                    bottom: 10.0,
                    left: 13.0
                ),
              ),
              timeLineTiles(isFirst: true, isLast: false, text: 'Interests', color: Color(0xFFA7A7A7),bottom: 3.0),
            ],
          ),
        )
    );
  }

  Widget timeLineTiles({isFirst, isLast, text, color,isIndicator = true,bottom = 0.0,left = 10.0}){
    return TimelineTile(
      hasIndicator: isIndicator,
      afterLineStyle: LineStyle(
        thickness: 2.0,
      ),
      beforeLineStyle: LineStyle(
        thickness: 2,
      ),
      indicatorStyle: IndicatorStyle(
          width: 7,
          color: Color(0xFFA7A7A7)
      ),
      isLast: isFirst,
      isFirst: isLast,
      endChild: Padding(
        padding: EdgeInsets.only(left: left,bottom: bottom),
        child: Text(text,style: TextStyle(color: color,fontSize: 12,fontWeight: FontWeight.w600),),
      ),
    );
  }

  Widget roundedButton({String text, Function onPressed}){
    return Container(
      height: 24,
      width: 65,
      decoration: BoxDecoration(
        border: Border.all(color: orangeColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: FlatButton(
          onPressed: onPressed,
          child: Text(text,style: lockMessagesStyle.copyWith(fontWeight: FontWeight.w400),)
      ),
    );
  }
}

/// indication dots at bottom of image
///
class DotIndicator extends StatelessWidget {
  final index;
  final currentPage;
  DotIndicator({this.index, this.currentPage});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? orangeColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}