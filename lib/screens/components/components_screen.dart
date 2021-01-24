import 'package:flutter/material.dart';
import 'package:sp_manager/model/dropdown_button_model/dropdown_button_model.dart';
import 'package:sp_manager/model/vendor.dart';
import 'package:sp_manager/share/components/component/Count.dart';
import 'package:sp_manager/share/components/component/dropdown_btn.dart';
import 'package:sp_manager/share/components/component/color_picker.dart';
import 'package:sp_manager/share/components/component/input.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';

class ComponentsScreen extends StatefulWidget {
  @override
  _ComponentsScreenState createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<ComponentsScreen> {
  int count = 0;
  Object dropDownValue;
  Color selectedColor = Colors.grey;
  var vItems = DropdownButtonModel.data();
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
      title: Text('Components'),
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
                              child: _input()
                            ),
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
          SizedBox(height: 20,),
          InputField(
            hintText: "Input",
            keyboardType: TextInputType.text,
            onChanged: (value) {
            },
          ),
          SizedBox(height: 20,),
          _count(),
          SizedBox(height: 20,),
          _dropDownBtn(),
          SizedBox(height: 20,),
          Container(
            color: selectedColor,
            height: 20.0,
          ),
          ColorPicker(
            onColorSelect: (Color color) {
              setState(() {
                selectedColor = color;
              });
            },
          )

        ]
    );
  }

  Container _count() {
    return Container(
      child: Count(
        count: count,
        onCountChange: (int val) {
          print(val);
          setState(() => count += val);
        },
      ),
    );
  }
  Container _dropDownBtn() {
    return Container(
      child: DropdownBtn(
        hint: 'select items',
        items: vItems,
        value: dropDownValue,
        onChanged: (val) {
          print('val:'+val.toString());
          VendorModel v = val.object;
          print('v:'+v.toString());
        },
      ),
    );
  }
}