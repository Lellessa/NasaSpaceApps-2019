import 'package:flutter/material.dart';

Color corPrincipal = Color.fromRGBO(0, 141, 177, 1);
Color corSecundaria = Color.fromRGBO(3, 48, 118, 1);
Color corAppBar = Color.fromRGBO(03, 22, 54, 1);

String loremIpsum = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent neque lorem, pellentesque eu velit et, dapibus iaculis elit. In maximus, augue quis faucibus dapibus, ipsum massa pharetra lacus, commodo laoreet massa augue sed orci. Duis egestas vel felis at malesuada. Morbi quis diam felis. Phasellus nec erat ut magna faucibus facilisis in a metus. Vivamus sodales diam in leo volutpat, ac gravida eros sollicitudin. Proin sed elit mauris. Duis maximus erat vel tellus elementum aliquet. Donec ut elit iaculis, placerat neque sed, molestie sapien. Morbi ornare odio risus, vel rhoncus ligula dictum nec. Ut iaculis cursus ex, nec laoreet tortor convallis vel. Nullam id faucibus sem. Sed sagittis, lorem eget aliquet malesuada, magna sem molestie neque, a hendrerit ex nibh tristique mi. Aenean eget accumsan est. Pellentesque lorem lorem, aliquet et tortor hendrerit, malesuada ultrices erat. ';

//barra (03, 22, 54)


//<5 - grandes chances de ser afetada pelo mar até 2100
//5m - 10m - poucas chances de ser afetada pelo mar até 2100
// >=10m Distante de possiveis areas afetadas pelo mar ate 2100

Widget causas(String image, String causa, String info, int position) {
  return Column(
        children: <Widget>[
          Container(
            child: Image.asset(image, fit: BoxFit.fitHeight, height: 240.0,),
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
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: FloatingActionButton(
                      heroTag: "btn2",
                      child: Image.asset('assets/circle.png'),
                      backgroundColor: (position == 1)?Colors.white:corSecundaria,
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: FloatingActionButton(
                      heroTag: "btn3",
                      child: Image.asset('assets/circle.png'),
                      backgroundColor: (position == 2)?Colors.white:corSecundaria,
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: FloatingActionButton(
                      heroTag: "btn4",
                      child: Image.asset('assets/circle.png'),
                      backgroundColor: (position == 3)?Colors.white:corSecundaria,
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
}
