abstract class EnvironmentVariables {
  static const String apiKey = String.fromEnvironment('API_KEY');
  static const String authDomain = String.fromEnvironment('AUTH_DOMAIN');
  static const String projectId = String.fromEnvironment('PROJECT_ID');
  static const String storageBucket = String.fromEnvironment('STORAGE_BUKET');
  static const String messagingSenderId = String.fromEnvironment('MESSAGING_SENDER_ID');
  static const String appId = String.fromEnvironment('APP_ID');
  static const String measurementId = String.fromEnvironment('MEASUREMENT_ID');
}
