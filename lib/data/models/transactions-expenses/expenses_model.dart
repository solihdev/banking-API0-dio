import 'package:banking_api_dio/data/models/transactions-expenses/data_model.dart';
class ExpensesModel {
  String transferDate;
  List<DataModel> dataModel;

  ExpensesModel({
    required this.transferDate,
    required this.dataModel,
  });

  factory ExpensesModel.fromJson(Map<String, dynamic> json) {
    return ExpensesModel(
      transferDate: json['transfer_date'] as String? ?? "",
      dataModel: List<DataModel>.from(
        json["data"].map(
              (x) => DataModel.fromJson(x),
        ) as List? ??
            [],
      ),
    );
  }
}
