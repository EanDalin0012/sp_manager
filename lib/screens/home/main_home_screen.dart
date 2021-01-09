import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sp_manager/screens/home/home_container.dart';
import 'package:sp_manager/screens/sales/sale_screen.dart';
import 'package:sp_manager/share/components/show_modal_sheet/custom_bottom_sheet.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {

  int _selectedIndex = 0;

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
    double height = MediaQuery.of(context).copyWith().size.height * 0.4;
    double height1 = MediaQuery.of(context).copyWith().size.height;
    if( (height1/1.5) < 395) {
      height = height1/1.8;
    }
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
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_selectedIndex].currentState.maybePop();

        print(
            'isFirstRouteInCurrentTab: ' + isFirstRouteInCurrentTab.toString());

        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
          bottomNavigationBar: _bottomNavigationBar(),
        body: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
