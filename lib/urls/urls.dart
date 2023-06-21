import 'package:encrypt/encrypt.dart';
import 'urlsClass/url_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';


// final String baseUrl="https://f4a9-154-81-252-168.ngrok-free.app";
final String baseUrl="https://owaisali246.pythonanywhere.com";
 fun()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token=prefs.getString("authToken");
    return token;
}

final apiClient3 = ApiClient(

// owaisali246.pythonanywhere.com/
  baseUrl:baseUrl,
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

     apiClient3.headers["Authorization"]="Token $token";

    final response = await apiClient3.get('/products');
    print(response.body);

    return response.body;

  } else {
    // Handle the case where the token is empty or null
    // return an appropriate value or throw an error
  }
}

  sendOrder(cart,address,type,id,transId) async{
  print(jsonEncode(cart));
  print(jsonEncode(address));
  print(jsonEncode(id));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if (token != null && token.isNotEmpty) {
     apiClient3.headers["Authorization"]="Token $token";
  }
  print(jsonEncode(address));
  
    final response=await apiClient3.post("/order/",{"cart":cart,"dis_id":int.parse(id),"type":type,"address":address,"Transcation_id":transId});
    print(response.body);
    return response.body;
  }


sendAddress(address)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if (token != null && token.isNotEmpty) {
     apiClient3.headers["Authorization"]="Token $token";
  }
  print(apiClient3.headers);
final response=await apiClient3.post("/address/",address);
print(response.body);
}
getOne(id) async{
  final id1=int.parse(id);
  final response = await apiClient3.get('/products/$id1');
  print(response.body);
  return response.body;

}

getSearch(search,size,price) async {
  print(search+size+price);
  // final response = await apiClient3.get("/products/search?search=$search&size=$size&price=$price");
  // final b = a.body;
  // return b;
}

login(body) async {
  
    SharedPreferences prefs = await SharedPreferences.getInstance();


  final response = await apiClient3.post("/dj-rest-auth/login/", body);
    dynamic jsonData = jsonDecode(response.body);
    String token = jsonData['key'];
    prefs.setString("authToken",token);
    print(prefs.getString('authToken'));
final a=await getUser();




  return response.body;
}

signup(body) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  // String? token = prefs.getString("authToken");
  // print(token);
    print(jsonEncode(body));
  final response=await apiClient3.post("/dj-rest-auth/registration/", body);
// print(response.body);
// print("------------------")
// ;
  // print(jsonEncode(body));
return response.body;
    // final a=prefs.getString("lpguser");
    // Retrieve the value associated with the key 'token'
}

getDistrbutor() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if(token!=null && token.isNotEmpty){
    apiClient3.headers["Authorization"]="Token $token";
  }
  final response = await apiClient3.get('/distributor');
  print(response.body);
  return response.body;

}

// make future builder in



// logout from django
logout()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if(token!=null && token.isNotEmpty){
    apiClient3.headers["Authorization"]="Token $token";
  }
final response=await apiClient3.get("/dj-rest-auth/logout/");
return response.body;
}





// get order history
getOrderHistory() async{
  print("kjk");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if(token!=null && token.isNotEmpty){
    apiClient3.headers["Authorization"]="Token $token";
  }
  final response = await apiClient3.get('/history');
  print(response.body);
return response.body;




}


//get order detail 
getOrderDetail(id)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if(token!=null && token.isNotEmpty){
    apiClient3.headers["Authorization"]="Token $token";
  }

final id1=int.parse(id);
  final response = await apiClient3.get('/order/$id1');
  print(response.body);
  return response.body;


}


// forget pass function 
forgetPass()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if(token!=null && token.isNotEmpty){
    apiClient3.headers["Authorization"]="Token $token";
  }
const email="mohb@gmail.com";
  final response = await apiClient3.post('/dj-rest-auth/password/reset/',{"email":email});
  print(response.body);
   return response.body;

}
getUser()async{
// const email="mohb@gmail.com";
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if(token!=null && token.isNotEmpty){
    apiClient3.headers["Authorization"]="Token $token";
  }
  final response = await apiClient3.get('/dj-rest-auth/user/',);
    prefs.setString("lpguser",jsonEncode(response.body));
  print(response.body);
   return response.body;

}



getCrousel ()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if(token!=null && token.isNotEmpty){
    apiClient3.headers["Authorization"]="Token $token";
  final res=await apiClient3.get('/offers');
  print(res.body);
  return res.body;
  }

}

bank(email,phone,account,country)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if(token!=null && token.isNotEmpty){
    apiClient3.headers["Authorization"]="Token $token";
  final res=await apiClient3.post('/alfa_pay/',{"MobileNumber": phone,
        "AccountNumber": account,
        "Country": "164",
        "EmailAddress": email,});
  print(res.body);
  return jsonDecode(res.body)["Transaction ID "];
  }
// "MobileNumber": "03363042666",
//         "AccountNumber": "930003009542301",
//         "Country": "164",
//         "EmailAddress": "owaisali246.soa@gmail.com",
}
googlelogin(token1)async{
  print("-------------------------");
  final response=await apiClient3.post("/dj-rest-auth/google/",{"access_token":token1});
  SharedPreferences prefs = await SharedPreferences.getInstance();
   dynamic jsonData = jsonDecode(response.body);
    String token = jsonData['key'];
    prefs.setString("authToken",token);
  print(response.body);
  if(response.statusCode==200){
await getUser();
  } 
  return response.body;
}








//send addresss



// Function to initiate handshake
 
