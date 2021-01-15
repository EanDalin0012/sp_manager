class SaleDetailsProductModel {
  final String transaction_id;
  final double total;
  final String currency;
  final String date;
  final String status;
  final String remark;


  SaleDetailsProductModel(this.transaction_id, this.total,this.currency, this.date, this.status, this.remark);

  static List<SaleDetailsProductModel> data() {
    return [
      SaleDetailsProductModel('TID01012020', 90000.00, 'USD', '01-01-2020', 'B200', 'r'),
      SaleDetailsProductModel('TID01012021', 200.00, 'USD', '02-01-2020', 'A200', '01-01-2020'),
      SaleDetailsProductModel('TID01011021', 50.00, 'USD', '03-01-2020', 'B500', '01-01-2020'),
      SaleDetailsProductModel('TID01011021', 90.00, 'USD', '04-01-2020', 'A200', '01-01-2020'),
      SaleDetailsProductModel('TID010d1021', 50.00, 'USD', '05-01-2020', 'A200', '01-01-2020'),
      SaleDetailsProductModel('TID1111021',  90.00, 'USD', '06-01-2020', 'A200', '01-01-2020'),
      SaleDetailsProductModel('TID11011021', 60.00, 'USD', '07-01-2020', 'A200', '01-01-2020'),
      SaleDetailsProductModel('TID21211021', 40.00, 'USD', '08-01-2020', 'A200', '01-01-2020'),
      SaleDetailsProductModel('TID02211021', 40.00, 'USD', '01-03-2020', 'B500', '01-01-2020'),
      SaleDetailsProductModel('TID02211021', 10.00, 'USD', '04-03-2020', 'B500', '01-01-2020'),
      SaleDetailsProductModel('TID09811021', 90.00, 'USD', '01-08-2020', 'B200', '01-01-2020'),
      SaleDetailsProductModel('TID00911021', 90.00, 'USD', '01-09-2020', 'B200', '01-01-2020'),
      SaleDetailsProductModel('TID95811021', 70.00, 'USD', '01-04-2020', 'B200', '01-01-2020'),
      SaleDetailsProductModel('TID81411021', 400.00, 'USD', '01-05-2020', 'B200', '01-01-2020'),
      SaleDetailsProductModel('TID08311021', 40.00, 'USD', '01-06-2020', 'B200', '01-01-2020'),
      SaleDetailsProductModel('TID18911021', 10.00, 'USD', '01-07-2020', 'B200', '01-01-2020'),
      SaleDetailsProductModel('TID09311021', 20.00, 'USD', '01-08-2020', 'B200', '01-01-2020'),
      SaleDetailsProductModel('TID19511621', 500.00, 'USD', '01-09-2020', 'B200', '01-01-2020'),
    ];
  }
}