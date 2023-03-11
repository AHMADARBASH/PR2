import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

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
            onPressed: () {},
            child: Icon(Icons.search)),
        appBar: AppBar(title: Text('Search')),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              FadeInDown(
                duration: _Duration,
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
                              hintStyle: TextStyle(
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
              Expanded(
                  flex: 2,
                  child: _filtered
                      ? StatefulBuilder(
                          builder: (context, newSetState) => FadeIn(
                            duration: _Duration,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Room Price: \$${_startValue.round()} - \$${_endValue.round()}'),
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
                                        activeColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        value: _SeaVisionValue,
                                        onChanged: (value) {
                                          newSetState(
                                            () => _SeaVisionValue = value!,
                                          );
                                        }),
                                    Text('Cloths Clean'),
                                    Checkbox(
                                        activeColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        value: _ClothsCleanValue,
                                        onChanged: (value) {
                                          newSetState(
                                            () => _ClothsCleanValue = value!,
                                          );
                                        }),
                                    Text('Resturant'),
                                    Checkbox(
                                        activeColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
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
                                        activeColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        value: _PoolValue,
                                        onChanged: (value) {
                                          newSetState(
                                            () => _PoolValue = value!,
                                          );
                                        }),
                                    Text('Gym'),
                                    Checkbox(
                                        activeColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        value: _GymValue,
                                        onChanged: (value) {
                                          newSetState(
                                            () => _GymValue = value!,
                                          );
                                        }),
                                    Text('Party'),
                                    Checkbox(
                                        activeColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        value: _PartyValue,
                                        onChanged: (value) {
                                          newSetState(
                                            () => _PartyValue = value!,
                                          );
                                        }),
                                    Text('Sauna'),
                                    Checkbox(
                                        activeColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        value: _SaunaValue,
                                        onChanged: (value) {
                                          newSetState(
                                            () => _SaunaValue = value!,
                                          );
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container()),
              SizedBox(
                height: 10,
              ),
              Expanded(flex: 2, child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
