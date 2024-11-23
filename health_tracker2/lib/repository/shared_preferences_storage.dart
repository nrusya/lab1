import 'package:health_tracker2/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage implements LocalStorageRepository {
  @override
  Future<void> saveUserData(
    String username,
    String email,
    String password,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  @override
  Future<Map<String, String>> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'username': prefs.getString('username') ?? '',
      'email': prefs.getString('email') ?? '',
      'password': prefs.getString('password') ?? '',
    };
  }
}
