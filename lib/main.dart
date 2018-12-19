import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.red,
              width: double.infinity,
              height: 150,
            ),
            Container(
              color: Colors.blue,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      color: Colors.amberAccent,
                      width: double.infinity,
                    ),
                ),
              )
            ),
            Expanded(child: Container()),
            Container(
              color: Colors.black38,
              width: double.infinity,
              height: 50,
            ),
            Container(
              color: Colors.deepPurple,
              width: double.infinity,
              height: 50,
            ),
          ],
        ),
      ),
      ),
    );
  }
}

