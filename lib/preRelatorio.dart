import 'package:flutter/material.dart';
import 'package:space_apps2019_2/globals.dart' as globals;
import 'package:space_apps2019_2/relatorio.dart';

bool ok;
double _lat;
double _lng;
double _seaLevel;

class PreRelatorio extends StatefulWidget {
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  _PreRelatorioState createState() => _PreRelatorioState();
}

class _PreRelatorioState extends State<PreRelatorio> {
  @override
  initState() {
    super.initState();

    ok = false;
    _lat = 0.0;
    _lng = 0.0;
    _seaLevel = 0.0;
  }

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: globals.corSecundaria,
      appBar: AppBar(
        backgroundColor: globals.corAppBar,
        flexibleSpace: Container(
          margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
          child: Image.asset('assets/logo.png', height: 65,),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            //Container Info
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: Card(
                color: Colors.white,
                child: Container(margin: EdgeInsets.all(6.0), child: Text('Enter the latitude and longitude of a location, and choose the time to know what the terrain will look like in the future: ', style: TextStyle(color: globals.corAppBar, fontSize: 20.0),)),
              ),
            ),
            //Container date
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.white),
              ),
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
              margin: EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  labelText: 'Date',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 23.0),
                ),
                onChanged: (value) {
                  _seaLevel = double.parse(value)*0.004;
                  // _seaLevel = double.parse(value);
                  if (value.length==0) {
                    print('ok = false');
                    ok = false;
                  } else {
                    print('ok = true');
                    ok = true;
                  }
                },
              ),
            ),

            //Container Lat Lng
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.white),
                ),
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //! CURRENT LOCATION BUTTON
                    Container(
                      // margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 25.0),
                      decoration: BoxDecoration(
                        color: globals.corPrincipal,
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: FlatButton(
                        child: Text('Use Current Location', style: TextStyle(color: Colors.white, fontSize: 25.0),),
                        onPressed: () { 
                          PreRelatorio._formKey.currentState.save();  
                          if (ok == true) {
                            Map map = {
                              'opcao': 'userLocation',
                              'seaLevel': _seaLevel,
                            };
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RelatorioScreen(map)));
                          } else {
                            print('Escolha uma data!');
                          }
                        },
                      ),
                    ),

                    //Label OK
                    Text(
                      'Or',
                      style: TextStyle(fontSize: 25.0, color: globals.corPrincipal),
                    ),

                    //Container LAT LNG
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Form(
                        key: PreRelatorio._formKey,
                        child: Column(
                          children: <Widget>[
                            //LAT
                            TextFormField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Latitude',
                                labelStyle: TextStyle(color: Colors.white, fontSize: 23.0),
                              ),
                              onChanged: (value) => _lat = double.parse(value),
                            ),
                            //LNG
                            TextFormField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Longitude',
                                  labelStyle: TextStyle(color: Colors.white, fontSize: 23.0),
                                ),
                                onChanged: (value) => _lng = double.parse(value),
                              ),
                          ],
                        ),
                      ),
                    ),

                    //! CALCULATE BUTTON
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      decoration: BoxDecoration(
                        color: globals.corPrincipal,
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: FlatButton(
                        child: Text('Calculate', style: TextStyle(fontSize: 25.0, color: Colors.white),),
                        onPressed: () {
                          PreRelatorio._formKey.currentState.save();  
                          if (_lat != 0.0 && _lng != 0.0 && ok) {
                            Map map = {
                              'opcao': 'LatLng',
                              'seaLevel': _seaLevel,
                              'lat': _lat,
                              'lng': _lng
                            };
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RelatorioScreen(map)));
                            // print('MAP: '+map.toString());
                          }
                        },
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      /* body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.white,
                  child: Container(margin: EdgeInsets.all(6.0), child: Text('Enter the latitude and longitude of a location, and choose the time to know what the terrain will look like in the future: ', style: TextStyle(color: globals.corAppBar, fontSize: 20.0),)),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 30.0),
                child: Column(
                  children: <Widget>[

                    //! INPUTS LAT AND LNG
                    Form(
                      key: _formKey,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  color: Colors.white
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Latitude',
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                                onSaved: (value) => _lat = double.parse(value),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  color: Colors.white
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Longitude',
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                                onSaved: (value) => _lng = double.parse(value),
                              ),
                            ),
                          ),

                          //! INPUT YEARS
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  color: Colors.white
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Years',
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                                onSaved: (value) {
                                  _seaLevel = double.parse(value)*0.004;
                                  ok = true;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                    //! CALCULATE BUTTON
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      decoration: BoxDecoration(
                        color: globals.corPrincipal,
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: FlatButton(
                        child: Text('Calculate', style: TextStyle(fontSize: 25.0, color: Colors.white),),
                        onPressed: () {
                          _formKey.currentState.save();  
                          if (_lat != 0.0 && _lng != 0.0) {
                            Map map = {
                              'opcao': 'LatLng',
                              'seaLevel': _seaLevel,
                              'lat': _lat,
                              'lng': _lng
                            };
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RelatorioScreen(map)));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 60.0, top: 30.0),
                child: Text('Or', style: TextStyle(fontSize: 25, color: globals.corPrincipal),),
              ),

              //! CURRENT LOCATION BUTTON
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 25.0),
                decoration: BoxDecoration(
                  color: globals.corPrincipal,
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: FlatButton(
                  child: Text('Use Current Location', style: TextStyle(color: Colors.white, fontSize: 25.0),),
                  onPressed: () { 
                    _formKey.currentState.save();  
                    if (ok) {
                      Map map = {
                        'opcao': 'userLocation',
                        'seaLevel': _seaLevel,
                      };
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RelatorioScreen(map)));
                    } else {
                      print('Escolha uma data!');
                    }
                  },
                ),
              ),

            ],
          ),
        ),
      ), */
    );
  }
}