import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sp_manager/model/dropdown_button_model/dropdown_button_model.dart';
import 'package:sp_manager/share/components/component/Count.dart';
import 'package:sp_manager/share/components/component/button.dart';
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

  Color selectedColor = Colors.grey;
  var vItems = DropdownButtonModel.data();

  List dropDownList = [
    {'name': 'Item 1', 'value': 'individual'},
    {'name': 'Item 2', 'value': 'company'},
    {'name': 'Item 3', 'value': 'company'},
    {'name': 'Item 4', 'value': 'individual'},
    {'name': 'Item 5', 'value': 'company'},
    {'name': 'Item 6', 'value': 'company'}
  ];
  Object dropDownValue;

  List dropDownListed = [
    {'name': 'Item 1', 'value': 'individual'},
    {'name': 'Item 2', 'value': 'company'},
    {'name': 'Item 3', 'value': 'company'},
    {'name': 'Item 4', 'value': 'individual'},
    {'name': 'Item 5', 'value': 'company'},
    {'name': 'Item 6', 'value': 'company'}
  ];
  Object dropDownListedValue;
  Size size = null;
  @override
  Widget build(BuildContext context) {
     size = MediaQuery.of(context).size;
     dropDownListedValue = dropDownListed[0];
    return Scaffold(
      appBar: _appBar(),
      body: _body(size),
    );
  }
  bool status = false;
  bool _value1 = false;
  bool _value06 = false;
  bool _value07 = false;
  bool _value11 = true;
  bool _value12 = false;

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
                              child: _column()
                            ),
                          ]
                      )
                  )
              )
          )
        ]
    );
  }

  Column _column() {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          input(),
          _count(),
          SizedBox(height: 5),
          _dropDownBtn(),
          _dropDownBtnSelected(),
          SizedBox(height: 20,),
          _button(),
          SizedBox(height: 20,),
          _switch(),
          _switch2(),
          SizedBox(height: 20,),
          Container(
            color: selectedColor,
            height: 20.0,
          ),
          _colorPicker(),
          _checkBox(),
          _uploadImage(),
          _card()
        ]
    );
  }
  Container input() {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.blue))
      ),
      child: InputField(
        hintText: "Input",
        keyboardType: TextInputType.text,
        onChanged: (value) {
        },
      ),
    );
  }

  Container _count() {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.blue))
      ),
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
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.blue))
      ),
      child: DropdownBtn(
        hint: 'select items',
        itemsKey: 'name',
        selectedIndex: dropDownValue,
        items: dropDownList,
        onChanged: (val) {
          dropDownValue = val;
          print('val:'+val.toString());
        },
      ),
    );
  }

  Container _dropDownBtnSelected() {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.blue))
      ),
      child: DropdownBtn(
        hint: 'select items',
        itemsKey: 'name',
        selectedIndex: dropDownListedValue,
        items: dropDownListed,
        onChanged: (val) {
          dropDownListedValue = val;
          print('val:'+val.toString());
        },
      ),
    );
  }

  Container _colorPicker() {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.blue))
      ),
      child: ColorPicker(
        onColorSelect: (Color color) {
          setState(() {
            selectedColor = color;
          });
        },
      ),
    );
  }

  Container _checkBox() {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      width: size.width,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.blue))
      ),
      child: Text('Check Box'),
    );
  }

  Container _uploadImage() {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      width: size.width,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.blue))
      ),
      child: Text('Upload image'),
    );
  }

  Container _card() {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      width: size.width,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.blue))
      ),
      child: Text('Card'),
    );
  }

  Container _button() {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      width: 120,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.blue))
      ),
      child: Button(
        text: 'Save',
        faIcon:  FaIcon(FontAwesomeIcons.save,size: 20,color: Colors.white),
        press: () {
          print('log in click');
        },
      ),
    );
  }

  Container _switch() {
    return Container(
      child: AdvancedSwitch(
        value: _value1,
        onChanged: (value) => setState(() {
          _value1 = value;
        }),
      ),

    );
  }

  Row _switch2() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AdvancedSwitch(
          width: 58,
          height: 30,
          value: _value11,
          borderRadius: BorderRadius.circular(20),
          onChanged: (value) => setState(() {
            _value11 = value;
          }),
        ),
        AdvancedSwitch(
          width: 112,
          height: 56,
          value: _value12,
          borderRadius: BorderRadius.circular(29),
          onChanged: (value) => setState(() {
            _value12 = value;
          }),
        ),

      ],
    );
  }

}