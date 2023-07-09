class SignupUser {
  String username = '';
  String last_name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String address = '';
  int phone = 0;
  SignupUser();
  SignupUser.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        username = json['first_name'],
        last_name = json['last_name'],
        password = json['password'],
        confirmPassword = json['confirmPassword'],
        phone = json['phone'],
        address = json['address'];
  Map<String, dynamic> toJson() => {
        'email': email,
        'first_name': username,
        'username': email.substring(0, email.indexOf('@')),
        'password1': password,
        'password2': confirmPassword,
        'last_name': last_name,
        'address': address,
        'phone': phone,
      };
}
