import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sp_manager/screens/components/components_screen.dart';
import 'package:sp_manager/share/components/component/button.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';

class HomeScreenContainer extends StatelessWidget {
  bool _isIncome = false;
  Color  _primaryColor = Colors.deepPurpleAccent;
  Color _secondaryColor = Colors.deepOrangeAccent;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: Column(
          children: <Widget>[
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: [
//              Text('Services', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800),),
//              Container(
//                height: 60,
//                width: 60,
//                child: Icon(Icons.dialpad),
//              )
//            ],
//          ),
            _mainBody(),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[900],
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ComponentsScreen()),
          );
        },
        tooltip: 'Increment',
        elevation: 5,
        child: Icon(Icons.add_circle, size: 45,),
      ),
    );
  }

  Expanded _mainBody() {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        physics: ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _container(
              isSaving: true,
              title: 'Saving Account',
              deposit: '\$5,000',
              rate: '+3,50%',
              progress: 25
              ),
            SizedBox(height: 16,),
            _container(
                isSaving: false,
                title: 'Financial Customer',
                deposit: '\$12,000',
                rate: '+3,50%',
                progress: 25
            ),
          ],
        ),
      ),
    );
  }

  Container _container({
    bool isSaving,
    String title,
    String deposit,
    String rate,
    int progress
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSaving ? Colors.white : _secondaryColor,
        border: isSaving ? Border.all(color: _primaryColor.withOpacity(0.1), width: 2) : null,
        boxShadow: isSaving ? [] : [BoxShadow(color: _secondaryColor.withOpacity(0.4),offset: Offset(0,8), blurRadius: 10)],
      ),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                height: 60,
                width: 60,
                child: CircularProgressIndicator(
                  value: progress / 100,
                  strokeWidth: 5,
                  backgroundColor: isSaving ? _primaryColor.withOpacity(0.2) : _primaryColor.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(isSaving ? _secondaryColor: Colors.white),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                child: Text(progress.toString() + '%', style: TextStyle(color: isSaving ? _primaryColor : Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              )
            ],
          ),
          SizedBox(width: 30,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: TextStyle(color: isSaving ? _primaryColor : Colors.white,fontSize: 18,fontWeight: FontWeight.w500)),
              SizedBox(height: 12,),
              Row(
                children: <Widget>[
                  _reportInnerCell(
                    isSaving: isSaving,
                    title: 'Deposit',
                    value: deposit
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  _reportInnerCell(
                      isSaving: isSaving,
                      title: 'Rate',
                      value: rate
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Column _reportInnerCell({
    bool isSaving,
    String title,
    String value
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: TextStyle(color: isSaving ? _primaryColor.withOpacity(0.5): Colors.white,fontSize:  14,fontWeight: FontWeight.w500),),
        SizedBox(height: 4,),
        Text(value, style: TextStyle(color: isSaving ? Colors.black87: Colors.white,fontSize:  14,fontWeight: FontWeight.w500),),
      ],
    );
  }
}
