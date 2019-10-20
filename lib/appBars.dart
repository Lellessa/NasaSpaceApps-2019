import 'package:flutter/material.dart';
import 'package:space_apps2019_2/globals.dart' as globals;

class DefaulAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: globals.corAppBar,
        flexibleSpace: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 20),
          child: Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Container(margin: EdgeInsets.only(right: 10.0) , child: Image.asset('assets/logo.png', height: 65,)),
          ),
        ),
    );
  }
}

class AppBarSolucao extends StatelessWidget {
  String _title;

  AppBarSolucao(this._title);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: globals.corAppBar,
        flexibleSpace: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Container(margin: EdgeInsets.only(right: 10.0) , child: Image.asset('assets/logo.png', height: 65,)),
              ),
              Container(
                child: Text(this._title, style: TextStyle(fontSize: 25.0, color: Colors.white),),
              )
            ],
          ),
        ),
    );
  }
}