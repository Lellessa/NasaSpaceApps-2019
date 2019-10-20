import 'package:flutter/material.dart';
import 'package:space_apps2019_2/appBars.dart';
import 'package:space_apps2019_2/globals.dart' as globals;

var corPrincipal = globals.corPrincipal;
var corSecundaria = globals.corSecundaria;

class SolucaoScreen extends StatelessWidget {
  
  final List<CardSolucao> solutions = [
    CardSolucao(
      '1.Adaptation – adapting to life in a changing climate – involves adjusting to actual or expected future climate. The goal is to reduce our vulnerability to the harmful effects of climate change (like sea-level encroachment, more intense extreme weather events or food insecurity). It also encompasses making the most of any potential beneficial opportunities associated with climate change (for example, longer growing seasons or increased yields in some regions).'
    ),
    CardSolucao(
      '2. Mitigation – reducing climate change – involves reducing the flow of heat-trapping greenhouse gases into the atmosphere, either by reducing sources of these gases (for example, the burning of fossil fuels for electricity, heat or transport) or enhancing the “sinks” that accumulate and store these gases (such as the oceans, forests and soil). The goal of mitigation is to avoid significant human interference with the climate system, and “stabilize greenhouse gas levels in a timeframe sufficient to allow ecosystems to adapt naturally to climate change, ensure that food production is not threatened and to enable economic development to proceed in a sustainable manner”.'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBarSolucao('Solution'),
      ),
      backgroundColor: corSecundaria,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              color: globals.corAppBar,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Text('Climate change is one of the most complex issues facing us today. It involves many dimensions – science, economics, society, politics and moral and ethical questions – and is a global problem, felt on local scales, that will be around for decades and centuries to come.',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
                textAlign: TextAlign.justify,              
              ),
            ),
            Column(
              children: solutions
            ),
          ],
        ),
      )
      
    );
  }
}

class CardSolucao extends StatelessWidget {
  String _info;

  CardSolucao(this._info);
  @override
  Widget build(BuildContext context) {

    return Card(
      color: corPrincipal,
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 3.0),
        width: MediaQuery.of(context).size.width,
        child: Text(_info, style: TextStyle(color: Colors.white, fontSize: 18.0), textAlign: TextAlign.start,),
      ),
    );
  }
}