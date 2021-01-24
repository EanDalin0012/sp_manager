 import 'package:sp_manager/model/vendor.dart';

class DropdownButtonModel {
    final String displayText;
    final Object object;
    DropdownButtonModel(this.displayText, this.object);

    static List<DropdownButtonModel> data() {
      return [
        DropdownButtonModel('item 1', VendorModel('dalin ', '', '', '', '')),
        DropdownButtonModel('item 2', VendorModel('ean', '', '', '', '')),
        DropdownButtonModel('item 3', VendorModel('e', '', '', '', '')),
        DropdownButtonModel('item 4', VendorModel('p', '', '', '', '')),
      ];
    }

    @override
  String toString() {
    return 'DropdownButtonModel{displayText: $displayText, object: $object}';
  }
}