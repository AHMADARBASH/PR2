import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotely/blocs/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:hotely/blocs/hotel_blocs/hotels_cubit.dart';
import 'package:hotely/layout/screens/main_screen.dart';
import 'package:hotely/utilities/routes.dart';

void main() {
  runApp(Hotely());
}

class Hotely extends StatelessWidget {
  const Hotely({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavBarCubit()),
        BlocProvider(
          create: (context) => HotelsCubit(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 235, 235, 235),
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25))),
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
        onGenerateRoute: RouteGenerator.generatedRoute,
      ),
    );
  }
}
