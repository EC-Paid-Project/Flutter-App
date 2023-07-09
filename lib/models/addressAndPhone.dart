class AddressAndPhone {
  String area = "";
  String houseNo = "";
  String postCode = "";
  int phone = 0;
  String city = "";
  AddressAndPhone();

  AddressAndPhone.fromJson(Map<String, dynamic> json)
      : area = json['area'],
        houseNo = json['houseNo'],
        postCode = json["postCode"],
        city = json["city"],
        phone = json['phone'];
  Map<String, dynamic> toJson() {
    return {
      'area': area,
      'houseNo': houseNo,
      'postCode': postCode,
      'phone': phone,
      'city': city,
    };
  }

  bool isValid() {
    return area.isNotEmpty &&
        houseNo.isNotEmpty &&
        postCode.isNotEmpty &&
        phone.toString().length == 10 &&
        city.isNotEmpty;
  }
}
