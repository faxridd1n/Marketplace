class PostOrderRequestModel {
  int paymentType;
  int deliveryType;
  int regionId;
  int destrictId;
  String address;
  String comment;
  List<Item> items;

  PostOrderRequestModel({
    this.paymentType = -1,
    this.deliveryType = -1,
    this.regionId = -1,
    this.destrictId = -1,
    this.address = '',
    this.comment = '',
    this.items = const [],
  });
}

class Item {
  final String variationId;
  final int count;

  Item({
    this.variationId = '',
    this.count = -1,
  });
}
