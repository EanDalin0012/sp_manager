import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_manager/share/components/component/input_container.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final String value;
  const InputField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.keyboardType,
    this.value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var valueController = new TextEditingController();
    valueController.text = value;
    return InputContainer(
      child: TextField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        controller: valueController,
        cursorColor: kPrimaryColor,
        style: GoogleFonts.merriweather(fontSize: 20, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintStyle: GoogleFonts.merriweather(fontSize: 20, fontWeight: FontWeight.w500),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
