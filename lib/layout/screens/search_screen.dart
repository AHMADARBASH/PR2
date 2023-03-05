import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
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
                              borderSide: BorderSide(color: Colors.transparent),
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
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(0.5)),
                            hintText: 'Hotel name',
                            fillColor: Theme.of(context).colorScheme.secondary,
                            suffixIcon: searchController.text.isEmpty
                                ? null
                                : IconButton(
                                    icon: Icon(
                                      Icons.clear,
                                      color:
                                          Theme.of(context).colorScheme.primary,
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
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_list_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ))
                ],
              ),
              Expanded(flex: 2, child: Container()),
              Expanded(flex: 2, child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
