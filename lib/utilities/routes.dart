import 'package:flutter/material.dart';
import 'package:hotely/layout/screens/home_screen.dart';
import 'package:hotely/layout/screens/hotelDetails.dart';
import 'package:hotely/layout/screens/main_screen.dart';

class RouteGenerator {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    final routeData = settings.arguments as Map<String, dynamic>;
    switch (settings.name) {
      case MainScreen.routeName:
        return MaterialPageRoute(builder: (_) => MainScreen());
      // case HotelDetail2.routeName:
      //   return MaterialPageRoute(builder: (_) => HotelDetail2());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: const Text('Error Route')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error Route'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
              child: Text(
                'back to Home',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            )
          ],
        )),
      );
    });
  }
}
