import 'package:flutter/material.dart';
import 'package:space_apps2019_2/globals.dart' as globals;
import 'package:space_apps2019_2/appBars.dart';

var corPrincipal = globals.corPrincipal;
var corSecundaria = globals.corSecundaria;

class ConsequenciasScreen extends StatelessWidget {

  List<CardConsequencia> consequences = [
    CardConsequencia('1. Flooding can inundate or damage medical and military facilities, preventing responses in emergencies.'),
    CardConsequencia('2. Floodings can affect tourism and consequently economy.'),
    CardConsequencia('3. Damage to public and private buildings and structures.'),
    CardConsequencia('4. Sea level rise can force people to move from Coastlines. Abou 40% of the human population live in coastal zones'),
    CardConsequencia('5. Salty water can affect the soil, destroying vegetation.'),
    CardConsequencia('6. Flooding impedes people’s from transporting and acessing (schools, hospitals etc.)'),
    CardConsequencia('7. Sea level rise can erode beaches, causing even islands to disappear'),
    CardConsequencia('8. Sea level rise can destroy ecosystems and natural habitats, causing species of animals and plats to disappear, consequently affecting people who depends on those species to survive.'),
    CardConsequencia('9. Rising sea levels and therefore higher tides can cause pressure on sewage systems that, if damaged, can expose people to health problems.'),
    CardConsequencia('10. Rising sea levels can affect buildings and structures, leaving them moist and causing mildew and mold to appear, polluting air quality and posing health hazards.'),
    CardConsequencia('11. Salty water can compromise communities’ freshwater sources.'),
    CardConsequencia('12. Sea level rise can endanger hazardous waste sites and nuclear power plants, putting people living at coasts in risk.'),
    CardConsequencia('13. It can damage structures that regulate communication.'),
    CardConsequencia('14. It can impede airports, ports and railways.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBarSolucao('Consequences'),
      ),
      backgroundColor: corSecundaria,
      body: SingleChildScrollView(
        child: Column(
          children: consequences
        ),
      )
    );
  }
}

class CardConsequencia extends StatelessWidget {
  String _info;

  CardConsequencia(this._info);
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