import 'package:banking_api_dio/data/models/transactions-expenses/data_model.dart';
class ExpensesModel {
  String transferDate;
  DataModel dataModel;

  ExpensesModel({
    required this.transferDate,
    required this.dataModel,
  });

  factory ExpensesModel.fromJson(Map<String, dynamic> json) {
    return ExpensesModel(
      transferDate: json['transfer_date'] as String? ?? "",
      dataModel: DataModel.fromJson(json['data']),
    );
  }
}
