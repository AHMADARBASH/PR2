import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotely/blocs/auth/auth_cubit.dart';
import 'package:hotely/blocs/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:hotely/blocs/hotels/hotels_cubit.dart';
import 'package:hotely/data/helpers/cache_helper.dart';
import 'package:hotely/layout/screens/main_screen.dart';
import 'package:hotely/utilities/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachedData.init();
  runApp(const Hotely());
}

class Hotely extends StatelessWidget {
  const Hotely({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavBarCubit>(
          create: (context) => BottomNavBarCubit(),
        ),
        BlocProvider<HotelsCubit>(
          create: (context) => HotelsCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: const Color.fromARGB(255, 240, 202, 124),
                secondary: Colors.white),
            scaffoldBackgroundColor: const Color.fromARGB(255, 235, 235, 235),
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25))),
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
        onGenerateRoute: RouteGenerator.generatedRoute,
      ),
    );
  }
}
