import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_flutterando/body.dart';
import 'package:mobx_flutterando/controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);

    return Scaffold(
      appBar: AppBar(
          title:
          Observer(
            builder: (_) {
              return Text(controller.isValid
                  ? 'Formulário Validado'
                  : 'Formulário não Validado')
              ;

            },
          )

      ),
      body: BodyWidget(),

    );
  }
}
