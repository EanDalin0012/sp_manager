import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  final Widget child;
  const InputContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      width: size.width,
      decoration: BoxDecoration(
        color: Color(0xffd9dbdb).withOpacity(0.4),
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
