class ApiEndpoints {
  ApiEndpoints._();
  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // For Andriod
  static const String baseUrl = "http://10.0.2.2:3000/api/v1";
  // static const String baseUrl = "http://192.168.1.128:3000/api/v1";
  // For iOS
  // static const String baseUrl = "http://localhost:3000/api/v1";
}
