import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shop/models/user_model.dart';
import 'package:shop/screens/home_screen.dart';
import 'package:shop/screens/login_screen.dart';
import 'package:shop/screens/singnup_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clothing',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 4, 125, 141)
      ),
      home: HomeScreen(),
    ),
    );
  }
}