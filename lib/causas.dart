import 'package:flutter/material.dart';
import 'package:space_apps2019_2/globals.dart' as globals;
import 'package:space_apps2019_2/consequencias.dart';

var corPrincipal = globals.corPrincipal;
var corSecundaria = globals.corSecundaria;




class CausasScreen extends StatefulWidget {

int position;
String causa;
String info;
String image;

CausasScreen(this.image, this.causa, this.info, this.position);

  @override
  _CausasScreenState createState() => _CausasScreenState(this.image, this.causa, this.info, this.position);
}

class _CausasScreenState extends State<CausasScreen> {
  int position;
  String causa;
  String info;
  String image;

  _CausasScreenState(this.image, this.causa, this.info, this.position);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corSecundaria,
      body: Column(
        children: <Widget>[
          Container(
            child: Image.asset(image, fit: BoxFit.fitWidth),
          ),

          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 5.0),
            // width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Text(causa, style: TextStyle(color: corSecundaria, fontSize: 25.0),),
          ),

          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: SingleChildScrollView(
                child: Text(
                  info,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            height: 30.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: FloatingActionButton(
                      heroTag: "btn1",
                      child: Image.asset('assets/circle.png'),
                      backgroundColor: (position == 0)?Colors.white:corSecundaria,
                      onPressed: () {
                        info = 'Every year, the equivalent of over 800,000 Empire State Buildings made of ice fall into the oceans. The biggest sources of ice melt are the glaciers from Antartica and Greenland. Antartica holds 90% of Earth\'s Ice. In 2014, 303 gigatons of ice were lost from the Greenland ice sheet, adding that volume to the oceans. That\'s equivalent to a pool that\'s 25m wide and 6 billion meters long, which could stretch from the Earth to the moon and back 16 times. The Greenland contains enough ice to raise the sea level by +/- 6m and the Antartic ice sheet holds enough ice to raise the seas by +/- 58m. Ice melt can also come from alpines (glaciers in mountains and valleys).';
                        causa = 'Ice Melt';
                        image = 'assets/causa1.jpeg';
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CausasScreen(image, causa, info, 0)));
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: FloatingActionButton(
                      heroTag: "btn2",
                      child: Image.asset('assets/circle.png'),
                      backgroundColor: (position == 1)?Colors.white:corSecundaria,
                      onPressed: () {
                        info = 'Oceans absorb more than 90% of the heat trapped by human-produced green house effect. As the water warms, its molecules move and interect more, causing the water to take up more space. If you ever used a mercury thermometer, you have seen the same effect in action. That\'s thermal expansion. Recently, the ocean has been getting progressively hotter. Thermal expansion has increased, causing sea levels to rise 75% faster over the last 10 years, as compared to previous years. It has led to a sea level rise that’s equivalent to adding 142 million Olympic sized pools of water to the ocean each year. Which areas of the ocean are being affect also makes a difference, since deeper water expands more when it warms up. due to the pressure from the water above it';
                        causa = 'Thermal expansion';
                        image = 'assets/causa.jpg';
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CausasScreen(image, causa, info, 1)));
                      },
                    ),
                  ),
                ),
                Expanded(
                  
                  child: Container(
                    child: FloatingActionButton(
                      heroTag: "btn3",
                      child: Image.asset('assets/circle.png'),
                      backgroundColor: (position == 2)?Colors.white:corSecundaria,
                      onPressed: () {
                        info = 'It\'s a local cause for sea level rise, so it has a small contribution to the global situation. Sea levels are measured relative to land, which means that when the ground sinks lower, sea levels reach higher. Sinking land can be cause by groundwater withdrawal (human intervention) or shifting tectonic plates (no human intervention).';
                        causa = 'Land Sinkage';
                        image = 'assets/causa2.png';
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CausasScreen(image, causa, info, 2)));
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: FloatingActionButton(
                      heroTag: "btn4",
                      child: Image.asset('assets/circle.png'),
                      backgroundColor: (position == 3)?Colors.white:corSecundaria,
                      onPressed: () {
                        info = 'The fresh water from ice melt added in the oceans, disrupt the Gulf Stream\'s circulation. This is because freshwater does not contain salt, which makes it lighter than ocean water. Since this freshwater does not sink as fast, it slows down the Gulf Stream. Because the Gulf Stream is slowing, less water is taken from coasts, leaving more water to pile up and causing the sea level to rise in some places.';
                        causa = 'The Gulf Stream';
                        image = 'assets/depois1.png';
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CausasScreen(image, causa, info, 3)));
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: FloatingActionButton(
                      heroTag: "btn5",
                      child: Image.asset('assets/circle.png'),
                      backgroundColor: (position == 4)?Colors.white:corSecundaria,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ConsequenciasScreen()));
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}