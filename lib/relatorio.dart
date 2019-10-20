import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:space_apps2019_2/globals.dart' as globals;
import 'package:space_apps2019_2/appBars.dart';
import 'dart:async';


var corPrincipal = globals.corPrincipal;
var corSecundaria = globals.corSecundaria;

class RelatorioScreen extends StatefulWidget {
  @override
  _RelatorioScreenState createState() => _RelatorioScreenState();
}

class _RelatorioScreenState extends State<RelatorioScreen> {

  double metros = 100;
  int tempo = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: DefaulAppBar(),
      ),
      backgroundColor: corSecundaria,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: <Widget>[
            CardCalculaZonaRisco(5.0),
          ],
        ),
      )
    );
  }
}

class CardCalculaZonaRisco extends StatefulWidget {
  double _altitude = 0;

  CardCalculaZonaRisco(this._altitude);

  @override
  _CardCalculaZonaRiscoState createState() => _CardCalculaZonaRiscoState();
}

class _CardCalculaZonaRiscoState extends State<CardCalculaZonaRisco> {
  String _altitudeString = '';
  String _title = 'Warning!';
  String _info = '';
  int _risco = 0;
  double _altura = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          color: globals.corAppBar,
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 125.0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(margin: EdgeInsets.only(top: 6.0), child: Text('Check if you are in a potential risk zone:', style: TextStyle(color: Colors.white, fontSize: 22.0), textAlign: TextAlign.center,)),
                Container(
                  margin: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: corPrincipal,
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: FlatButton(
                    child: Text('Compute', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                    onPressed: () async {
                      
                      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                      _altura = position.altitude;
                      
                      setState(() {

                        if (_altura < 5.0) {
                          _info = 'High chances of being affected by sea level rise up until 2100';
                        } else if (_altura <= 10) {
                          _info = 'Low chances of being affected by sea level rise up until 2100';
                        } else {
                          _info = 'Safely far from risk zones up until 2100';
                        }
                        _altitudeString = (_altura>0)?'${_altura} meters above sea level':'${_altura*-1} meters below sea level';
                        print(_altura);
                      });
                    },
                  )
                )
              ],
            ),
          ),
        ),

        Card(
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        color: globals.corAppBar,
        child: Container(
          height: 312.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(this._title, style: TextStyle(fontSize: 22.0, color: Colors.white),),
                      Text(this._altitudeString, style: TextStyle(fontSize: 20.0, color: Colors.white),),
                    ],
                  ),
                ),
                Image.asset('assets/danger.png', width: 100.0,),
                Text(this._info, style: TextStyle(fontSize: 22.0, color: Colors.white), textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
      )

      ],
    );
  }
}

//<5 - grandes chances de ser afetada pelo mar até 2100
//5m - 10m - poucas chances de ser afetada pelo mar até 2100
// >=10m Distante de possiveis areas afetadas pelo mar ate 2100

class CardResultado extends StatefulWidget {
  int _risco = 3;
  double _altura = 2.3;

  CardResultado(this._risco, this._altura);

  @override
  _CardResultadoState createState() => _CardResultadoState();
}

class _CardResultadoState extends State<CardResultado> {
  double _altitude;
  String _altitudeString = '';

  String _title = 'Cuidado!';

  String _info = '';

  @override
  Widget build(BuildContext context) {
    _altitude = widget._altura;
    switch (widget._risco) {
      case 1:
        _info = 'GRANDES CHANCES DE SER AEFETADO PELO MAR ATÉ 2100';
        break;
      case 2:
        _info = 'POUCAS CHANCES DE SER AFETADO PELO MAR ATÉ 2100';
        break;
      case 3:
        _info = 'DISTANTE DE POSSÍVEIS ÁREAS AFETADAS PELO MAR ATÉ 2100';
        break;
      default:
    }

    return Card(
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      color: globals.corAppBar,
      child: Container(
        height: 312.0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Text(this._title, style: TextStyle(fontSize: 22.0, color: Colors.white),),
                    Text(this._altitudeString, style: TextStyle(fontSize: 18.0, color: Colors.white),),
                  ],
                ),
              ),
              Image.asset('assets/danger.png', width: 100.0,),
              Text(this._info, style: TextStyle(fontSize: 22.0, color: Colors.white), textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}