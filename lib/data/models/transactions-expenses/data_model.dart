import 'package:banking_api_dio/data/models/transactions-expenses/receiver_model.dart';

class DataModel {
  int transactionCode;
  String date;
  int expenseId;
  double amount;
  int cardId;
  ReceiverModel receiverModel;

  DataModel({
    required this.transactionCode,
    required this.date,
    required this.expenseId,
    required this.amount,
    required this.cardId,
    required this.receiverModel,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      transactionCode: json['transaction_code'] as int? ?? 0,
      date: json['date'] as String? ?? "",
      expenseId: json['expense_id'] as int? ?? 0,
      amount: json['amount'] as double? ?? 0.0,
      cardId: json['card_id'] as int? ?? 0,
      receiverModel: ReceiverModel.fromJson(json['receiver']),
    );
  }
}
