import 'package:flutter/material.dart';
import 'User.dart';

class SecondScreen extends StatefulWidget {
  User myUser;

  SecondScreen({super.key, required this.myUser});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  User? user;

  @override
  void initState() {
    user = widget.myUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Go Back'),
            ),
            Text(
                'name : ${user!.name} , username : ${user!.username} , email : ${user!.email}'),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    print('Closing some Fields and connections in SecondScreen');
    super.deactivate();
  }
}
