class ReceiverModel {
  String brandImage;
  String name;
  String location;

  ReceiverModel({
    required this.brandImage,
    required this.name,
    required this.location,
  });

  factory ReceiverModel.fromJson(Map<String, dynamic> json) {
    return ReceiverModel(
      brandImage: json['brand_image'] as String? ?? "",
      name: json['name'] as String? ?? "",
      location: json['location'] as String? ?? "",
    );
  }
}
