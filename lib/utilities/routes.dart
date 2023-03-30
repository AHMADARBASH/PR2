import 'package:flutter/material.dart';
import 'package:hotely/data/models/hotel.dart';
import 'package:hotely/layout/screens/home_screen.dart';
import 'package:hotely/layout/screens/hotelDetails.dart';
import 'package:hotely/layout/screens/main_screen.dart';

class RouteGenerator {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainScreen.routeName:
        return MaterialPageRoute(builder: (_) => MainScreen());
      // case HotelDetail2.routeName:
      //   var routeData = settings.arguments as Map<String, dynamic>;
      //   final Hotel _hotel = routeData['hotel'];
      //   return MaterialPageRoute(
      //       builder: (_) => HotelDetail2(
      //             descriptionD: ['test'],
      //             idD: '1',
      //             imageD: _hotel.image,
      //             priceD: _hotel.price,
      //             ratingD: _hotel.rate,
      //             serviceD: ['1'],
      //             titleD: _hotel.name,
      //             typeD: '1',
      //             userId: '1',
      //           ));
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
