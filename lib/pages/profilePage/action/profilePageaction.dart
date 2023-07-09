import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/user.dart';

Future<User> loadUserProfile() async {
  final prefs = await SharedPreferences.getInstance();
  final userData = prefs.getString('lpguser');
  final user1 = jsonDecode(userData!) as Map<String, dynamic>;
  final User user = User.fromJson(user1);
  return user;
}
