import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sp_manager/screens/home/home_container.dart';
import 'package:sp_manager/screens/notification/notification_screen.dart';
import 'package:sp_manager/screens/sales/sale_screen.dart';
import 'package:sp_manager/screens/sign_in/signin.dart';
import 'package:sp_manager/share/components/component/button.dart';
import 'package:sp_manager/share/components/show_modal_sheet/custom_bottom_sheet.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {

  int _selectedIndex = 0;
  String _titleBar = 'Home';

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];
  
  List<Widget> _widgetOptions = <Widget>[
    HomeScreenContainer(),
    SaleScreen(),
  ];

  BottomNavigationBar _bottomNavigationBar() {
    double activeIconSize = 36;
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Feather.home,
            color: kGoodLightGray,
          ),
          title: Text('HOME'),
          activeIcon: Icon(
            Feather.home,
            color: kGoodPurple,
            size: 30,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Feather.plus_circle,
            color: kGoodLightGray,
          ),
          title: Text('CALENDAR'),
          activeIcon: Icon(
            Feather.plus_circle,
            color: kGoodPurple,
            size: activeIconSize,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Feather.align_left,
            color: kGoodLightGray,
          ),
          title: Text('PROFILE'),
          activeIcon: Icon(
            Feather.align_left,
            color: kGoodPurple,
            size: activeIconSize,
          ),
        ),
      ],
      onTap: (index) {
        setState(() {
          if(index == 0) {
            _titleBar = 'Home';
          } else if (index == 1) {
            _titleBar = 'Sale';
          }
          if(index >= 2) {
            _showModelSheet();
          } else {
            _selectedIndex = index;
          }
        });
      },
    );
  }

  Container _showModelSheet() {
    var orientation = MediaQuery.of(context).orientation;
    double height = (MediaQuery.of(context).copyWith().size.height / 2.5);
    // double height1 = MediaQuery.of(context).copyWith().size.height;
    // if( (height1/1.5) < 395) {
    //   height = height1/1.8;
    // }
    setState(() {
      if(orientation != Orientation.portrait){
        height = MediaQuery.of(context).copyWith().size.height * 0.67;
      }
    });
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext builder) {
          return Container(
            height: height,
            width: MediaQuery.of(context).size.width,
            child: SheetContainer(),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await _navigatorKeys[_selectedIndex].currentState.maybePop();
        print(
            'isFirstRouteInCurrentTab: ' + isFirstRouteInCurrentTab.toString());
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(_titleBar),
            centerTitle: true,
            backgroundColor: Colors.purple[900],
            elevation: 0,
            leading: new Container(),
            actions: <Widget>[
              Stack(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NotificationScreen()),
                        );
                      },
                      child: Container(
                        height: 80,
                        padding: EdgeInsets.only(
                          top: 5,
                          right: 10,
                          left: 10
                        ),
                        child: Icon(Icons.notifications),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: EdgeInsets.only(
                        left: 6,
                        top: 1
                      ),
                      margin: EdgeInsets.only(
                        top: 7,
                        left: 20
                      ),
                      child: Text('2', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800)),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                  child: Container(
                      height: 40,
                      padding: EdgeInsets.only(
                        top: 7,
                        right: 5,
                        left: 5
                      ),
                      margin: EdgeInsets.only(
                      right: 5
                      ),
                      child: Icon(Icons.logout),
                  ),
                ),
            ],
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: _bottomNavigationBar(),
          body: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
