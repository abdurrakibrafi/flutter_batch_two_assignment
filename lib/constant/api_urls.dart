
import 'local_storage.dart';

class ApiUrl {
  /// base url
  static const String baseUrl = "https://taskmanagment.nahid.cc/api/v1";

  static final StorageService storage = StorageService();

  /// login er endpoint
  static const String login = "$baseUrl/auth/signin";

  static const String signUpErApi = "$baseUrl/auth/signup";
}
