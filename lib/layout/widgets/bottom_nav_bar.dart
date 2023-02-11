// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:hotely/blocs/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:hotely/blocs/bottom_nav_bar/bottom_nav_bar_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

Duration _duration = Duration(milliseconds: 300);
int _index = 0;

class _BottomNavBarState extends State<BottomNavBar> {
  List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
        activeIcon: AnimatedContainer(
          duration: _duration,
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(3, 3), // changes position of shadow
              ),
              const BoxShadow(
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(-2, -2), // changes position of shadow
              ),
            ],
          ),
          child: const Icon(
            Icons.home,
            color: Color.fromARGB(255, 240, 202, 124),
          ),
        ),
        icon: AnimatedContainer(
          duration: _duration,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          width: 35,
          height: 35,
          child: const Icon(
            Icons.home,
            color: Colors.grey,
          ),
        ),
        label: ""),
    BottomNavigationBarItem(
        activeIcon: AnimatedContainer(
          duration: _duration,
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(3, 3), // changes position of shadow
              ),
              const BoxShadow(
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(-2, -2), // changes position of shadow
              ),
            ],
          ),
          child: const Icon(
            Icons.search,
            color: Color.fromARGB(255, 240, 202, 124),
          ),
        ),
        icon: AnimatedContainer(
          duration: _duration,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          width: 35,
          height: 35,
          child: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
        label: ""),
    BottomNavigationBarItem(
        activeIcon: AnimatedContainer(
          duration: _duration,
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(3, 3), // changes position of shadow
              ),
              const BoxShadow(
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(-2, -2), // changes position of shadow
              ),
            ],
          ),
          child: const Icon(
            Icons.favorite,
            color: Color.fromARGB(255, 240, 202, 124),
          ),
        ),
        icon: Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          width: 35,
          height: 35,
          child: const Icon(
            Icons.favorite,
            color: Colors.grey,
          ),
        ),
        label: ""),
    BottomNavigationBarItem(
        activeIcon: AnimatedContainer(
          duration: _duration,
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(4, 4), // changes position of shadow
              ),
              const BoxShadow(
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(-3, -3), // changes position of shadow
              ),
            ],
          ),
          child: const Icon(
            Icons.settings,
            color: Color.fromARGB(255, 240, 202, 124),
          ),
        ),
        icon: AnimatedContainer(
          duration: _duration,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          width: 35,
          height: 35,
          child: const Icon(
            Icons.settings,
            color: Colors.grey,
          ),
        ),
        label: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavBarCubit, BottomNavbarState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          child: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.white.withOpacity(0.9),
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent),
            child: BottomNavigationBar(
              onTap: (index) {
                BlocProvider.of<BottomNavBarCubit>(context)
                    .changeNavBarIndex(index);
              },
              currentIndex: state.index,
              items: _items,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              elevation: 10,
            ),
          ),
        );
      },
    );
  }
}
