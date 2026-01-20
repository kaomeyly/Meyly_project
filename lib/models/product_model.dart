// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String title;
  String thumbnail;
  String description;
  String category;
  String brand;
  String availabilityStatus;
  String sku;
  String shippingInformation;
  String warrantyInformation;
  String returnPolicy;
  double price;
  double discountPercentage;
  List<String>? tags;

  ProductModel({
    required this.title,
    required this.thumbnail,
    required this.description,
    required this.category,
    required this.brand,
    required this.sku,
    required this.price,
    required this.discountPercentage,
    required this.availabilityStatus,
    required this.shippingInformation,
    required this.warrantyInformation,
    required this.returnPolicy,
    required this.tags,
  });

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      title: data["title"] ?? "No title",
      thumbnail: data["thumbnail"] ?? "No image",
      description: data["description"] ?? "",
      category: data["category"] ?? "",
      brand: data["brand"] ?? "",
      sku: data["sku"] ?? "",
      availabilityStatus: data["availabilityStatus"] ?? "",
      shippingInformation: data["shippingInformation"] ?? "",
      warrantyInformation: data["warrantyInformation"] ?? "",
      returnPolicy: data["returnPolicy"] ?? "",
      price: data["price"] ?? "",
      discountPercentage: data["discountPercentage"] ?? "",
      tags: List<String>.from(data["tags"] ?? []),
    );
  }
}
