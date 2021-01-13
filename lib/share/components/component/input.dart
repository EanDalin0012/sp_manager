import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_manager/share/components/component/input_container.dart';
import 'package:sp_manager/share/constant/constantcolor.dart';

class InputField extends StatelessWidget {

  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final TextEditingController textEditingController;
  const InputField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.keyboardType,
    this.textEditingController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        controller: textEditingController,
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
