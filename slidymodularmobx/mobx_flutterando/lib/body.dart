import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

class BodyWidget extends StatelessWidget {

  _textField({String labelText, onChanged, Function() errorText}) {
    return TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: labelText,
            errorText: errorText == null ? null : errorText()));
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);


    return Container(
      margin: new EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Observer(
            builder: (_) {
              return _textField(
                  errorText: controller.validateName,
                  labelText: "Name",
                  onChanged: controller.client.changeName
              );
            },
          ),
          Observer(
            builder: (_) {
              return _textField(
                  errorText: controller.validateEmail,
                  labelText: "Email",
                  onChanged: controller.client.changeEmail
              );
            },
          ),
          SizedBox(height: 50,),
          Observer(
            builder: (_){
              return  RaisedButton(
                onPressed: controller.isValid?(){}:null,child: Text("Salvar"),
              );

            },
          )

        ],
      ),
    );
  }
}
