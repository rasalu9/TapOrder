class OrderproductModel {
  int? id;
  String? name;
  int? contact;

  OrderproductModel({
    this.id,
    this.name,
    this.contact,
  });

  factory OrderproductModel.fromJson(Map<String, dynamic> json) =>
      OrderproductModel(
        id: json["id"],
        name: json["name"],
        contact: json["contact"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "contact": contact,
      };
}
