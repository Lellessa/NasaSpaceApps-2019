import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space_apps2019_2/relatorio.dart';
import 'package:space_apps2019_2/causas.dart';
import 'package:space_apps2019_2/preRelatorio.dart';
import 'package:space_apps2019_2/solucao.dart';
import 'package:space_apps2019_2/previsão.dart';
import 'package:space_apps2019_2/globals.dart' as globals;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  Key key;
  /*
  Alguns membros tinham experiencia em desenvolver apps
  todas as pessoas carregam o celular para todos os lugares
  meio fácil e rápido de conseguir dados seguros
  fácil compartilhamento
  */
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
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: <Widget>[
            //       Image.asset('graph1.png'),
            //       Text('teste')
            //     ],
            //   ),
            // ),
            //! GRAFICOS TOPO
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child: Row(
                  key: key,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: corPrincipal, width: 2.0), right: BorderSide(color: corSecundaria, width: 2.0))
                      ),
                      // padding: EdgeInsets.symmetric(horizontal: 10.0),
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/graph1.png')
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: corSecundaria, width: 2.0), right: BorderSide(color: corSecundaria, width: 2.0))
                      ),
                      // padding: EdgeInsets.symmetric(horizontal: 10.0),
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/graph2.png')
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: corSecundaria, width: 2.0), right: BorderSide(color: corSecundaria, width: 2.0))
                      ),
                      // padding: EdgeInsets.symmetric(horizontal: 10.0),
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/graph3.png')
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: corSecundaria, width: 2.0), right: BorderSide(color: corSecundaria, width: 2.0))
                      ),
                      // padding: EdgeInsets.symmetric(horizontal: 10.0),
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/graph4.png')
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: corSecundaria, width: 2.0), right: BorderSide(color: corSecundaria, width: 2.0))
                      ),
                      // padding: EdgeInsets.symmetric(horizontal: 10.0),
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/graph5.png')
                    ),
                    
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    //! PRIMEIRA LINHA DOS BOTOES
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            //! POSICAO 1, 1
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: corPrincipal,
                                ),
                                margin: EdgeInsets.all(20.0),
                                child: FlatButton(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(child: Image.asset('assets/previsao.png')),
                                      Text('Projection', style: TextStyle(color: Colors.white, fontSize: 15.0), textAlign: TextAlign.center)
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectionScreen()));
                                  },
                                ),
                              ),
                            ),
                            //! POSICAO 1, 2
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: corPrincipal,
                                ),
                                margin: EdgeInsets.all(20.0),
                                padding: EdgeInsets.only(top: 10.0),
                                child: FlatButton(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(child: Image.asset('assets/causas.png')),
                                      Text('Causes and Effects', style: TextStyle(color: Colors.white, fontSize: 15.0), textAlign: TextAlign.center)
                                    ],
                                  ),
                                  onPressed: () {
                                    String info = 'Every year, the equivalent of over 800,000 Empire State Buildings made of ice fall into the oceans. The biggest sources of ice melt are the glaciers from Antartica and Greenland. Antartica holds 90% of Earth\'s Ice. In 2014, 303 gigatons of ice were lost from the Greenland ice sheet, adding that volume to the oceans. That\'s equivalent to a pool that\'s 25m wide and 6 billion meters long, which could stretch from the Earth to the moon and back 16 times. The Greenland contains enough ice to raise the sea level by +/- 6m and the Antartic ice sheet holds enough ice to raise the seas by +/- 58m. Ice melt can also come from alpines (glaciers in mountains and valleys).';
                                    String causa = 'Ice Melt';
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => CausasScreen('assets/causa1.jpeg', causa, info, 0)));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //! SEGUNDA LINHA DOS BOTOES
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            //! POSICAO 2, 1
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: corPrincipal,
                                ),
                                margin: EdgeInsets.all(20.0),
                                padding: EdgeInsets.only(top: 10.0),
                                child: FlatButton(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(child: Image.asset('assets/relatorio.png')),
                                      Text('Report', style: TextStyle(color: Colors.white, fontSize: 15.0))
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => PreRelatorio()));
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => RelatorioScreen()));
                                  },
                                ),
                              ),
                            ),
                            //! POSICAO 2, 2
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: corPrincipal,
                                ),
                                margin: EdgeInsets.all(20.0),
                                padding: EdgeInsets.only(top: 10.0),
                                child: FlatButton(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(child: Image.asset('assets/solucao.png')),
                                      Text('Solutions', style: TextStyle(color: Colors.white, fontSize: 15.0))
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SolucaoScreen()));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            //! iNFROMACOES RODAPE
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.white, width: 1)),
                color: globals.corAppBar,
              ),
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: Colors.white, width: 1))
                      ),
                      child: Column(
                        children: <Widget>[
                          Text('Global Sea Level', style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center,),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.arrow_upward, color: Colors.red, size: 35.0,),
                                Text('3.3', style: TextStyle(fontSize: 30.0, color: Colors.white),),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('±0.4', style: TextStyle(color: Colors.white),),
                                    Text('mm/yy', style: TextStyle(color: Colors.white, fontSize: 12.0),)
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: Colors.white, width: 1))
                      ),
                      child: Column(
                        children: <Widget>[
                          Text('Ocean Mass', style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center,),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.arrow_upward, color: Colors.red, size: 35.0,),
                                Text('1.8', style: TextStyle(fontSize: 30.0, color: Colors.white),),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('±0.3', style: TextStyle(color: Colors.white),),
                                    Text('mm/yy', style: TextStyle(color: Colors.white, fontSize: 12.0),)
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Text('Steric Height', style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center,),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.arrow_upward, color: Colors.red, size: 35.0,),
                                Text('1.1', style: TextStyle(fontSize: 30.0, color: Colors.white),),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('±0.2', style: TextStyle(color: Colors.white),),
                                    Text('mm/yy', style: TextStyle(color: Colors.white, fontSize: 12.0),)
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
