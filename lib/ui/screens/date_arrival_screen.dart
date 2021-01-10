import 'package:flutter/material.dart';

class DateArrivalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            /// Background Image
            ///
            Container(
              color: Colors.grey,
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/date_arrival/background_image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            /// Center text plus Heart image.....
            ///
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/date_arrival/heart_image.png'),
                  Text('Hello, Emma \n I am at the date spot',style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center,),
                  GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'rate_experience'),
                      child: Text('view on map',style: TextStyle(fontSize: 14,color: Color(0xFFE94E1B), fontWeight: FontWeight.bold),))
                ],
              ),
            )
          ],
        ),
    );
  }
}
