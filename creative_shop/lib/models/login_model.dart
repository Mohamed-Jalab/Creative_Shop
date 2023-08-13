class LoginModel {
  String email;
  String password;
  LoginModel({
    required this.email,
    required this.password,
  });
  factory LoginModel.fromJson(Map<String, String> json) {
    return LoginModel(
      email: json['email']!,
      password: json['password']!,
    );
  }
  Map<String, String> toJson() {
    Map<String, String> json = <String, String>{};
    json['email'] = email;
    json['password'] = password;
    return json;
  }
}
