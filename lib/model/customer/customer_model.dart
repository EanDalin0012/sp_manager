class CustomerModel {

  final String firstName;
  final String lastName;
  final String contact;
  final String email;
  final String address;
  final String photo;

  CustomerModel(this.firstName, this.lastName, this.contact, this.email, this.address, this.photo);

  static List<CustomerModel> data() {
    return [
      CustomerModel('ean', 'dalin', '096 65 55 987', 'eandalin@gmail.com', 'PP', 'https://www.sadcasm.co/wp-content/uploads/2018/07/happy-man-1.jpeg'),
      CustomerModel('Sopheary', 'Chhay', '071 29 38 097', 'sophearychhay@gmail.com', 'Takeo', 'https://www.sadcasm.co/wp-content/uploads/2018/07/happy-man-1.jpeg'),
      CustomerModel('Touy', 'Tiny', '088 45 89 457', 'touytiny@gmail.com', 'Takeo', 'https://www.sadcasm.co/wp-content/uploads/2018/07/happy-man-1.jpeg'),
      CustomerModel('Phu', 'Sokoundom', '096 87 587', 'phusokoumdom@gmail.com', 'Kom Pot', 'https://www.sadcasm.co/wp-content/uploads/2018/07/happy-man-1.jpeg'),
      CustomerModel('Khun', 'Paly', '096 87 54 962', 'khunplay@gmail.com', 'Takeo', 'https://www.sadcasm.co/wp-content/uploads/2018/07/happy-man-1.jpeg'),
      CustomerModel('Lon', 'Sokny', '096 87 95 231', 'lonsokny@gmail.com', 'Takeo', 'https://www.sadcasm.co/wp-content/uploads/2018/07/happy-man-1.jpeg'),
      CustomerModel('Khim', 'Soyeang', '098 66 222 148', 'khimsoyeang@gmail.com', 'Takeo', 'https://www.sadcasm.co/wp-content/uploads/2018/07/happy-man-1.jpeg'),
      CustomerModel('Sok Seng', 'Srey Phea', '096 888 74 962', 'soksengsreyphea@gmail.com', 'Takeo', 'https://www.sadcasm.co/wp-content/uploads/2018/07/happy-man-1.jpeg'),
      CustomerModel('នាត', 'ស្រីនូ', '071 29 38 097', 'natsreyno@gmail.com', 'Takeo', 'https://www.sadcasm.co/wp-content/uploads/2018/07/happy-man-1.jpeg'),
      CustomerModel('Ah', 'Linda', '071 29 38 097', 'ahlinda@gmail.com', 'Takeo', 'https://www.sadcasm.co/wp-content/uploads/2018/07/happy-man-1.jpeg'),
      CustomerModel('Fii', 'Ly', '071 29 38 097', 'fiily@gmail.com', 'Takeo', 'https://www.sadcasm.co/wp-content/uploads/2018/07/happy-man-1.jpeg')
    ];
  }

  @override
  String toString() {
    return 'CustomerModel{firstName: $firstName, lastName: $lastName, contact: $contact, email: $email, address: $address, photo: $photo}';
  }
}