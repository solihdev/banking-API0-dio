import 'package:banking_api_dio/data/models/transactions-expenses/expenses_model.dart';
import 'package:banking_api_dio/data/repository/expenses_repository.dart';
import 'package:flutter/cupertino.dart';
import '../data/models/my_response/my_response.dart';

class ExpensesViewModel extends ChangeNotifier {
  ExpensesViewModel({required this.expensesRepository}){
    fetchExpenses();
  }

  List<ExpensesModel> expenses=[];
  ExpensesRepository expensesRepository;
  String errorForUi = "";

  fetchExpenses() async {
    MyResponse myResponse = await expensesRepository.getAllExpenses();

    if (myResponse.error.isEmpty) {
      expenses = myResponse.data as List<ExpensesModel>;
    } else {
      errorForUi = myResponse.error;
    }
    notifyListeners();
  }
}
