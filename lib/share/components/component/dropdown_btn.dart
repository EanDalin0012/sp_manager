import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_manager/model/dropdown_button_model/dropdown_button_model.dart';
import 'package:sp_manager/share/components/component/input_container.dart';

class DropdownBtn extends StatefulWidget {
  final selectItemChange onChanged;
  final List<DropdownButtonModel> items;
  final String hint;
  final Object value;
  final String itemsKey;
  String dropdownValue;

  DropdownBtn({
    @required this.hint,
    this.value,
    @required this.items,
    this.onChanged,
    this.itemsKey
  });
  @override
  _DropdownBtnState createState() => _DropdownBtnState(items);
}

class _DropdownBtnState extends State<DropdownBtn> {
  final List<DropdownButtonModel> items;
  _DropdownBtnState(this.items) {
    print('itmes:'+items[0].displayText);
  }
  DropdownButtonModel dropdownValue;
  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: DropdownButton(
        isExpanded: true,

        underline: new Container(),
        value: dropdownValue,
        hint: Text(widget.hint, style: GoogleFonts.merriweather(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black38),),
        onChanged: (newValue) {
          setState(() {
            dropdownValue = newValue;
            widget.onChanged(dropdownValue);
          });
        },
        items: items.map<DropdownMenuItem<DropdownButtonModel>>((var value) {
          return DropdownMenuItem<DropdownButtonModel>(
            value: value,
            child: Text(value.displayText, style: GoogleFonts.merriweather(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black87),),
          );
        }).toList(),
      ),
    );
  }
}

typedef selectItemChange = void Function(DropdownButtonModel);
