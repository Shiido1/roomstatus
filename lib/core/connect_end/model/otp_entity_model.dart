class OtpEntityModel {
  String? email;
  String? otp;

  OtpEntityModel({this.email, this.otp});

  factory OtpEntityModel.fromJson(Map<String, dynamic> json) {
    return OtpEntityModel(
      email: json['email'] as String?,
      otp: json['otp'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'otp': otp,
      };
}
