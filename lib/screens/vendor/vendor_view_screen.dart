import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sp_manager/model/vendor.dart';

class VendorViewScreen extends StatefulWidget {
  final VendorModel vendorModel;
  VendorViewScreen(this.vendorModel);
  @override
  _VendorViewScreenState createState() => _VendorViewScreenState(vendorModel);
}

class _VendorViewScreenState extends State<VendorViewScreen> {
  final VendorModel vendorModel;
  _VendorViewScreenState(this.vendorModel) {
    print("view vendor screen\n"+vendorModel.toString());
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(),
      body: _body()
    );
  }

  AppBar _appBar(){
    return AppBar(
      centerTitle: true,
      title: Text('Add New Vendor'),
      backgroundColor: Colors.purple[900],
    );
  }

  Container _body(){
    return Container();
  }
}
