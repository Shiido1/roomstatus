class LoginEntityModel {
  String? code;
  String? username;
  String? password;
  String? deviceName;

  LoginEntityModel({
    this.code,
    this.username,
    this.password,
    this.deviceName,
  });

  factory LoginEntityModel.fromJson(Map<String, dynamic> json) {
    return LoginEntityModel(
      code: json['code'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      deviceName: json['device_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'username': username,
        'password': password,
        'device_name': deviceName,
      };
}
