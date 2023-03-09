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
  final _Duration = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                            textInputAction: TextInputAction.search,
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
                      ? FadeInUp(
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
                                  onChangeEnd: (value) => setState(() {}),
                                  onChanged: (value) {
                                    setState(() {
                                      _startValue = value.start;
                                      _endValue = value.end;
                                    });
                                  })
                            ],
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
