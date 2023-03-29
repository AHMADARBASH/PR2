import 'package:flutter/material.dart';

class LoginSigninWidget extends StatefulWidget {
  String errortext;
  LoginSigninWidget({super.key, required this.errortext});

  @override
  State<LoginSigninWidget> createState() => _LoginSigninWidgetState();
}

class _LoginSigninWidgetState extends State<LoginSigninWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.errortext,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.login),
            onPressed: () {},
            label: Text('Sign in'),
            style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 1,
                color: Colors.grey.withOpacity(0.4),
                margin: EdgeInsets.symmetric(horizontal: 20),
              ),
              Text(
                'or',
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              Container(
                width: 100,
                height: 1,
                color: Colors.grey.withOpacity(0.4),
                margin: EdgeInsets.symmetric(horizontal: 20),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.person_add),
            onPressed: () {},
            label: Text('Sign up'),
            style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
