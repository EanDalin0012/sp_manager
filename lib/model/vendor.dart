class VendorModel {
    final String name;
    final String address;
    final String contact;
    final String email;
    final String photo;

    VendorModel(this.name, this.address, this.contact, this.email, this.photo);

    static List<VendorModel> data() {
      return [
        VendorModel('Ean Dalin', 'PP', '096 65 55 879', 'eandalin@gmail.com', 'https://manofmany.com/wp-content/uploads/2019/06/50-Long-Haircuts-Hairstyle-Tips-for-Men-2.jpg'),
        VendorModel('Lue Kong Sun', 'PP', '096 874 569', 'luekongsun@gamil.com', 'https://www.click2houston.com/resizer/A0p2ChPTttB2rrVxAxVEN-XWzm4=/480x600/smart/filters:format(jpeg):strip_exif(true):strip_icc(true):no_upscale(true):quality(65)/arc-anglerfish-arc2-prod-gmg.s3.amazonaws.com/public/PUD7JFA7QJCUJBFSTCO232DXTE.png'),
        VendorModel('Chhay Sopheary', 'Takeo', '096 65 55 879', 'chhaysopheary@gmail.com', 'https://www.gannett-cdn.com/presto/2020/07/28/PMAN/181e4cbb-e6a6-4726-b039-aba995ae3210-kayla_bohland_002.jpg?width=600&height=886&fit=crop&format=pjpg&auto=webp'),
        VendorModel('Li MaKong', 'PP', '096 65 55 879', 'limakong@gmail.com', 'https://manofmany.com/wp-content/uploads/2019/06/50-Long-Haircuts-Hairstyle-Tips-for-Men-2.jpg')
      ];
    }

    @override
    String toString() {
      return 'VendorModel{name: $name, address: $address, contact: $contact, email: $email, photo: $photo}';
    }
}