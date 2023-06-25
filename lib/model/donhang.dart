class DonHang {
  int? id;
  double? amountPaid;
  String? paymentDate;
  String? timeSlot;
  String? bookingDate;

  DonHang(
      {this.id,
      this.amountPaid,
      this.paymentDate,
      this.timeSlot,
      this.bookingDate});
  factory DonHang.fromJson(dynamic json) {
    return DonHang(
        id: json['id'],
        amountPaid: json['amountPaid'],
        paymentDate: json['paymentDate'],
        timeSlot: json['timeSlot'],
        bookingDate: json['bookingDate']);
  }
}
