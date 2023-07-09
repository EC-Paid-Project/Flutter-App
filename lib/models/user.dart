class LoginUser {
  int userId = -1;
  String email = "";
  String password = "";
  LoginUser({this.userId = -1, this.email = "", this.password = ""});
  LoginUser.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'],
        email = json['email'],
        password = json['password'];
  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

class User {
  String username = "";
  String email = "";
  User({this.username = "", this.email = ""});
  User.fromJson(Map<String, dynamic> json)
      : username = json['first_name'],
        email = json['email'];
}
