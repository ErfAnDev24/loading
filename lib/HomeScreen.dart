import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:testingnet/SecondScreen.dart';
import 'package:testingnet/User.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? enteredUser;
  bool showingLoad = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: !showingLoad ? getBTN() : getLoadSpinKit(),
        ),
      ),
    );
  }

  void getData() async {
    setState(() {
      showingLoad = true;
    });

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users/1');

    var response = await get(uri);

    setState(() {
      var name = jsonDecode(response.body)['name'];
      var username = jsonDecode(response.body)['username'];
      var email = jsonDecode(response.body)['email'];

      enteredUser = User(name, username, email);
    });
  }

  Widget getLoadSpinKit() {
    setState(() {
      showingLoad = false;
    });
    return SpinKitFadingCircle(
      duration: Duration(seconds: 3),
      size: 50,
      color: Colors.red,
    );
  }

  Widget getBTN() {
    return TextButton(
      onPressed: () {
        getData();

        if (enteredUser == null) {
          return;
        }

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SecondScreen(myUser: enteredUser!),
          ),
        );
      },
      child: Text('Next Widget'),
    );
  }
}
