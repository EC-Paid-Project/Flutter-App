import 'urlsClass/url_class.dart';

final apiClient = ApiClient(
  baseUrl: "https://dummyjson.com",
  headers: {'Content-Type': 'application/json'},
);
getAll()async{
  final a=await apiClient.get('/products?limit=10');
  // print(a.body);
  final b=a.body;
  return (b);
}