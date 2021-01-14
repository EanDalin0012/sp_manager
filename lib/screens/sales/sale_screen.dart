import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_manager/model/product/product_model.dart';
import 'package:sp_manager/model/transaction_sales.dart';
import 'package:sp_manager/screens/sales/sale_add_screen.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';

class SaleScreen extends StatefulWidget {

  @override
  _SaleScreenState createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  final _transactionSales = TransactionSaleModel.data();
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
          padding: EdgeInsets.only(
            left: 40,
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
                    subtitle: Text(
                      _saleDetailsProductModel[index].date,
                      style: TextStyle(
                        color: primaryColor.withOpacity(0.6),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Container(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            _saleDetailsProductModel[index].total.toString(),
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          _offsetPopup(_saleDetailsProductModel[index])
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
                    itemCount: _transactionSales.length,
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
                        child: Image.asset(
                          _transactionSales[index].logo,
                          fit: BoxFit.cover,
                          width: 30,
                          height: 30,
                        ),
                      ),
                      title: Text(
                        _transactionSales[index].name,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        _transactionSales[index].date,
                        style: TextStyle(
                          color: primaryColor.withOpacity(0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Text(
                        _transactionSales[index].amount,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  )
              ],
          ),
        )
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
