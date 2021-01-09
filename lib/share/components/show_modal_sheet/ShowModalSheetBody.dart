import 'package:flutter/material.dart';
import 'package:sp_manager/share/components/auth/rounded_button.dart';
import 'package:sp_manager/share/components/show_modal_sheet/show_modal_sheet_background.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';

class ShowModalSheetBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ShowModalSheetBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            items(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: kPrimaryLightColor
              ),
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
//                print('log in click');
//                Navigator.push(context, MaterialPageRoute(builder: (context){
//                  return HomeScreen();
//                }));
              },
            ),
          ],
        ),
      ),
    );
  }

  Row items() {
    return Row(
      children: <Widget>[
        Column(
          children: [],
        )
      ],
    );
  }
}
