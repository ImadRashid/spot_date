import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotadate/screens/splashscreen.dart';
import 'package:spotadate/ui/screens/confrim_date_screen.dart';
import 'package:spotadate/ui/screens/date_arrival_screen.dart';
import 'package:spotadate/ui/screens/date_profile_screen.dart';
import 'package:spotadate/ui/screens/google_map_screen.dart';
import 'package:spotadate/ui/screens/messages_screen.dart';
import 'package:spotadate/router.dart';
import 'package:spotadate/ui/screens/upload_images/upload_image_screen.dart';
import 'package:spotadate/ui/screens/rate_experience/rate_experience_model.dart';
import 'package:spotadate/ui/screens/upload_images/upload_image_model.dart';



void main()  {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UploadViewModel()),
        ChangeNotifierProvider(create: (context) => RateExperienceModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routerr.generateRoute,
        title: 'Spot New theme',
        home:SplashScreen(),

        //DateArrivalScreen(),

        //SplashScreen(),

        //DateProfileScreen(),
      ),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Spot a date',
    //   theme: ThemeData(
    //     primaryColor: Colors.white,
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //   ),
    //   home: SplashScreen(),
    //
    //   //MyHomePage(title: 'Spot'),
    // );
  }
}

