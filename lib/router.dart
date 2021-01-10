import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotadate/ui/screens/chat_screen.dart';
import 'package:spotadate/ui/screens/confrim_date_screen.dart';
import 'package:spotadate/ui/screens/date_arrival_screen.dart';
import 'package:spotadate/ui/screens/images_slider_screen.dart';
import 'package:spotadate/ui/screens/messages_screen.dart';
import 'package:spotadate/ui/screens/rate_experience/rate_experience_screen.dart';
import 'package:spotadate/ui/screens/share_number_screen.dart';


class Routerr {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'confirm_date':
        return MaterialPageRoute(builder: (_) => ConfirmDateScreen());
      case 'messages_screen':
        return MaterialPageRoute(builder: (_) => MessagesScreen());
      case 'chat_screen':
        return MaterialPageRoute(builder: (_) => ChatScreen());
      case 'image_slider':
        return MaterialPageRoute(builder: (_) => ImagesSliderScreen());
      case 'date_arrival':
        return MaterialPageRoute(builder: (_) => DateArrivalScreen());
      case 'rate_experience':
        return MaterialPageRoute(builder: (_) => RateExperienceScreen());
      case 'share_number':
        return MaterialPageRoute(builder: (_) => ShareNumberScreen());
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                )
        );
    }
  }
}