import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Count People",
      home: Home()));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _infoText="Pode entrar";
  int _people = 0;
//Quando chamar essa função, ele soma +1 ou subtrai -1 e chama o build abaixo.
  void _changePeople(int delta) {
    setState(() {
      _people += delta;
      if(_people<0){
        _infoText="Mundo invertido";
      }else if(_people<=10){
        _infoText="pode entrar";

      }else{
        _infoText="Lotado";
      }
    });
  }

  @override
  //Funcão chamada quando você quer mudar algo no layout
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FlatButton(
                    child: Text(
                      "+-1",
                      style: TextStyle(fontSize: 38.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FlatButton(
                    child: Text(
                      "-3",
                      style: TextStyle(fontSize: 38.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 28.0),
            ),
        
          ],
        ),
      ],
    );
  }
}
