import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotely/blocs/hotel_blocs/hotels_cubit.dart';
import 'package:hotely/blocs/hotel_blocs/hotels_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotely/layout/screens/hotelDetails.dart';
import 'package:hotely/layout/widgets/loading_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HotelsCubit>(context).getTop5Hotels();
    super.initState();
  }

  bool _firstAnimationEnd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Featured'),
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
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Top rated Hotels',
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                        height: MediaQuery.of(context).size.height * 0.4,
                        enlargeCenterPage: true,
                        disableCenter: true,
                      ),
                      itemCount: state.data.isEmpty ? 3 : state.data.length,
                      itemBuilder: (context, index, realIndex) {
                        return state is HotelsLoadingState
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    padding: const EdgeInsets.all(10),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              blurRadius: 4,
                                              spreadRadius: 1,
                                              offset: Offset(2, 2))
                                        ]),
                                    child: LoadingLogo()),
                              )
                            : GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      HotelDetail2.routeName,
                                      arguments: {
                                        'hotel': state.data[index],
                                      });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              blurRadius: 4,
                                              spreadRadius: 1,
                                              offset: Offset(2, 2))
                                        ]),
                                    child: Column(
                                      children: [
                                        Hero(
                                          tag: state.data[index].name,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.25,
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      state.data[index].image,
                                                  fit: BoxFit.fitWidth,
                                                  placeholder: (context, url) =>
                                                      Container(
                                                          width:
                                                              double.infinity,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.25,
                                                          alignment:
                                                              Alignment.center,
                                                          child: Image.asset(
                                                            'assets/images/logo.png',
                                                            fit: BoxFit.contain,
                                                          )),
                                                ),
                                              )),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              state.data[index].name,
                                              style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            RatingBar.builder(
                                              initialRating:
                                                  state.data[index].rate,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              updateOnDrag: false,
                                              itemCount: 5,
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Color.fromARGB(
                                                    255, 240, 202, 124),
                                              ),
                                              glow: false,
                                              tapOnlyMode: true,
                                              ignoreGestures: true,
                                              onRatingUpdate: (rating) {},
                                              itemSize: 25,
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '  \$ ${state.data[index].price.round()}',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 240, 202, 124),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
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
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Best Offers',
                            style: TextStyle(fontWeight: FontWeight.bold),
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
