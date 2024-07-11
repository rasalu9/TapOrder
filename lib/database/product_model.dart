class ProductModel {
  int? id;
  String? product;
  double? price;

  ProductModel({
    this.id,
    this.product,
    this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        product: json["product"],
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product,
        "price": price,
      };
}
