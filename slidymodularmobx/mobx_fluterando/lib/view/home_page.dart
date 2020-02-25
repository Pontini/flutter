import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_fluterando/controllers/home_controller.dart';
import 'package:mobx_fluterando/models/item_model.dart';
import 'package:mobx_fluterando/view/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  final controller = HomeController();

  _dialog() {
    var model = ItemModel();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(title: Text('Adicionar Item'),
            content: TextField(
              onChanged: model.setTitle,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Novo item'
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  controller.addItem(model);
                  Navigator.pop(context);
                },
                child: Text('Salvar'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              )
            ],

          );
        }

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: controller.setFilter,
          decoration: InputDecoration(hintText: "Pesquisa....."),
        ),
        actions: <Widget>[
          IconButton(
            icon: Observer(builder: (_) {
              return Text("${controller.totalChecjd}");
            },),
          )
        ],
      ),
      body: Observer(

        builder: (_) {
          if (controller.output.data == null) {
            return Center(
              child: CircularProgressIndicator()
              ,
            );
          }else {
            return ListView.builder(
              itemCount: controller.output.data.length,
              itemBuilder: (_, index) {
                var item = controller.output.data[index];
                return ItemWidget(item: item, removeClicked: () {
                  controller.removeItem(item);
                },);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _dialog();
        },
      )
      ,

    );
  }


}