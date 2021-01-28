import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_manager/share/components/component/input_container.dart';

class DropdownBtn extends StatefulWidget {
  final selectItemChange onChanged;
  final List items;
  final String hint;
  final Map<String, Object> selectedIndex;
  final String itemsKey;
  String dropdownValue;

  DropdownBtn({
    @required this.hint,
    this.selectedIndex,
    @required this.items,
    this.onChanged,
    @required this.itemsKey
  });
  @override
  _DropdownBtnState createState() => _DropdownBtnState();
}

class _DropdownBtnState extends State<DropdownBtn> {
  Map<String, Object> dropdownValue;
  bool b = false;
  @override
  Widget build(BuildContext context){
    if(widget.selectedIndex != null && b == false) {
      dropdownValue = widget.selectedIndex;
    }
    return InputContainer(
      child: DropdownButton(
          isExpanded: true,
          value: dropdownValue,
          underline: new Container(),
          hint: Text(widget.hint, style: GoogleFonts.merriweather(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black38),),
          onChanged: (newValue) {
            setState(() {
              widget.onChanged(newValue);
              b = true;
              dropdownValue = newValue;
            });
          },
          items: widget.items.map((map) {
            return DropdownMenuItem(
              child: Text(map[widget.itemsKey], style: GoogleFonts.merriweather(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87)),
              value: map,
            );
          }).toList()
      )
    );
  }
}

typedef selectItemChange = void Function(Object);
