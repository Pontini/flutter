import 'package:flutter/material.dart';
import 'package:shop/datas/cart_product.dart';


class CartTile extends StatelessWidget {

  final CartProduct cartProduct;
  CartTile(this.cartProduct);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
      child: CartProduct ,
    );
  }
}