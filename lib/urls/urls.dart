import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'urlsClass/url_class.dart';

// final String baseUrl="http://10.0.2.2:8000"; // to connect android emulator to localhost server
const String baseUrl = "https://owaisali246.pythonanywhere.com";

fun() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("authToken");
  return token;
}

final apiClient3 = ApiClient(
// owaisali246.pythonanywhere.com/
  baseUrl: baseUrl,
  headers: {'Content-Type': 'application/json'},
);
final apiClient = ApiClient(
  baseUrl: "https://dummyjson.com",
  headers: {'Content-Type': 'application/json'},
);
final apiClient2 = ApiClient(
  baseUrl: "https://sandbox.bankalfalah.com",
  headers: {'Content-Type': 'application/json'},
);
getAll() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");

  if (token != null && token.isNotEmpty) {
    apiClient3.headers["Authorization"] = "Token $token";

    final response = await apiClient3.get('/products');
    List<dynamic> data = jsonDecode(response.body);
    List products = [];

    for (var item in data) {
      var cylinder = item['cylinder'];
      var discount = item['discount'];
      cylinder["discount"] = discount;
      products.add(cylinder);
    }
    return jsonEncode(products);
  } else {}
}

getAlld() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");

  if (token != null && token.isNotEmpty) {
    apiClient3.headers["Authorization"] = "Token $token";
    final response = await apiClient3.get('/discounts');
    return response.body;
  } else {}
}

sendOrder(cart, address, type, id, transId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if (token != null && token.isNotEmpty) {
    apiClient3.headers["Authorization"] = "Token $token";
  }
  final response = await apiClient3.post("/order/", {
    "cart": cart,
    "dis_id": int.parse(id),
    "type": type,
    "address": address,
    "Transcation_id": transId
  });
  return response.body;
}

sendAddress(address) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if (token != null && token.isNotEmpty) {
    apiClient3.headers["Authorization"] = "Token $token";
  }
}

getOne(id) async {
  final id1 = int.parse(id);
  final response = await apiClient3.get('/products/$id1');
  final data = jsonDecode(response.body);
  var cylinder = data['cylinder'];
  var discount = data['discount'];
  cylinder["discount"] = discount;
  return jsonEncode((cylinder));
}

login(body) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final response = await apiClient3.post("/dj-rest-auth/login/", body);
  dynamic jsonData = jsonDecode(response.body);
  if (jsonData['key'] != null) {
    final token = jsonData['key'];
    prefs.setString("authToken", token);
  }
  return response;
}

signup(body) async {
  final response = await apiClient3.post("/dj-rest-auth/registration/", body);
  return response;
}

getDistrbutor() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if (token != null && token.isNotEmpty) {
    apiClient3.headers["Authorization"] = "Token $token";
  }
  final response = await apiClient3.get('/distributor');
  return response.body;
}

logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if (token != null && token.isNotEmpty) {
    apiClient3.headers["Authorization"] = "Token $token";
  }
  final response = await apiClient3.get("/dj-rest-auth/logout/");
  return response.body;
}

getOrderHistory() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if (token != null && token.isNotEmpty) {
    apiClient3.headers["Authorization"] = "Token $token";
  }
  final response = await apiClient3.get('/history');
  return response.body;
}

getOrderDetail(id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if (token != null && token.isNotEmpty) {
    apiClient3.headers["Authorization"] = "Token $token";
  }

  final id1 = int.parse(id);
  final response = await apiClient3.get('/order/$id1');
  return response.body;
}

forgetPass() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if (token != null && token.isNotEmpty) {
    apiClient3.headers["Authorization"] = "Token $token";
  }
  const email = "mohb@gmail.com";
  final response =
      await apiClient3.post('/dj-rest-auth/password/reset/', {"email": email});
  return response.body;
}

getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if (token != null && token.isNotEmpty) {
    apiClient3.headers["Authorization"] = "Token $token";
  }
  final response = await apiClient3.get(
    '/dj-rest-auth/user/',
  );
  prefs.setString("lpguser", jsonEncode(response.body));
  return response.body;
}

getCrousel() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if (token != null && token.isNotEmpty) {
    apiClient3.headers["Authorization"] = "Token $token";
    final res = await apiClient3.get('/offers');
    return res.body;
  }
}

bank(email, phone, account, country) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if (token != null && token.isNotEmpty) {
    apiClient3.headers["Authorization"] = "Token $token";
    final res = await apiClient3.post('/alfa_pay/', {
      "MobileNumber": phone,
      "AccountNumber": account,
      "Country": "164",
      "EmailAddress": email,
    });
    return jsonDecode(res.body)["Transaction ID "];
  }
}

googlelogin(token1) async {
  final response =
      await apiClient3.post("/dj-rest-auth/google/", {"access_token": token1});
  SharedPreferences prefs = await SharedPreferences.getInstance();
  dynamic jsonData = jsonDecode(response.body);
  String token = jsonData['key'];
  prefs.setString("authToken", token);
  if (response.statusCode == 200) {
    await getUser();
  }
  return response.body;
}

resetPassword(body) async {
  final response =
      await apiClient3.post("/dj-rest-auth/password/reset/", {"email": body});
  if (response.statusCode == 200) {
    return jsonDecode(response.body)["pass_data"];
  } else {
    return null;
  }
}

sendOtp(body, uid, token) async {
  final response = await apiClient3.post(
      "/dj-rest-auth/password/reset/confirm/$uid/$token/", body);
  if (response.statusCode == 200) {
    return 200;
  } else {
    return null;
  }
}
