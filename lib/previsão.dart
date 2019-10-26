import 'package:flutter/material.dart';

class ProjectionScreen extends StatefulWidget {
  @override
  _ProjectionScreenState createState() => _ProjectionScreenState();
}

class _ProjectionScreenState extends State<ProjectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.height,
        // child: Image.asset('assets/quizl.png', fit: BoxFit.fitHeight,),
        // child: Text('Oi')
      ),
    );
  }
}