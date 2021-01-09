import 'package:flutter/material.dart';
import 'package:sp_manager/share/components/show_modal_sheet/ShowModalSheetBody.dart';

class ShowModalSheet extends StatefulWidget {
  @override
  _ShowModalSheetState createState() => _ShowModalSheetState();
}

class _ShowModalSheetState extends State<ShowModalSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowModalSheetBody(),
    );
  }
}
