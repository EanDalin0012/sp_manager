import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';

class Button1 extends StatelessWidget {

  final String text;
  final Function press;
  final Color color, textColor;
  const Button1({
    Key key,
    this.text,
    this.press,
    this.color = purple900,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: GoogleFonts.merriweather(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
    );
  }
}


class Button extends StatelessWidget {

  final String text;
  final Function press;
  final Color color, textColor;
  final FaIcon faIcon;
  final double width;
  const Button({
    Key key,
    this.text,
    this.press,
    this.color = purple900,
    this.textColor = Colors.white,
    this.faIcon,
    this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: width != null ? width : 120,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.5),
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0, 1),
          ),
        ]
      ),
      child: InkWell(
        onTap: press,
        child: Row(
          mainAxisAlignment: faIcon != null ?  MainAxisAlignment.spaceEvenly: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: faIcon != null ? faIcon: new Container(),
            ),
            Text(text, style: GoogleFonts.merriweather(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white))
          ],
        ),
      ),
    );
  }

}
