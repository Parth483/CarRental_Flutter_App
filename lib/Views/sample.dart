import 'package:carrental/Firebase/firebase.dart';
import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('My World'),
            OutlinedButton(
              onPressed: () {
                FirebaseClass().addtoFirebase(
                  name: 'Parth',
                  number: 9723321270,
                );
              },
              child: Text('Pressed'),
            ),
          ],
        ),
      ),
    );
  }
}
