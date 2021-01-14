

import 'package:flutter/material.dart';

class SaleAddScreen extends StatefulWidget {
  @override
  _SaleAddScreenState createState() => _SaleAddScreenState();
}

class _SaleAddScreenState extends State<SaleAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar(){
    return AppBar(
      centerTitle: true,
      title: Text('Add New Sale'),
      backgroundColor: Colors.purple[900],
    );
  }

  Container _body() {
    return Container();
  }

}
