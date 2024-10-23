import 'package:shared_preferences/shared_preferences.dart';
class AppSharedPreferenceHelper {
  // Step 1: Create a private static variable to hold the singleton instance
  static final AppSharedPreferenceHelper _instance =
  AppSharedPreferenceHelper._internal();

  // Step 2: Create a private constructor to prevent external instantiation
  AppSharedPreferenceHelper._internal();

  // Step 3: Provide a factory constructor that returns the singleton instance
  factory AppSharedPreferenceHelper() {
    return _instance;
  }

  // Write Data
  Future<bool> saveCustomerData(String key, String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(key, value);
  }

  // Read Data
  Future<String?> getCustomerData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }

  // Clean data
  Future<void> clearCustomerData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
