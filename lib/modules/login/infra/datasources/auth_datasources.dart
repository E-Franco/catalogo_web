abstract class AuthDatasource {
  Future<bool> auth(String username, String password);
}
