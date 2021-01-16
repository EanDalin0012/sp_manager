import 'package:flutter/material.dart';

class ShowDialog {

  static Widget showDialogYesNo({BuildContext buildContext, Widget title, Widget content, double elevation, VoidCallback onPressed}) {
    showDialog (
        context: buildContext,
        builder: (BuildContext context) {
      return AlertDialog(
        elevation:elevation,
        title: title,
        content: content,
        actions: <Widget>[
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              print('data testing');
              Navigator.pop(buildContext);
              return onPressed();
            },
          ),
          FlatButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.pop(buildContext);
            },
          )
      ],
    );});
  }

  Container _container() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(30))
      ),
    );
  }
}
