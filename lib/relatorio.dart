import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:space_apps2019_2/globals.dart' as globals;
import 'package:space_apps2019_2/appBars.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

var corPrincipal = globals.corPrincipal;
var corSecundaria = globals.corSecundaria;
double average = 0.0;
int start = 0;
var imageMapa;

List<Widget> linha = [];
List<List<Widget>> matrix = [];

List<Container> mapa = [];

class RelatorioScreen extends StatefulWidget {
  Map info = {};

  RelatorioScreen(this.info);
  @override
  _RelatorioScreenState createState() => _RelatorioScreenState(this.info);
}

Future teste(double lat, double lng, double seaLevel) async {
  print(lat.toString());
  print(lng.toString());
  print(seaLevel.toString());

  print('LAT|LNG');
  return await 1;
}

class _RelatorioScreenState extends State<RelatorioScreen> {

  Map info = {};
  double metros = 100;
  int tempo = 50;


  _RelatorioScreenState(this.info);

  @override
  Widget build(BuildContext context) {

    print(info.toString());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: DefaulAppBar(),
      ),
      backgroundColor: corSecundaria,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 14.0),
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: (info['opcao']=='userLocation')?getUserLocation():teste(this.info['lat'], this.info['lng'], this.info['seaLevel']),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  // case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Text("Espera Arrombaado");
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Text('Erro Cuzão');
                    }
                    return Container(
                      child: FutureBuilder(
                        // future: getAlt(info['lat'], info['lng'], info['seaLevel']),
                        future: getAlt(snapshot.data['lat'], snapshot.data['lng'], info['seaLevel']),
                        // future: getAlt((info['opcao']=='userLocation')?snapshot.data['lat']:this.info['lat'], (info['opcao']=='LatLng')?snapshot.data['lng']:this.info['lng'], info['seaLevel']),
                        builder: (context, snapshot2) {
                          switch (snapshot2.connectionState) {
                            case ConnectionState.none:
                              return Text('Nenhum dado');
                              break;
                            case ConnectionState.waiting:
                              return Text("Espera Arrombaado2");
                              break;
                            case ConnectionState.done:
                              if (snapshot.hasError) {
                                return Text('Erro2 Cuzão');
                              }
                              
                              matrix = [];
                              for (int i = 0; i < 11; i++) {
                                linha = [];
                                for (int j = 0; j < 11; j++) {
                                  // linha.add(Expanded(child: Text(snapshot2.data[i][j].toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)));
                                  linha.add(
                                    Expanded(
                                      child: Opacity(
                                        opacity: (snapshot2.data[i][j] == 0)?0.5:0.0,
                                        // opacity: 0.5,
                                        child: Container(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    )
                                  );
                                }
                                matrix.add(linha.toList());
                                linha.clear();
                              }

                              // print(snapshot2.data.toString());
                              print(info['lat']);
                              print(info['lng']);

                              return Container(
                                // height: 200.0,
                                child: Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        child: Stack(
                                          children: <Widget>[
                                            Image.network('https://maps.googleapis.com/maps/api/staticmap?,NY&zoom=18&size=500x500&maptype=roadmap&markers=color:red|label:C|-20.9079171,-42.027304&key=AIzaSyBDJMFWbCoU9tAkMefeGJKGfafiHPoV8MI'),
                                            Column(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Row(
                                                    children: matrix[0],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: matrix[1],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: matrix[2],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: matrix[3],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: matrix[4],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: matrix[5],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: matrix[6],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: matrix[7],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: matrix[8],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: matrix[9],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: matrix[10],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),


                                      Column(
                                        children: <Widget>[
                                          //! CONTAINER SEA LEVEL TEXT
                                          Container(
                                            child: Text('SeaLevel: ${info['seaLevel'].toString()} meters', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                                          ),
                                          //! CONTAINER AVERAGE HEIGHT
                                          Container(
                                            child: Text('Average Height: ${average.toStringAsPrecision(5)} meters', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                                          ),
                                          //! CONTAINER AVERAGE HEIGHT
                                          Container(
                                            child: Text('Suggested Year: ${start.toString()} years', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                                          ),
                                        ],
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              );
                              break;
                            default:
                          }
                        },
                      ),
                    );
                    break;
                  default:
                }
              },
            ),
      //       // CardCalculaZonaRisco(5.0),
          ],
        ),
      )
    );
  }
}

Future getUserLocation() async {
  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  var _altura = position.altitude;
  var _lat = position.latitude;
  var _lng = position.longitude;

  var map = {
    'lat': _lat,
    'lng': _lng
  };

  return map;
}

 Future<List<List<int>>> getAlt(double lat, double lng, double seaLevel) async {

  // String request = 'https://api.open-elevation.com/api/v1/lookup?locations=41.161758,-8.583933';
  List<List<int>> matrix = [];
  List<int> list = [];
  double newLat;
  double newLng;

  print(lat);
  print(lng);

  double sum = 0;
  int aux = 0;

  String request2 = 'https://maps.googleapis.com/maps/api/staticmap?,NY&zoom=18&size=500x500&maptype=roadmap&markers=color:red|label:C|-20.9079171,-42.027304&key=AIzaSyBDJMFWbCoU9tAkMefeGJKGfafiHPoV8MI';
  imageMapa = await http.get(request2);

  for (int i = 5; i > -6; i--) {
    list = [];
    for (int j = -5; j < 6; j++) {
      newLat = (lat + (i * 0.0006));
      newLng = (lng + (j * 0.0006));

      String request = 'https://maps.googleapis.com/maps/api/elevation/json?locations=${newLat.toString()},${newLng.toString()}&key=AIzaSyDuZD3f0LWsR4q2O0erzuvgkCMyCXKmmog';
      // https://maps.googleapis.com/maps/api/staticmap?,NY&zoom=4&size=500x500&maptype=roadmap&markers=color:blue%7Clabel:S%7C-41.3372097,-21.756472&markers=color:green%7Clabel:G%-21.756472,-41.3372097&markers=color:red%7Clabel:C%7C-20.9079171,-42.027304&key=AIzaSyBDJMFWbCoU9tAkMefeGJKGfafiHPoV8MI
      try {
        var myJson = await http.get(request).timeout(Duration(seconds: 5));
        var parsedJson = json.decode(myJson.body);

        var altitude = parsedJson['results'][0]['elevation'];
        // print(altitude.toString() + ' | ' + seaLevel.toString());
        sum = sum + altitude;

        if (altitude > seaLevel) {
          list.add(1);
          print('1');
        } else {
          list.add(0);
          print('0');
        }
        // list.add(0);
      } on TimeoutException catch (_) {
        list.add(0);
      } catch (e) {
        list.add(0);
      }
      

    }
    matrix.add(list);
  }

  //! CALCULATING THE AVERAGE HEIGHT
  average = sum/121;

  //!CALCULATING THE SUGGESTED YEARS TO SUBMERGE PART OF THE AREA
  start = (average~/0.004);

  return matrix;
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
  var _altura;
  double _lat;
  double _lng;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Column(
    //     children: <Widget>[
    //       Card(
    //         color: globals.corAppBar,
    //         margin: EdgeInsets.symmetric(horizontal: 10.0),
    //         child: Container(
    //           height: 125.0,
    //           width: MediaQuery.of(context).size.width,
    //           child: Column(
    //             children: <Widget>[
    //               Container(margin: EdgeInsets.only(top: 6.0), child: Text('Check if you are in a potential risk zone:', style: TextStyle(color: Colors.white, fontSize: 22.0), textAlign: TextAlign.center,)),
    //               Container(
    //                 margin: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
    //                 width: MediaQuery.of(context).size.width,
    //                 decoration: BoxDecoration(
    //                   color: corPrincipal,
    //                   borderRadius: BorderRadius.circular(5.0)
    //                 ),
    //                 child: FlatButton(
    //                   child: Text('Compute', style: TextStyle(color: Colors.white, fontSize: 20.0),),
    //                   onPressed: () async {
                        
    //                     Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    //                     _altura = position.altitude;
    //                     _lat = position.latitude;
    //                     _lng = position.longitude;


    //                     // list = [];

    //                     if (_altura < 5.0) {
    //                       _info = 'High chances of being affected by sea level rise up until 2100';
    //                     } else if (_altura <= 10) {
    //                       _info = 'Low chances of being affected by sea level rise up until 2100';
    //                     } else {
    //                       _info = 'Safely far from risk zones up until 2100';
    //                     }
    //                     _altitudeString = (_altura>=0)?'${_altura} meters above sea level':'${_altura*-1} meters below sea level';
                        

    //                     double newLat;
    //                     double newLng;

    //                     var malha = getAlt(_lat, _lng, 15.0);

    //                     print(malha.then((onValue) {
    //                       print(onValue[0][0]);
    //                       print(onValue[0][1]);
    //                       print(onValue[1][0]);
    //                       print(onValue[1][1]);
    //                     }));

    //                       // print(malha.then((linhas) {
    //                       //   linhas.forEach((f) {
    //                       //     print(f[1]);
    //                       //   });
    //                       // }));

    //                   },
    //                 )
    //               )
    //             ],
    //           ),
    //         ),
    //       ),

        //   Card(
        //   margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        //   color: globals.corAppBar,
        //   child: Container(
        //     height: 312.0,
        //     child: Container(
        //       width: MediaQuery.of(context).size.width,
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: <Widget>[
        //           Container(
        //             child: Column(
        //               children: <Widget>[
        //                 Text(this._title, style: TextStyle(fontSize: 22.0, color: Colors.white),),
        //                 Text(this._altitudeString, style: TextStyle(fontSize: 20.0, color: Colors.white),),
        //               ],
        //             ),
        //           ),
        //           Image.asset('assets/danger.png', width: 100.0,),
        //           Text(this._info, style: TextStyle(fontSize: 22.0, color: Colors.white), textAlign: TextAlign.center,),
        //         ],
        //       ),
        //     ),
        //   ),
        // )

    //     ],
    //   ),
    // );
    // linha = [];
    // var malha = getAlt(_lat, _lng, 15.0);

    // setState(() {

    //   malha.then((value) {
    //     for (int i = 0; i < 7; i++) {
    //       for (int j = 0; j < 7; j++) {
    //         print(value[0][0]);
    //       }
    //     }
    //   });

    //   for (int i = 0; i < 10; i++) {
    //     linha.add(Pixel(0.2));
    //     linha.add(Pixel(0.5));
    //   } 
    // });

    // matrix = [linha, linha, linha];

    // Color cor = Colors.red;


    // return FutureBuilder(
    //   future: getAlt(lat, lng, altMin),
    // );

    // return Expanded(
    //   child: Container(
    //     child: Column(
    //       children: <Widget>[
    //         //! MAPA AQUI!
    //         Container(
    //           child: Column(
    //             children: <Widget>[
    //               Row(
    //                 children: matrix[0],
    //               ),
    //               Row(
    //                 children: matrix[1],
    //               ),
    //               Row(
    //                 children: matrix[2],
    //               ),
                  // Row(
                  //   children: matrix[3],
                  // ),
                  // Row(
                  //   children: matrix[4],
                  // ),
                  // Row(
                  //   children: matrix[5],
                  // ),
                  // Row(
                  //   children: matrix[6],
                  // ),
    //             ],
    //           )
    //         ),

    //         //! BOTAO CALCULAR
    //         RaisedButton(
    //           onPressed: () {
    //             setState(() {
    //             });
    //           },
    //           child: Text('oie'),
    //         )
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   color: Colors.blue,
            //   child: FlatButton(
            //     child: Text('Calculate'),
            //     onPressed: () {
                  // Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                  // _altura = position.altitude;
                  // _lat = position.latitude;
                  // _lng = position.longitude;

                  // var malha = getAlt(_lat, _lng, 15.0);

                  // setState(() {
                  //   linha = [
                  //     Text('chupa'),
                  //     Text('oi'),
                  //     Text('cuzao')
                  //   ]; 

                  //   cor = Colors.yellow;

                  //   matrix = [linha, linha, linha];
                  //   print(matrix[1]);
                  // });
            //       setState(() {
            //        cor = Colors.yellow; 
            //       });

            //     },
            //   ),
            // )
    //       ],
    //     ),
    //   ),
    // );
  }
}

class Pixel extends StatefulWidget {
  double _opacidade;
  Pixel(this._opacidade);
  @override
  _PixelState createState() => _PixelState(this._opacidade);
}

class _PixelState extends State<Pixel> {
  double _opacidade;
  _PixelState(this._opacidade);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Opacity(
        opacity: _opacidade,
        child: Container(
          width: 10.0,
          height: 10.0,
          color: Colors.blue,
        ),
      ),
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