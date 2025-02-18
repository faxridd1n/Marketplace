class PostOrderRequestModel {
  final int paymentType;
  final int deliveryType;
  final int regionId;
  final int destrictId;
  final String fullName;
  final String phone;
  final String address;
  final String comment;
  final List<Items> items;

  const PostOrderRequestModel({
    this.paymentType = -1,
    this.deliveryType = -1,
    this.regionId = -1,
    this.destrictId = -1,
    this.fullName = '',
    this.phone = '',
    this.address = '',
    this.comment = '',
    this.items = const [],
  });
  Map<String, dynamic> toJson() => {
        "paymentType": paymentType,
        "deliveryType": deliveryType,
        "regionId": regionId,
        "districtId": destrictId,
        "fullName": fullName,
        "phone": phone,
        "address": address,
        "comment": comment,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
  PostOrderRequestModel copyWith({
    int? paymentType,
    int? deliveryType,
    int? regionId,
    int? destrictId,
    String? fullName,
    String? phone,
    String? address,
    String? comment,
    List<Items>? items,
  }) {
    return PostOrderRequestModel(
      paymentType: paymentType ?? this.paymentType,
      deliveryType: deliveryType ?? this.deliveryType,
      regionId: regionId ?? this.regionId,
      destrictId: destrictId ?? this.destrictId,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      comment: comment ?? this.comment,
      items: items ?? this.items,
    );
  }
}

class Items {
  final String variationId;
  final int count;

  const Items({
    this.variationId = '',
    this.count = -1,
  });

  Map<String, dynamic> toJson() => {
        "variationId": variationId,
        "count": count,
      };
}
