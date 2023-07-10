import 'urlsClass/url_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

// final String baseUrl = "http://10.0.2.2:8000"; 
// to connect android emulator to localhost server
const String baseUrl = "https://owaisali246.pythonanywhere.com";

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

Future<String?> getAuthToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("authToken");
}

void addAuthTokenToHeaders(ApiClient apiClient) async {
  String? token = await getAuthToken();
  if (token != null && token.isNotEmpty) {
    apiClient.headers["Authorization"] = "Token $token";
  }
}

getAll() async {
  addAuthTokenToHeaders(apiClient3);

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
}

sendOrder(cart, address, type, id, transId) async {
try{

  addAuthTokenToHeaders(apiClient3);

  final response = await apiClient3.post(
      "/order/",
      {
        "cart": cart,
        "dis_id": int.parse(id),
        "type": type,
        "address": address,
        "Transcation_id": transId
      });
  return response.statusCode;
}catch(err){
  return 400;
}

}

getOne(id) async {
  final id1 = int.parse(id);
  addAuthTokenToHeaders(apiClient3);
  final response = await apiClient3.get('/products/$id1');
  final data = jsonDecode(response.body);
  var cylinder = data['cylinder']; //comment thse if error occure
  var discount = data['discount']; //1
  cylinder["discount"] = discount; //2
  return jsonEncode((cylinder)); //3
  // return response.body;
}

getSearch(search, size, price) async {

  // final response = await apiClient3.get("/products/search?search=$search&size=$size&price=$price");
  // final b = a.body;
  // return b;
}

login(body) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final response = await apiClient3.post("/dj-rest-auth/login/", body);
  dynamic jsonData = jsonDecode(response.body);
  if (jsonData['key'] != null) {
    final token = jsonData['key'];
    prefs.setString("authToken", token);
  
  }
  final a = await getUser();
  if(a!=null){

  return response;
  }
  return response;

}

signup(body) async {
  final response = await apiClient3.post("/dj-rest-auth/registration/", body);
  return response;
}

getDistrbutor() async {
  addAuthTokenToHeaders(apiClient3);
  final response = await apiClient3.get('/distributor');

  return response.body;
}

logout() async {
  try{

  addAuthTokenToHeaders(apiClient3);
  final response = await apiClient3.post("/dj-rest-auth/logout/",{});
  return response.statusCode;
  }catch(err){
    return 400;

  }
}

getOrderHistory() async {

  addAuthTokenToHeaders(apiClient3);
  final response = await apiClient3.get('/history');
  return response.body;
}

getOrderDetail(id) async {
  addAuthTokenToHeaders(apiClient3);
  final id1 = int.parse(id);
  final response = await apiClient3.get('/order/$id1');

  return response.body;
}

forgetPass() async {
  addAuthTokenToHeaders(apiClient3);
  const email = "mohb@gmail.com";
  final response = await apiClient3.post('/dj-rest-auth/password/reset/', {"email": email});
  return response.body;
}

getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if (token != null && token.isNotEmpty) {
    addAuthTokenToHeaders(apiClient3);
    final response = await apiClient3.get('/dj-rest-auth/user/');
    prefs.setString("lpguser", jsonEncode(response.body));
    return response.body;
  }
}
getCrousel ()async{
  addAuthTokenToHeaders(apiClient3);

  final res=await apiClient3.get('/offers');
  return res.body;

}

bank(email,phone,account,country)async{
  addAuthTokenToHeaders(apiClient3);
  final res=await apiClient3.post('/alfa_pay/',{"MobileNumber": phone,
        "AccountNumber": account,
        "Country": "164",
        "EmailAddress": email,});
  return jsonDecode(res.body)["Transaction ID "];
  
// "MobileNumber": "03363042666",
//         "AccountNumber": "930003009542301",
//         "Country": "164",
//         "EmailAddress": "owaisali246.soa@gmail.com",
}
googlelogin(token1)async{
  final response=await apiClient3.post("/dj-rest-auth/google/",{"access_token":token1});
  SharedPreferences prefs = await SharedPreferences.getInstance();
   dynamic jsonData = jsonDecode(response.body);
    String token = jsonData['key'];
    prefs.setString("authToken",token);
  if(response.statusCode==200){
await getUser();
  } 
  return response.body;
}


resetPassword(body) async{
final response=await apiClient3.post("/dj-rest-auth/password/reset/",{"email":body});
// final Map<String,dynamic> pass_data=jsonDecode(response.body)["pass_data"]; 
if(response.statusCode==200){

return jsonDecode(response.body)["pass_data"];
}else{
  return null;
}
}
sendOtp(body,uid,token) async{
final response=await apiClient3.post("/dj-rest-auth/password/reset/confirm/$uid/$token/",body);
// final Map<String,dynamic> pass_data=jsonDecode(response.body)["pass_data"]; 

if(response.statusCode==200){

return 200;
}else{
  return null;
}
}

