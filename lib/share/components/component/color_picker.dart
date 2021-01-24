import 'package:flutter/material.dart';
import 'package:sp_manager/share/components/component/input_container.dart';
class ColorPicker extends StatelessWidget {
  const ColorPicker({this.onColorSelect});

  final ColorCallback onColorSelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          child: Text('red'),
          color: Colors.red,
          onPressed: () {
            onColorSelect(Colors.red);
          },
        ),
        RaisedButton(
          child: Text('green'),
          color: Colors.green,
          onPressed: () {
            onColorSelect(Colors.green);
          },
        ),
        RaisedButton(
          child: Text('blue'),
          color: Colors.blue,
          onPressed: () {
            onColorSelect(Colors.blue);
          },
        )
      ],
    );
  }
}

typedef ColorCallback = void Function(Color color);


