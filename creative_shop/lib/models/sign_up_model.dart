class SignUpModel {
  String username;
  String email;
  String password;
  SignUpModel({
    required this.username,
    required this.email,
    required this.password,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson(SignUpModel model) {
    Map<String, dynamic> json = {};
    json['username'] = username;
    json['email'] = email;
    json['password'] = password;
    return json;
  }
}
