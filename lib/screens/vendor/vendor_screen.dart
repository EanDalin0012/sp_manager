import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sp_manager/model/vendor.dart';
import 'package:sp_manager/screens/vendor/vendor_add_screen.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';
import 'package:sp_manager/screens/home/main_home_screen.dart';
class VendorScreen extends StatefulWidget {
  @override
  _VendorScreenState createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  final _vendorList = VendorModel.data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Vendor'),
          backgroundColor: Colors.purple[900],
          leading: Container(
            padding: EdgeInsets.only(
              top: 5
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.navigate_before, size: 30),
                  tooltip: 'Show Snackbar',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainHomeScreen()),
                    );
                  },
                ),
              ],
            ),
          )
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
                    'Vendor List',
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
                MaterialPageRoute(builder: (context) => VendorAddScreen()),
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
                  itemCount: _vendorList.length,
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
                          image: NetworkImage(_vendorList[index].photo)
                      )
                    ),
                    title: Text(
                      _vendorList[index].name,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      'Contact: '+_vendorList[index].contact,
                      style: TextStyle(
                        color: primaryColor.withOpacity(0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing:  FaIcon(FontAwesomeIcons.ellipsisV,size: 20,color: Colors.black.withOpacity(0.7))
                  )
              )
            ],
          ),
        )
    );
  }
}
