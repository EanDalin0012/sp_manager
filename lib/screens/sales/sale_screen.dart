import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_manager/model/product/sale_detail_product_model.dart';
import 'package:sp_manager/screens/sales/sale_add_screen.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';
import 'package:sp_manager/share/constant/sale_status.dart';

class SaleScreen extends StatefulWidget {

  @override
  _SaleScreenState createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {

  final _saleDetailsProductModel = SaleDetailsProductModel.data();
  @override
  Widget build(BuildContext context) {
    print('Hell sale screen');
    return Scaffold(
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
                  'Transactions',
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
//          _mainTransactionBody()
          _body()
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[900],
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SaleAddScreen()),
          );
        },
        tooltip: 'Increment',
        elevation: 5,
        child: Icon(Icons.add_circle, size: 45,),
      ),
    );
  }

  Expanded _body() {
    return Expanded(
        child: SingleChildScrollView(
          primary: true,
          padding: EdgeInsets.only(
            left: 10,
            right: 0,
            top: 15
          ),
          physics: ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
              ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: _saleDetailsProductModel.length,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      _saleDetailsProductModel[index].transaction_id,
                      style: GoogleFonts.ptSerifCaption(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      ),
                    ),
                    subtitle: Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            _saleDetailsProductModel[index].date,
                            style: TextStyle(
                              color: primaryColor.withOpacity(0.6),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            _saleDetailsProductModel[index].total.toString(),
                            style: TextStyle(
                              color: primaryColor.withOpacity(0.6),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: Container(
                      width: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    _saleDetailsProductModel[index].payPhaseAmount.toString(),
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  status(_saleDetailsProductModel[index].status)
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              _offsetPopup(_saleDetailsProductModel[index]),
                            ],
                          ),

                        ],
                      ),
                    ),
                  )
              ),
              Container(
                height: 50,
              )
            ],
          ),
        )
    );
  }

  Text status(String status) {
    Color color = Colors.purple[900];
    String text = "paid";
    if(status == sale_status.pay_phase) {
      color = Colors.purple[900];
      text = "pay phase";
    } else if (status == sale_status.unpaid) {
      color = Colors.red;
      text = "unpaid";
    }
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _offsetPopup(SaleDetailsProductModel _saleDetailsProductModel) => PopupMenuButton<int>(
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
//      PopupMenuItem(
//          value: 2,
//          child: Row(
//            children: <Widget>[
//              FaIcon(FontAwesomeIcons.edit,size: 20,color: Colors.purple[900]),
//              SizedBox(width: 10,),
//              Text(
//                "Edit",
//                style: TextStyle(
//                    color: Colors.purple[900], fontWeight: FontWeight.w700),
//              ),
//            ],
//          )
//      ),
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

}
