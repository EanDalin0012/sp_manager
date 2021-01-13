import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sp_manager/model/customer/customer_model.dart';
import 'package:sp_manager/model/vendor.dart';

class CustomerViewScreen extends StatefulWidget {
  final CustomerModel customerModel;
  CustomerViewScreen(this.customerModel);

  @override
  _VendorViewScreenState createState() => _VendorViewScreenState(customerModel);
}

class _VendorViewScreenState extends State<CustomerViewScreen> {

  final CustomerModel customerModel;
  _VendorViewScreenState(this.customerModel) {
    print("view vendor screen\n"+customerModel.toString());
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
      title: Text('Customer'),
      backgroundColor: Colors.purple[900],
    );
  }

  Container _body(){
    return Container();
  }
}
