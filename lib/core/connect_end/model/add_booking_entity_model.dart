class AddBookingEntityModel {
  String? firstname;
  String? lastname;
  String? phone;
  String? gender;
  String? address;
  String? idType;
  String? businessId;
  String? idNumber;
  String? modeOfPayment;
  String? checkedIn;
  String? checkedOut;
  String? amountPaid;
  String? email;
  String? discount;

  AddBookingEntityModel({
    this.firstname,
    this.lastname,
    this.phone,
    this.gender,
    this.address,
    this.idType,
    this.businessId,
    this.idNumber,
    this.modeOfPayment,
    this.checkedIn,
    this.checkedOut,
    this.amountPaid,
    this.email,
    this.discount,
  });

  factory AddBookingEntityModel.fromJson(Map<String, dynamic> json) {
    return AddBookingEntityModel(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      idType: json['id_type'] as String?,
      businessId: json['business_id'] as String?,
      idNumber: json['id_number'] as String?,
      modeOfPayment: json['mode_of_payment'] as String?,
      checkedIn: json['checked_in'] as String?,
      checkedOut: json['checked_out'] as String?,
      amountPaid: json['amount_paid'] as String?,
      email: json['email'] as String?,
      discount: json['discount'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'lastname': lastname,
        'phone': phone,
        'gender': gender,
        'address': address,
        'id_type': idType,
        'id_number': idNumber,
        'mode_of_payment': modeOfPayment,
        'checked_in': checkedIn,
        'checked_out': checkedOut,
        'amount_paid': amountPaid,
        'email': email,
        'discount': discount,
      };
}
