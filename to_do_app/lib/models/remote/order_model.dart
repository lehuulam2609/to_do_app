class OrderModel {
  int id;
  String name;
  double price;
  int quantity;
  int type;

  OrderModel({
    this.id,
    this.name,
    this.price,
    this.quantity,
    this.type,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: int.tryParse((json['id'] ?? '').toString()),
      name: (json["name"] ?? '').toString(),
      price: double.tryParse((json['price'] ?? '').toString()),
      quantity: int.tryParse((json['quantity'] ?? '').toString()),
      type: int.tryParse((json['type'] ?? '').toString()),
    );
  }
}