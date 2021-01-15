import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sp_manager/model/customer/customer_model.dart';
import 'package:sp_manager/screens/customer/customer_add_screen.dart';
import 'package:sp_manager/screens/customer/customer_edit_screen.dart';
import 'package:sp_manager/screens/customer/customer_view_screen.dart';
import 'package:sp_manager/screens/vendor/vendor_add_screen.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';

class CustomerScreen extends StatefulWidget {
  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final _customerList = CustomerModel.data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Customer'),
          backgroundColor: Colors.purple[900],
      ),
      body: Column(
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
                    'Customer List',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'All',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            _mainTransactionBody()
          ]),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purple[900],
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomerAddScreen()),
              );
            },
            tooltip: 'Increment',
            elevation: 5,
            child: Icon(Icons.add_circle, size: 45,),
          ),
    );
  }

  Expanded _mainTransactionBody() {
    return Expanded(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          physics: ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
              ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: _customerList.length,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 60,
                      height: 60,
                      clipBehavior: Clip.hardEdge,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:Border.all(color: primaryColor.withOpacity(0.1)),
                      ),
                      child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(_customerList[index].photo)
                      )
                    ),
                    title: Text(
                      _customerList[index].firstName +''+_customerList[index].lastName,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      'Contact: '+_customerList[index].contact,
                      style: TextStyle(
                        color: primaryColor.withOpacity(0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Column(
                      children: <Widget>[
                        _offsetPopup(_customerList[index]),
                      ],
                    )
                  )
              ),
              Container(
                height: 40,
              )
            ],
          ),
        )
    );
  }

  Widget _offsetPopup(CustomerModel customerModel) => PopupMenuButton<int>(
    itemBuilder: (context) => [
      PopupMenuItem(
        value: 1,
        child: Row(
          children: <Widget>[
            FaIcon(FontAwesomeIcons.infoCircle,size: 20,color: Colors.purple[900]),
            SizedBox(width: 10,),
            Text(
              "View",
              style: TextStyle(
                  color: Colors.purple[900], fontWeight: FontWeight.w700),
            ),
          ],
        )
      ),
      PopupMenuItem(
        value: 2,
        child: Row(
          children: <Widget>[
            FaIcon(FontAwesomeIcons.edit,size: 20,color: Colors.purple[900]),
            SizedBox(width: 10,),
            Text(
              "Edit",
              style: TextStyle(
                  color: Colors.purple[900], fontWeight: FontWeight.w700),
            ),
          ],
        )
      ),
      PopupMenuItem(
          value: 3,
          child: Row(
            children: <Widget>[
              FaIcon(FontAwesomeIcons.trash,size: 20,color: Colors.purple[900]),
              SizedBox(width: 10,),
              Text(
                "Delete",
                style: TextStyle(
                    color: Colors.purple[900], fontWeight: FontWeight.w700),
              ),
            ],
          )
      ),
    ],
    icon: FaIcon(FontAwesomeIcons.ellipsisV,size: 20,color: Colors.black),
    offset: Offset(0, 45),
    onSelected: (value) {
      if(value == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustomerViewScreen(customerModel)),
        );
      } else if(value == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustomerEditScreen(customerModel)),
        );
      }
    },
  );

  }
