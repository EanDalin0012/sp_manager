class TransactionSaleModel {
   final String logo;
   final String name;
   final String date;
   final String amount;

  TransactionSaleModel(this.logo, this.name, this.date, this.amount);

  static List<TransactionSaleModel> data() {
    return [
      TransactionSaleModel('asset/images/mcdonalds.png', 'McDonald\'s"', '22.02.2020', '-22,50'),
      TransactionSaleModel('asset/images/gas-station.png', "Petrol", '22.02.2020','-75,45'),
      TransactionSaleModel('asset/images/mcdonalds.png', "McDonald\'s", '22.02.2020', '-22,50'),
      TransactionSaleModel('asset/images/gas-station.png',"Petrol", '22.02.2020', '-75,45'),
      TransactionSaleModel('asset/images/mcdonalds.png', 'McDonald\'s"', '22.02.2020', '-22,50'),
      TransactionSaleModel('asset/images/gas-station.png', "Petrol", '22.02.2020','-75,45'),
      TransactionSaleModel('asset/images/mcdonalds.png', "McDonald\'s", '22.02.2020', '-22,50'),
      TransactionSaleModel('asset/images/gas-station.png',"Petrol", '22.02.2020', '-75,45'),
      TransactionSaleModel('asset/images/mcdonalds.png', 'McDonald\'s"', '22.02.2020', '-22,50'),
      TransactionSaleModel('asset/images/gas-station.png', "Petrol", '22.02.2020','-75,45'),
      TransactionSaleModel('asset/images/mcdonalds.png', "McDonald\'s", '22.02.2020', '-22,50'),
      TransactionSaleModel('asset/images/gas-station.png',"Petrol", '22.02.2020', '-75,45'),
      TransactionSaleModel('asset/images/mcdonalds.png', 'McDonald\'s"', '22.02.2020', '-22,50'),
      TransactionSaleModel('asset/images/gas-station.png', "Petrol", '22.02.2020','-75,45'),
      TransactionSaleModel('asset/images/mcdonalds.png', "McDonald\'s", '22.02.2020', '-22,50'),
      TransactionSaleModel('asset/images/gas-station.png',"Petrol", '22.02.2020', '-75,45'),
    ];
  }

}