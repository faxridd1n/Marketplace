class PostOrderRequestModel {
  final int paymentType;
  final int deliveryType;
  final int regionId;
  final int destrictId;
  final String address;
  final String comment;
  final List<Item> items;

  const PostOrderRequestModel({
    this.paymentType = -1,
    this.deliveryType = -1,
    this.regionId = -1,
    this.destrictId = -1,
    this.address = '',
    this.comment = '',
    this.items = const [],
  });
  Map<String, dynamic> toJson() => {
        "paymentType": paymentType,
        "deliveryType": deliveryType,
        "regionId": regionId,
        "districtId": destrictId,
        "address": address,
        "comment": comment,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
  PostOrderRequestModel copyWith({
    int? paymentType,
    int? deliveryType,
    int? regionId,
    int? destrictId,
    String? address,
    String? comment,
    List<Item>? items,
  }) {
    return PostOrderRequestModel(
      paymentType: paymentType ?? this.paymentType,
      deliveryType: deliveryType ?? this.deliveryType,
      regionId: regionId ?? this.regionId,
      destrictId: destrictId ?? this.destrictId,
      address: address ?? this.address,
      comment: comment ?? this.comment,
      items: items ?? this.items,
    );
  }
}

class Item {
  final String variationId;
  final int count;

  const Item({
    this.variationId = '',
    this.count = -1,
  });

  Map<String, dynamic> toJson() => {
        "variationId": variationId,
        "count": count,
      };
}
