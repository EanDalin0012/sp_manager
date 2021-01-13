import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sp_manager/model/customer/customer_model.dart';
import 'package:sp_manager/share/components/component/button.dart';
import 'package:sp_manager/share/components/component/input.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';

class CustomerEditScreen extends StatefulWidget {

  final CustomerModel customerModel;
  CustomerEditScreen(this.customerModel);

  @override
  _CustomerEditScreenState createState() => _CustomerEditScreenState(customerModel);
}

class _CustomerEditScreenState extends State<CustomerEditScreen> {
  var firstNameController = new TextEditingController();
  var lastNameController = new TextEditingController();
  var contactController = new TextEditingController();
  var emailController = new TextEditingController();
  var addressController = new TextEditingController();
  var photoController = new TextEditingController();

  final CustomerModel customerModel;
  _CustomerEditScreenState(this.customerModel) {
    firstNameController.text = customerModel.firstName;
    lastNameController.text = customerModel.lastName;
    contactController.text = customerModel.contact;
    emailController.text = customerModel.email;
    addressController.text = customerModel.address;
    photoController.text = customerModel.photo;

    print('customer edit screen\n'+customerModel.toString());
  }

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
        title: Text('Edit Customer'),
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
    //            padding: EdgeInsets.all(5.0),
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
            hintText: "First Name",
            textEditingController: firstNameController,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              print(value);
            },
          ),
          SizedBox(height: 15),
          InputField(
            hintText: "Last Name",
            textEditingController: lastNameController,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              print(value);
            },
          ),
          SizedBox(height: 15),
          InputField(
            keyboardType: TextInputType.number,
            hintText: "Contact",
            textEditingController: contactController,
            onChanged: (value) {
              print(value);
            },
          ),
          SizedBox(height: 15),
          InputField(
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            textEditingController: emailController,
            onChanged: (value) {
              print(value);
            },
          ),
          SizedBox(height: 15),
          InputField(
            keyboardType: TextInputType.text,
            hintText: "Address",
            textEditingController: addressController,
            onChanged: (value) {
              print(value);
            },
          ),
          SizedBox(height: 15),
          InputField(
            hintText: "Image",
            textEditingController: photoController,
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
