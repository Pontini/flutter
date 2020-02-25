abstract class IAuthRepository{
  Future getUser();
  Future getGoogleLogin();
  Future getFaebookLogin();
  Future getEmailPasswordLogin();
  Future<String> getToken();
}