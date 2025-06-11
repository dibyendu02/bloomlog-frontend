class ApiConstants {
  static const baseUrl = 'https://api.bloomlog.app/api/v1';
  static const timeout = 30;

  static const appNameHeader = 'MyApp';
  static const secretKeyHeader = 'SuperSecret';

  static bool requiresAuth(String path) {
    // Define which paths need auth
    return !['/auth/login', '/auth/signup'].any(path.contains);
  }
}
