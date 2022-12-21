import 'package:banking_api_dio/data/api_service/api_service.dart';
import 'package:banking_api_dio/data/models/expenses_model.dart';
import 'package:banking_api_dio/data/repository/expenses_repository.dart';
import 'package:flutter/cupertino.dart';

class ExpensesViewModel extends ChangeNotifier {
  ExpensesViewModel({required this.expensesRepository});

  List<ExpensesModel>? expensesModel;
  ExpensesRepository expensesRepository;
  String errorForUi = "";

  fetchIncomes() async {
    MyResponse myResponse = await expensesRepository.getAllExpenses();

    if (myResponse.error.isEmpty) {
      expensesModel = myResponse.data as List<ExpensesModel>;
    } else {
      errorForUi = myResponse.error;
    }
    notifyListeners();
  }
}