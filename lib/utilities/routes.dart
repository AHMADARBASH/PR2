import 'package:flutter/material.dart';
import 'package:hotely/layout/screens/main_screen.dart';

class RouteGenerator {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainScreen.routeName:
        return MaterialPageRoute(builder: (_) => MainScreen());
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
        body: const Center(child: Text('Error Route')),
      );
    });
  }
}
