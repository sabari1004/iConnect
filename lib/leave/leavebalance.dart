import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutteruiapp/widgets/product_provider.dart';
import 'package:flutteruiapp/widgets/product_bloc.dart';
import 'package:flutteruiapp/widgets/product.dart';
import 'package:flutteruiapp/widgets/product_detail_widgets.dart';
import 'package:flutteruiapp/widgets/login_background.dart';

class LeaveBalance extends StatelessWidget {
  Widget productScaffold(Stream<List<Product>> products) => new Scaffold(
      backgroundColor: new Color(0xffeeeeee),
      body: StreamBuilder<List<Product>>(
          stream: products,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Stack(
              fit: StackFit.expand,
              children: <Widget>[
                LoginBackground(
                  showIcon: false,
                ),
                ProductDetailWidgets(product:snapshot.data[0]),
              ],
            )
                : Center(child: CircularProgressIndicator());
          }));
  @override
  Widget build(BuildContext context) {
    ProductBloc productBloc = ProductBloc();
    return ProductProvider(
        productBloc: productBloc,
        child: productScaffold(productBloc.productItems));
  }
}
