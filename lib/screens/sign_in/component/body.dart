import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sp_manager/screens/home/main_home_screen.dart';
import 'package:sp_manager/screens/sign_in/component/background.dart';
import 'file:///D:/flutter/sp_manager/lib/share/components/auth/rounded_button.dart';
import 'file:///D:/flutter/sp_manager/lib/share/components/auth/rounded_input_field.dart';
import 'file:///D:/flutter/sp_manager/lib/share/components/auth/rounded_password_field.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'BioRhyme', fontSize: 25)
            ),
            SizedBox(height: size.height * 0.03,),
            SvgPicture.asset(
              'asset/icons/signup.svg',
              height: size.height * 0.35
          ),
            SizedBox(height: size.height * 0.03,),
            Container(
             padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
             width: size.width * 0.8,
             decoration: BoxDecoration(
               color: kPrimaryLightColor
             ),
           ),
            SizedBox(height: size.height * 0.03,),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                print(value);
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                print('log in click');
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MainHomeScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
