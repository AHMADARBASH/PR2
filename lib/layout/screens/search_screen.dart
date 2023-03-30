import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotely/blocs/hotels/hotels_cubit.dart';
import 'package:hotely/blocs/hotels/hotels_state.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  bool _filtered = false;
  double _startValue = 0;
  double _endValue = 1000;
  bool _PoolValue = false;
  bool _SeaVisionValue = false;
  bool _SaunaValue = false;
  bool _ResturantValue = false;
  bool _GymValue = false;
  bool _PartyValue = false;
  bool _ClothsCleanValue = false;

  final _Duration = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: () {
              BlocProvider.of<HotelsCubit>(context).searchForHotel();
            },
            child: Icon(Icons.search)),
        appBar: AppBar(
            title: Text('Search', style: GoogleFonts.robotoSlab().copyWith())),
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<HotelsCubit, HotelsState>(
          builder: (context, state) => Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                FadeInDown(
                  duration: _Duration,
                  curve: Curves.easeOutQuart,
                  child: Row(
                    children: [
                      StatefulBuilder(
                        builder: (context, newSetState) => Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      offset: Offset(0, 3))
                                ]),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.grey),
                              controller: searchController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).errorColor,
                                        width: 1)),
                                filled: true,
                                hintStyle: GoogleFonts.robotoSlab().copyWith(
                                    color: Colors.grey.withOpacity(0.5)),
                                hintText: 'Hotel name',
                                fillColor:
                                    Theme.of(context).colorScheme.secondary,
                                suffixIcon: searchController.text.isEmpty
                                    ? null
                                    : IconButton(
                                        icon: Icon(
                                          Icons.clear,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        onPressed: () {
                                          newSetState(() {
                                            searchController.clear();
                                          });
                                        },
                                      ),
                              ),
                              textInputAction: TextInputAction.done,
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  return;
                                }
                                newSetState(() {});
                              },
                              onEditingComplete: () {
                                FocusScope.of(context).unfocus();
                              },
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _filtered = !_filtered;
                              if (_filtered) {
                                _PoolValue = false;
                                _SeaVisionValue = false;
                                _SaunaValue = false;
                                _ResturantValue = false;
                                _GymValue = false;
                                _PartyValue = false;
                                _ClothsCleanValue = false;
                              }
                            });
                          },
                          icon: Icon(
                            _filtered
                                ? Icons.filter_list_off
                                : Icons.filter_list_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _filtered
                    ? StatefulBuilder(
                        builder: (context, newSetState) => FadeIn(
                          curve: Curves.easeOutQuart,
                          duration: _Duration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Room Price: \$${_startValue.round()} - \$${_endValue.round()}',
                                style: GoogleFonts.robotoSlab().copyWith(),
                              ),
                              RangeSlider(
                                  max: 1000,
                                  min: 0,
                                  divisions: 100,
                                  values: RangeValues(_startValue, _endValue),
                                  onChangeEnd: (value) => newSetState(() {}),
                                  onChanged: (value) {
                                    newSetState(() {
                                      _startValue = value.start;
                                      _endValue = value.end;
                                    });
                                  }),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Sea Vision'),
                                  Checkbox(
                                      activeColor:
                                          Theme.of(context).colorScheme.primary,
                                      value: _SeaVisionValue,
                                      onChanged: (value) {
                                        newSetState(
                                          () => _SeaVisionValue = value!,
                                        );
                                      }),
                                  Text('Cloths Clean'),
                                  Checkbox(
                                      activeColor:
                                          Theme.of(context).colorScheme.primary,
                                      value: _ClothsCleanValue,
                                      onChanged: (value) {
                                        newSetState(
                                          () => _ClothsCleanValue = value!,
                                        );
                                      }),
                                  Text('Resturant'),
                                  Checkbox(
                                      activeColor:
                                          Theme.of(context).colorScheme.primary,
                                      value: _ResturantValue,
                                      onChanged: (value) {
                                        newSetState(
                                          () => _ResturantValue = value!,
                                        );
                                      }),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Pool'),
                                  Checkbox(
                                      activeColor:
                                          Theme.of(context).colorScheme.primary,
                                      value: _PoolValue,
                                      onChanged: (value) {
                                        newSetState(
                                          () => _PoolValue = value!,
                                        );
                                      }),
                                  Text('Gym'),
                                  Checkbox(
                                      activeColor:
                                          Theme.of(context).colorScheme.primary,
                                      value: _GymValue,
                                      onChanged: (value) {
                                        newSetState(
                                          () => _GymValue = value!,
                                        );
                                      }),
                                  Text('Party'),
                                  Checkbox(
                                      activeColor:
                                          Theme.of(context).colorScheme.primary,
                                      value: _PartyValue,
                                      onChanged: (value) {
                                        newSetState(
                                          () => _PartyValue = value!,
                                        );
                                      }),
                                  Text('Sauna'),
                                  Checkbox(
                                      activeColor:
                                          Theme.of(context).colorScheme.primary,
                                      value: _SaunaValue,
                                      onChanged: (value) {
                                        newSetState(
                                          () => _SaunaValue = value!,
                                        );
                                      }),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'apply',
                                        style:
                                            GoogleFonts.robotoSlab().copyWith(),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 10,
                      ),
                SizedBox(
                  height: 10,
                ),
                state is HotelsLoadingState
                    ? Expanded(
                        flex: 8,
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) => Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.12,
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 2.5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 4,
                                      spreadRadius: 1,
                                      offset: Offset(2, 2))
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(children: [
                              Expanded(
                                  flex: 1,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[200]!,
                                    highlightColor: Colors.white,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[600],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      margin: EdgeInsets.all(5),
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Shimmer.fromColors(
                                            baseColor: Colors.grey[200]!,
                                            highlightColor: Colors.white,
                                            child: Container(
                                              width: 100,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[600],
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              margin: EdgeInsets.all(5),
                                            ),
                                          ),
                                          Shimmer.fromColors(
                                            baseColor: Colors.grey[200]!,
                                            highlightColor: Colors.white,
                                            child: Container(
                                              width: 200,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[600],
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              margin: EdgeInsets.all(5),
                                            ),
                                          ),
                                          Shimmer.fromColors(
                                            baseColor: Colors.grey[200]!,
                                            highlightColor: Colors.white,
                                            child: Container(
                                              width: 150,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[600],
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              margin: EdgeInsets.all(5),
                                            ),
                                          ),
                                        ]),
                                  )),
                            ]),
                          ),
                        ),
                      )
                    : state is HotelsSearchState
                        ? state.data.isNotEmpty
                            ? Expanded(
                                flex: 8,
                                child: ListView.builder(
                                    itemCount: state.data.length,
                                    itemBuilder: (context, index) => InkWell(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          onTap: () {},
                                          child: FadeInUp(
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.easeOutQuart,
                                            delay: Duration(
                                                milliseconds: 100 * index),
                                            child: Container(
                                              width: double.infinity,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.12,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 2.5),
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
                                                        blurRadius: 4,
                                                        spreadRadius: 1,
                                                        offset: Offset(2, 2))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(children: [
                                                Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      margin: EdgeInsets.all(5),
                                                    )),
                                                Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      margin: EdgeInsets.all(5),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Text(
                                                              state.data[index]
                                                                  .name,
                                                              style: GoogleFonts
                                                                      .robotoSlab()
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                            ),
                                                            Text(
                                                              state.data[index]
                                                                  .city,
                                                              style: GoogleFonts
                                                                      .robotoSlab()
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .grey),
                                                            ),
                                                            RatingBar.builder(
                                                              initialRating:
                                                                  state
                                                                      .data[
                                                                          index]
                                                                      .reviews,
                                                              direction: Axis
                                                                  .horizontal,
                                                              allowHalfRating:
                                                                  true,
                                                              updateOnDrag:
                                                                  false,
                                                              itemCount: 5,
                                                              itemBuilder:
                                                                  (context,
                                                                          _) =>
                                                                      const Icon(
                                                                Icons.star,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        240,
                                                                        202,
                                                                        124),
                                                              ),
                                                              glow: false,
                                                              tapOnlyMode: true,
                                                              ignoreGestures:
                                                                  true,
                                                              onRatingUpdate:
                                                                  (rating) {},
                                                              itemSize: 20,
                                                            )
                                                          ]),
                                                    )),
                                              ]),
                                            ),
                                          ),
                                        )),
                              )
                            : Text(
                                'no result found',
                                style: GoogleFonts.robotoSlab().copyWith(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )
                        : SizedBox(),
                Expanded(flex: 2, child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
