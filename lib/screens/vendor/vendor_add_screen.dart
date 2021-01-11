import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sp_manager/screens/vendor/vendor_screen.dart';
import 'package:sp_manager/share/components/component/button.dart';
import 'package:sp_manager/share/components/component/input.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';

class VendorAddScreen extends StatefulWidget {
  @override
  _VendorAddScreenState createState() => _VendorAddScreenState();
}

class _VendorAddScreenState extends State<VendorAddScreen> {

  String name;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Color(0xffd9dbdb).withOpacity(0.4),
            padding: EdgeInsets.only(
                left: 20,
                top: 10,
                right: 20,
                bottom: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Vendor Information',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
//                Text(
//                  'All',
//                  style: TextStyle(
//                    color: primaryColor,
//                    fontSize: 18,
//                    fontWeight: FontWeight.w500,
//                  ),
//                ),
              ],
            ),
          ),
          _mainBody(context)
        ],
      )
    );
  }

  AppBar _appBar(){
    return AppBar(
        centerTitle: true,
        title: Text('Add New Vendor'),
        backgroundColor: Colors.purple[900],
        leading: Container(
          padding: EdgeInsets.only(
              top: 5
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.navigate_before,size: 30),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VendorScreen()),
                  );
                },
              ),
            ],
          ),
        )
    );
  }

  SingleChildScrollView _mainBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 20,
          right: 20
        ),
        physics: ClampingScrollPhysics(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 25,),
              InputField(
                hintText: "Vendor Name",
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(height: 15),
              InputField(
                keyboardType: TextInputType.number,
                hintText: "Contact",
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(height: 15),
              InputField(
                keyboardType: TextInputType.emailAddress,
                hintText: "Email",
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(height: 15),
              InputField(
                keyboardType: TextInputType.text,
                hintText: "Address",
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(height: 15),
              InputField(
                hintText: "Image",
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
        )
    );
  }
}
