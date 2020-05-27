class AuthEvent {}

class AuthLogin extends AuthEvent{
  final _login;
  final _password;

  String get login => _login;
  String get password => _password;

  AuthLogin(this._login, this._password);
}