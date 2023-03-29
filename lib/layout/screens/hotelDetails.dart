import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotely/blocs/auth/auth_cubit.dart';
import 'package:hotely/blocs/auth/auth_states.dart';
import 'package:hotely/layout/widgets/login_signin_widget.dart';

class HotelDetail2 extends StatefulWidget {
  static const String routeName = '/HotelDetail2';
  final String imageD, titleD, idD, typeD, userId;
  final List<String> serviceD, descriptionD;
  final double ratingD, priceD;

  HotelDetail2(
      {required this.imageD,
      required this.titleD,
      required this.priceD,
      required this.idD,
      required this.serviceD,
      required this.descriptionD,
      required this.userId,
      required this.typeD,
      required this.ratingD});

  @override
  _HotelDetail2State createState() => _HotelDetail2State();
}

class _HotelDetail2State extends State<HotelDetail2> {
  /// Check user

  // ignore: unused_field
  String _book = "Book Now";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            /// AppBar
            SliverPersistentHeader(
              delegate: MySliverAppBar(
                  expandedHeight: height - 30.0,
                  img: widget.imageD,
                  id: widget.idD,
                  title: widget.titleD,
                  price: widget.priceD,
                  ratting: widget.ratingD),
              pinned: true,
            ),

            SliverToBoxAdapter(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  /// Description
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
                    child: Text(
                      'details',
                      style: TextStyle(
                          fontFamily: "Sofia",
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 20.0, right: 20.0, bottom: 0.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.descriptionD
                            .map((item) => Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 10.0, bottom: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        child: new Text(
                                          item,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              fontFamily: "Sofia",
                                              color: Colors.black54,
                                              fontSize: 18.0),
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList()),
                  ),

                  /// service
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40.0, left: 20.0, right: 20.0, bottom: 10.0),
                    child: Text(
                      'services',
                      style: TextStyle(
                          fontFamily: "Sofia",
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  //Text(_nama),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 20.0, right: 20.0, bottom: 0.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.serviceD
                            .map((item) => Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 10.0, bottom: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "-   ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24.0),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        child: new Text(
                                          item,
                                          style: TextStyle(
                                              fontFamily: "Sofia",
                                              color: Colors.black54,
                                              fontSize: 18.0),
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList()),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40.0, left: 20.0, right: 20.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'images',
                          style: TextStyle(
                              fontFamily: "Sofia",
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 20.0, right: 0.0, bottom: 40.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          height: 150.0, child: Image.network(widget.imageD)),
                    ),
                  ),

                  // Review

                  /// Button
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, bottom: 10.0),
                            child: InkWell(
                              onTap: () async {
                                state.isAuthenticated
                                    ? showModalBottomSheet(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        context: context,
                                        builder: (_) => LoginSigninWidget(
                                              errortext:
                                                  'please login before booking',
                                            ))
                                    : showModalBottomSheet(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        context: context,
                                        builder: (_) => Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  width: 50,
                                                  height: 5,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                ),
                                              ],
                                            ));
                              },
                              child: Container(
                                height: 55.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Color.fromARGB(255, 240, 202, 124),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 4,
                                        spreadRadius: 1,
                                        offset: Offset(3, 3))
                                  ],
                                ),
                                child: const Center(
                                  child: Text(
                                    'book now',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        fontFamily: "Sofia",
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10, right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 4,
                                    spreadRadius: 1,
                                    offset: Offset(2, 2))
                              ]),
                          child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    builder: (_) => LoginSigninWidget(
                                          errortext:
                                              'you are not signed in to set favorite item',
                                        ));
                              },
                              icon: Icon(
                                Icons.favorite_border,
                                color: Theme.of(context).colorScheme.primary,
                              )),
                        )
                      ],
                    ),
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  String img, id, title;
  num price;
  double ratting;

  MySliverAppBar(
      {required this.expandedHeight,
      required this.img,
      required this.id,
      required this.title,
      required this.price,
      required this.ratting});

  var _txtStyleTitle = TextStyle(
    color: Colors.black54,
    fontFamily: "Sofia",
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
  );

  var _txtStyleSub = TextStyle(
    color: Colors.black26,
    fontFamily: "Sofia",
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          height: 50.0,
          width: double.infinity,
          color: Colors.white,
        ),
        Hero(
          tag: title,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(img),
              ),
              shape: BoxShape.rectangle,
            ),
            child: Container(
              margin: EdgeInsets.only(top: 620.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.0, 1.0),
                  stops: [0.0, 1.0],
                  colors: <Color>[
                    Color(0x00FFFFFF),
                    Color(0xFFFFFFFF),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20.0, right: 20.0, left: 20.0, bottom: 40.0),
            child: Container(
              height: 170.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  width: 210.0,
                                  child: Text(
                                    title,
                                    style:
                                        _txtStyleTitle.copyWith(fontSize: 27.0),
                                    overflow: TextOverflow.clip,
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(right: 13.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "\$ " + price.toString(),
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          color: Color(0xFF09314F),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Gotik"),
                                    ),
                                    Text('per night',
                                        style: _txtStyleSub.copyWith(
                                            fontSize: 11.0))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  RatingBar.builder(
                                    initialRating: ratting,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    updateOnDrag: false,
                                    itemCount: 5,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Color.fromARGB(255, 240, 202, 124),
                                    ),
                                    glow: false,
                                    tapOnlyMode: true,
                                    ignoreGestures: true,
                                    onRatingUpdate: (rating) {},
                                    itemSize: 25,
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40.0),
                            ),
                            color: Colors.white70,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                    ))),
            SizedBox(
              width: 36.0,
            )
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
