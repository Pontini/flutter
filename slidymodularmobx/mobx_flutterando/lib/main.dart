import 'package:flutter/material.dart';
import 'package:mobx_flutterando/home.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [
      Provider<Controller>(create: (_)=>Controller(),)
    ],
    child: MaterialApp(
      title: 'Flutter Mobx',
      theme: ThemeData(
        primarySwatch: Colors.blue

      ),
      home: HomePage(),
    ),

    );



  }
}
