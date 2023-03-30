import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotely/blocs/hotels/hotels_cubit.dart';
import 'package:hotely/blocs/hotels/hotels_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotely/layout/screens/hotelDetails.dart';
import 'package:hotely/layout/widgets/loading_hotel_widget.dart';
import 'package:hotely/layout/widgets/loading_logo.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/login_signin_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HotelsCubit>(context).getTopHotels();
    super.initState();
  }

  bool _firstAnimationEnd = false;
  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final textStyle = GoogleFonts.robotoSlab();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Featured',
            style: GoogleFonts.robotoSlab(),
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                TweenAnimationBuilder(
                  onEnd: () => setState(() {
                    _firstAnimationEnd = true;
                  }),
                  duration: Duration(milliseconds: 400),
                  tween: Tween<double>(begin: 0, end: 1),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 1,
                              color: Colors.grey.withOpacity(0.2),
                              offset: Offset(1, 1))
                        ]),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Top rated Hotels',
                      style: GoogleFonts.robotoSlab()
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Padding(
                        padding: EdgeInsets.only(top: value * 10),
                        child: child,
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<HotelsCubit, HotelsState>(builder: (context, state) {
              return state is HotelsErrorState
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.15),
                      child: Center(
                          child: Text(
                        state.errorMessage,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                    )
                  : CarouselSlider.builder(
                      options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.35,
                          enlargeCenterPage: true,
                          disableCenter: true,
                          autoPlay: true),
                      itemCount: state.data.isEmpty ? 3 : state.data.length,
                      itemBuilder: (context, index, realIndex) {
                        return state is HotelsLoadingState
                            ? Center(child: LoadingHotelWidget())
                            : GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      HotelDetail2.routeName,
                                      arguments: {
                                        'hotel': state.data[index],
                                      });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                            color: Colors.grey.withOpacity(0.2),
                                            offset: Offset(2, 2))
                                      ]),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.data[index].name,
                                          style: textStyle.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: primary,
                                            ),
                                            Text(
                                              ' ${state.data[index].country} - ${state.data[index].city}',
                                              style: textStyle,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.phone,
                                              color: primary,
                                            ),
                                            Text(
                                              state.data[index].phone,
                                              style: textStyle,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'description:',
                                          style: textStyle,
                                        ),
                                        Text(
                                          state.data[index].description,
                                          style: textStyle,
                                        ),
                                        Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RatingBar.builder(
                                              initialRating:
                                                  state.data[index].reviews,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              updateOnDrag: false,
                                              itemCount: 5,
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Color.fromARGB(
                                                    255, 240, 202, 124),
                                              ),
                                              glow: false,
                                              tapOnlyMode: true,
                                              ignoreGestures: true,
                                              onRatingUpdate: (rating) {},
                                              itemSize: 25,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
                                                        blurRadius: 4,
                                                        spreadRadius: 1,
                                                        offset: Offset(2, 2))
                                                  ]),
                                              child: IconButton(
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                        context: context,
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20),
                                                          ),
                                                        ),
                                                        builder: (_) =>
                                                            LoginSigninWidget(
                                                              errortext:
                                                                  'you are not signed in to set favorite item',
                                                            ));
                                                  },
                                                  icon: Icon(
                                                    Icons.favorite_border,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ]),
                                ),
                              );
                      },
                    );
            }),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                _firstAnimationEnd
                    ? TweenAnimationBuilder(
                        duration: Duration(milliseconds: 400),
                        tween: Tween<double>(begin: 0, end: 1),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    color: Colors.grey.withOpacity(0.2),
                                    offset: Offset(1, 1))
                              ]),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Best Offers',
                            style: GoogleFonts.robotoSlab()
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: value,
                            child: Padding(
                              padding: EdgeInsets.only(top: value * 10),
                              child: child,
                            ),
                          );
                        },
                      )
                    : SizedBox()
              ],
            ),
          ],
        ));
  }
}
