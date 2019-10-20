import 'package:flutter/material.dart';
import 'package:space_apps2019_2/relatorio.dart';
import 'package:space_apps2019_2/causas.dart';
import 'package:space_apps2019_2/solucao.dart';
import 'package:space_apps2019_2/globals.dart' as globals;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var corPrincipal = globals.corPrincipal;
  var corSecundaria = globals.corSecundaria;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: globals.corAppBar,
          flexibleSpace: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20),
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Container(margin: EdgeInsets.only(right: 10.0) , child: Image.asset('assets/logo.png', height: 65,)),
            ),
          ),
        ),
      ),
      backgroundColor: corSecundaria,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: corPrincipal,
                              ),
                              width: 180.0,
                              height: 180.0,
                              child: FlatButton(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Image.asset('assets/previsao.png', height: 80.0,),
                                      Container(margin: EdgeInsets.only(top: 10.0, bottom: 30.0), child: Text('Projection', style: TextStyle(color: Colors.white, fontSize: 26.0),))
                                    ],
                                  )
                                ),
                                onPressed: () {},
                              )
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: corPrincipal,
                              ),
                              width: 180.0,
                              height: 180.0,
                              child: FlatButton(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Image.asset('assets/causas.png', height: 80.0),
                                      Container(margin: EdgeInsets.only(top: 10.0, bottom: 30.0), child: Text('Causes', style: TextStyle(color: Colors.white, fontSize: 26.0),))
                                    ],
                                  )
                                ),
                                onPressed: () {
                                  String info = 'Every year, the equivalent of over 800,000 Empire State Buildings made of ice fall into the oceans. The biggest sources of ice melt are the glaciers from Antartica and Greenland. Antartica holds 90% of Earth\'s Ice. In 2014, 303 gigatons of ice were lost from the Greenland ice sheet, adding that volume to the oceans. That\'s equivalent to a pool that\'s 25m wide and 6 billion meters long, which could stretch from the Earth to the moon and back 16 times. The Greenland contains enough ice to raise the sea level by +/- 6m and the Antartic ice sheet holds enough ice to raise the seas by +/- 58m. Ice melt can also come from alpines (glaciers in mountains and valleys).';
                                  String causa = 'Ice Melt';
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CausasScreen('assets/causa1.jpeg', causa, info, 0)));
                                },
                              )
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                    Container(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: corPrincipal,
                              ),
                              width: 180.0,
                              height: 180.0,
                              child: FlatButton(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Image.asset('assets/relatorio.png', height: 80.0),
                                      Container(margin: EdgeInsets.only(top: 10.0), child: Text('Local Report', style: TextStyle(color: Colors.white, fontSize: 26.0), textAlign: TextAlign.center,))
                                    ],
                                  )
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RelatorioScreen()));
                                },
                              )
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: corPrincipal,
                              ),
                              width: 180.0,
                              height: 180.0,
                              child: FlatButton(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Image.asset('assets/solucao.png', height: 80.0),
                                      Container(margin: EdgeInsets.only(top: 10.0), child: Text('Solutions', style: TextStyle(color: Colors.white, fontSize: 26.0),))
                                    ],
                                  )
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SolucaoScreen()));
                                },
                              )
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
