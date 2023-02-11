import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotely/blocs/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:hotely/blocs/bottom_nav_bar/bottom_nav_bar_states.dart';
import 'package:hotely/layout/screens/favorites_screen.dart';
import 'package:hotely/layout/screens/home_screen.dart';
import 'package:hotely/layout/screens/search_screen.dart';
import 'package:hotely/layout/screens/settings_screen.dart';
import 'package:hotely/layout/widgets/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pages = [
    HomeScreen(),
    SearchScreen(),
    FavoritesScreen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<BottomNavBarCubit, BottomNavbarState>(
          listener: (context, state) {},
          builder: (context, state) {
            return _pages[state.index];
          },
        ),
        bottomNavigationBar: BottomNavBar());
  }
}
