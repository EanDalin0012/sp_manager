import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sp_manager/model/product/product_model.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';

class ProductViewScreen extends StatelessWidget {

  final ProductModel productModel;
  ProductViewScreen(this.productModel);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(),
      body: _body(size),
    );
  }

  AppBar _appBar(){
    return AppBar(
      centerTitle: true,
      title: Text('View Product'),
      backgroundColor: Colors.purple[900],
    );
  }

  Column _body(Size size) {
    return Column(
        children: <Widget>[
          Container(
            color: Color(0xffd9dbdb).withOpacity(0.4),
            width: size.width,
            padding: EdgeInsets.only(
                left: 20,
                top: 10,
                right: 20,
                bottom: 10
            ),
            child: Text(
              'Product Information',
              style: TextStyle(
                color: primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Container(
                      height: size.height,
                      child: Column(
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: size.height,
                              padding: EdgeInsets.all(15),
                              color: Colors.white.withOpacity(0.7),
                              // child: _input(),
                            )
                          ]
                      )
                  )
              )
          )
        ]
    );
  }

}
