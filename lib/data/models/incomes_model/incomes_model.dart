class IncomesModel {
  int id;
  String incomeType;
  String icon;
  String color;

  IncomesModel({
    required this.id,
    required this.incomeType,
    required this.icon,
    required this.color,
  });

  factory IncomesModel.fromJson(Map<String, dynamic> json) {
    return IncomesModel(
      id: json['id'] as int? ?? 0,
      incomeType: json["income_type"] as String? ?? "",
      icon: json['icon'] as String? ?? "",
      color: json['color'] as String? ?? "",
    );
  }
}
