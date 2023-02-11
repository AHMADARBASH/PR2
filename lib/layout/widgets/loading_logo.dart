import 'package:flutter/material.dart';

class LoadingLogo extends StatefulWidget {
  const LoadingLogo({super.key});

  @override
  State<LoadingLogo> createState() => _LoadingLogoState();
}

final _tween = Tween<double>(begin: 0, end: 1);

class _LoadingLogoState extends State<LoadingLogo>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller.forward();
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reverse().then((value) => _controller.forward());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Center(
          child: FadeTransition(
        opacity: _controller,
        child: Image.asset('assets/images/logo.png'),
      )),
    ));
  }
}
