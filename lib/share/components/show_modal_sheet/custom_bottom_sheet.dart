import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sp_manager/screens/customer/customer_screen.dart';
import 'package:sp_manager/screens/vendor/vendor_screen.dart';

class SheetContainer extends StatefulWidget {
  @override
  _SheetContainerState createState() => _SheetContainerState();
}

class _SheetContainerState extends State<SheetContainer> {
  var colorContain = Color(0xffd9dbdb).withOpacity(0.4);
  Color _textColor= Colors.purple[900];
  Color _iconColor = Colors.purple[900];
  double _iconSize = 35;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF737373),
      child: Container(
        padding: EdgeInsets.only(top: 15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: Color(0xfff1f1f1)
        ),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                drawerHandler(),
                item1(),
                SizedBox(height: 20,),
                item0(),
              ]
          ),
        )
      ),
    );
  }
  item0() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomerScreen()),
                );
              },
              child: Container(
                width: 120,
                height: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                          color: colorContain,
                          borderRadius: BorderRadius.all(Radius.circular(7))
                      ),
                      child:Center(child: FaIcon(FontAwesomeIcons.userPlus,size: _iconSize,color: _iconColor)),
                    ),
                    SizedBox(height: 5,),
                    Text('Customer',style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15,color: Colors.purple[900])),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print('Vendor Click');
              },
              child: Container(
                width: 120,
                height: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                          color: colorContain,
                          borderRadius: BorderRadius.all(Radius.circular(7))
                      ),
                      child: Center(child: FaIcon(FontAwesomeIcons.database,size: _iconSize,color: _iconColor)),
                    ),
                    SizedBox(height: 5,),
                    Text('Stock',style: TextStyle(fontWeight: FontWeight.w900, color: Colors.purple[900]),),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                width: 120,
                height: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                        color: colorContain,
                        borderRadius: BorderRadius.all(Radius.circular(7))
                      ),
                      child: Center(child: FaIcon(FontAwesomeIcons.poll,size: 40,color: _iconColor)),
                    ),
                    SizedBox(height: 5,),
                    Text('Report',style: TextStyle(fontWeight: FontWeight.w900, color: Colors.purple[900])),
                  ],
                ),
              ),
            ),
          ],
        );
  }

  item1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VendorScreen()),
            );
          },
          child: Container(
            width: 120,
            height: 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 60,
                  decoration: BoxDecoration(
                      color: colorContain,
                      borderRadius: BorderRadius.all(Radius.circular(7)),

                  ),
                  child: Center(child: FaIcon(FontAwesomeIcons.peopleCarry,size: _iconSize,color: _iconColor)),
                ),
                SizedBox(height: 5,),
                Text('Vendor',style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15,color: Colors.purple[900])),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            print('Vendor Click');
          },
          child: Container(
            width: 120,
            height: 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 60,
                  decoration: BoxDecoration(
                      color: colorContain,
                      borderRadius: BorderRadius.all(Radius.circular(7))
                  ),
                  child: Center(child: FaIcon(FontAwesomeIcons.productHunt,size: _iconSize,color: _iconColor)),
                ),
                SizedBox(height: 5,),
                Text('Product',style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15,color: Colors.purple[900])),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            print('Vendor Click');
          },
          child: Container(
            width: 120,
            height: 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 60,
                  decoration: BoxDecoration(
                      color: colorContain,
                      borderRadius: BorderRadius.all(Radius.circular(7))
                  ),
                  child: Center(child: FaIcon(FontAwesomeIcons.plusCircle,size: _iconSize,color: _iconColor)),
                ),
                SizedBox(height: 5,),
                Text('Import',style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15,color: Colors.purple[900])),
              ],
            ),
          ),
        ),
      ],
    );
  }


  drawerHandler() {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      height: 3,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xffd9dbdb)
      ),
    );
  }

}

class SheetContainer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      anchor: 0.3,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 500,
            width: double.maxFinite,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}


class CustomBottomSheet extends StatefulWidget {
  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Color(0xFF737373),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('asset/images/main_top.png'),
              width: size.width * 0.1,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('asset/images/login_bottom.png'),
              width: size.width * 0.2,
            ),
          ],
        ),
    );
  }
}





