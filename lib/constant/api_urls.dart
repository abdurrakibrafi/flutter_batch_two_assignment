
import 'local_storage.dart';

class ApiUrl {
  static const String baseUrl = "https://taskmanagment.nahid.cc/api/v1";

  static final StorageService storage = StorageService();

  static const String login = "$baseUrl/auth/signin";



}
