abstract class LocalStorageRepository {
  Future<void> saveUserData(String username, String email, String password);
  Future<Map<String, String>> loadUserData();
}
