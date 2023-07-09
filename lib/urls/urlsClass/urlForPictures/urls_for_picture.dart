import 'package:http/http.dart' as http;
import 'dart:async';

FutureOr<http.Response> orgSignUp(formData) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('http://localhost:3001/user/signin'),
  );

  request.fields['name'] = formData.name;
  request.fields['address'] = formData.address;
  request.fields['password'] = formData.password;
  request.fields['email'] = formData.email;
  var imageFile =
      await http.MultipartFile.fromPath('image', formData.image.path);
  request.files.add(imageFile);
  var response = await request.send();
  return http.Response.fromStream(response);
}
