class SignInParams {
  final String email;
  final String password;
  final bool rememberMe;

  SignInParams({
    required this.email,
    required this.password,
    required this.rememberMe,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'rememberMe': rememberMe,
    };
  }
}
