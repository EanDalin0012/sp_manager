import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sp_manager/model/vendor.dart';
import 'package:sp_manager/share/components/component/button.dart';
import 'package:sp_manager/share/components/component/input.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';

class VendorEditScreen extends StatefulWidget {

  final VendorModel vendorModel;
  VendorEditScreen(this.vendorModel);
  @override
  _VendorEditScreenState createState() => _VendorEditScreenState(vendorModel);
}

class _VendorEditScreenState extends State<VendorEditScreen> {
  var name;
  var address;
  var contact;
  var email;
  var photo;

  final VendorModel vendorModel;

  _VendorEditScreenState(this.vendorModel) {
    name    = vendorModel.name;
    address = vendorModel.address;
    contact = vendorModel.contact;
    email   = vendorModel.email;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(),
      body: _body(size)
    );
  }
  AppBar _appBar(){
    return AppBar(
      centerTitle: true,
      title: Text('Edit Vendor'),
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
              'Vendor Information',
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
                              child: _input(),
                            )
                          ]
                      )
                  )
              )
          )
        ]
    );
  }

  Column _input() {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          InputField(
            hintText: "Vendor Name",
            value: name,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              print(value);
            },
          ),
          SizedBox(height: 15),
          InputField(
            keyboardType: TextInputType.number,
            hintText: "Contact",
            value: contact,
            onChanged: (value) {
              print(value);
            },
          ),
          SizedBox(height: 15),
          InputField(
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            value: email,
            onChanged: (value) {
              print(value);
            },
          ),
          SizedBox(height: 15),
          InputField(
            keyboardType: TextInputType.text,
            hintText: "Address",
            value: address,
            onChanged: (value) {
              print(value);
            },
          ),
          SizedBox(height: 15),
          InputField(
            hintText: "Image",
            value: photo,
            onChanged: (value) {
              print(value);
            },
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Button(
                text: 'Save',
                faIcon:  FaIcon(FontAwesomeIcons.save,size: 20,color: Colors.white),
                press: () {
                  print('log in click');
                },
              ),
            ],
          ),
        ]
    );
  }
}
