
import 'package:flutter/material.dart';
import 'package:shop/tabs/home_tab.dart';

class HomeScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
      HomeTab()
      ],
      
    );
  }
}