import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sp_manager/model/product/product_model.dart';
import 'package:sp_manager/model/transaction_sales.dart';
import 'package:sp_manager/screens/product/product_add_screen.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _productList = ProductModel.data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: <Widget>[
          _info(),
          _body()
        ],
      ),
      floatingActionButton: _floatingActionButton(),
    );
  }

  Container _info() {
    return Container(
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
            'Product Information',
            style: TextStyle(
              color: primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appBar(){
    return AppBar(
      centerTitle: true,
      title: Text('Product'),
      backgroundColor: Colors.purple[900],
    );
  }

  Expanded _body() {
    return Expanded(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 20,
            right: 10
          ),
          physics: ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
              ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: _productList.length,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 60,
                      height: 60,
                      clipBehavior: Clip.hardEdge,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                        Border.all(color: primaryColor.withOpacity(0.1)),
                      ),
                      child: Image(
                        image: NetworkImage(_productList[index].resourceImageId),
                      ),
                    ),
                    title: Text(
                      _productList[index].productName,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      _productList[index].remark,
                      style: TextStyle(
                        color: primaryColor.withOpacity(0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: _offsetPopup(_productList[index]),
                  )
              ),
              Container(
                height: 55,
              )
            ],
          ),
        )
    );
  }

  Widget _offsetPopup(ProductModel _product) => PopupMenuButton<int>(
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
              SizedBox(width: 10),
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
    offset: Offset(0, 40),
    onSelected: (value) {
      if(value == 1) {
//        Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) => VendorViewScreen(vendorModel)),
//        );
      } else if(value == 2) {
//        Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) => VendorEditScreen(vendorModel)),
//        );
      }
    },
  );

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.purple[900],
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductAddScreen()),
        );
      },
      tooltip: 'Increment',
      elevation: 5,
      child: Icon(Icons.add_circle, size: 45,),
    );
  }
}
