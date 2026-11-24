import 'local_storage.dart';

class ApiUrl {
  /// base url
  static const String baseUrl = "https://task-management-nu-wheat-23.vercel.app/api/v1";

  static final StorageService storage = StorageService();

  /// login er endpoint
  static const String login = "$baseUrl/auth/signin";

  static const String signUp = "$baseUrl/auth/signup";
  
  static const String verifyOtp = "$baseUrl/auth/verify-otp";

  static const String termsAndConditions = "$baseUrl/terms-and-conditions";
  
  static const String privacyPolicy = "$baseUrl/privacy-policy";

  /// GET (list) / POST (create) -- delete er jonno "$tasks/{id}"
  static const String tasks = "$baseUrl/tasks";

  /// GET -- login kora user er profile
  static const String profile = "$baseUrl/user/profile";
}
