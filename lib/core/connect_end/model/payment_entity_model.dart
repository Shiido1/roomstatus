class PaymentEntityModel {
  String? amountPaid;

  PaymentEntityModel({this.amountPaid});

  factory PaymentEntityModel.fromJson(Map<String, dynamic> json) {
    return PaymentEntityModel(
      amountPaid: json['amount_paid'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'amount_paid': amountPaid,
      };
}
