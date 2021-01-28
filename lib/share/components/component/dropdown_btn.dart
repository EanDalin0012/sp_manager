import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_manager/share/components/component/input_container.dart';

class DropdownBtn extends StatefulWidget {
  final selectItemChange onChanged;
  final List items;
  final String hint;
  final Object selectedIndex;
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
  @override
  Widget build(BuildContext context) {
    // dropdownValue = widget.value !=null ? widget.value : Object;
    // if(widget.value != null) {
    //   dropdownValue = widget.items[widget.value][widget.itemsKey];
    // }

    print(widget.selectedIndex);
    if(widget.selectedIndex == 'DropdownBtn.value') {
      print('dkajfkd');
    }

    if(widget.selectedIndex == null) {
      print('A');
    }

    return InputContainer(
      child: widget.selectedIndex == null ? _dropdownButton() : _dropdownButtonSelected()
    );
  }

  DropdownButton _dropdownButton() {
    print('testing');
    print(widget.selectedIndex);
    return DropdownButton(
        isExpanded: true,
        underline: new Container(),
        hint: Text(widget.hint, style: GoogleFonts.merriweather(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black38),),
        onChanged: (newValue) {
          setState(() {
            dropdownValue = newValue;
            widget.onChanged(newValue);
          });
        },
        items: widget.items.map((map) {
          return DropdownMenuItem(
            child: Text(map[widget.itemsKey], style: GoogleFonts.merriweather(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87)),
            value: map,
          );
        }).toList()
    );
  }

  DropdownButton _dropdownButtonSelected() {
    return DropdownButton(
        isExpanded: true,
        value: widget.items[widget.selectedIndex],
        underline: new Container(),
        hint: Text(widget.hint, style: GoogleFonts.merriweather(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black38),),
        onChanged: (newValue) {
          setState(() {
            dropdownValue = newValue;
            widget.onChanged(newValue);
          });
        },
        items: widget.items.map((map) {
          return DropdownMenuItem(
            child: Text(map[widget.itemsKey], style: GoogleFonts.merriweather(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87)),
            value: map,
          );
        }).toList()
    );
  }

}

typedef selectItemChange = void Function(Object);
