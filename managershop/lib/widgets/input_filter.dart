import 'package:flutter/material.dart';
class InputFilter extends StatelessWidget {

  final IconData icon;
  final String hit;
  final bool obscure;

  InputFilter({this.icon,this.hit,this.obscure})


  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        icon:Icon(icon,color: Colors.white,)
      ),
    );
  }
}
