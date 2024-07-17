class ResentOtpEntityModel {
	String? email;

	ResentOtpEntityModel({this.email});

	factory ResentOtpEntityModel.fromJson(Map<String, dynamic> json) {
		return ResentOtpEntityModel(
			email: json['email'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'email': email,
			};
}
