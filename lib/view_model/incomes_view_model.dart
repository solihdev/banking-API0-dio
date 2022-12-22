import 'package:banking_api_dio/data/models/incomes_model/incomes_model.dart';
import 'package:banking_api_dio/data/repository/incomes_repository.dart';
import 'package:flutter/cupertino.dart';
import '../data/models/my_response/my_response.dart';

class IncomesViewModel extends ChangeNotifier {
  IncomesViewModel({required this.incomesRepository});

  List<IncomesModel>? incomesModel;
  IncomesRepository incomesRepository;
  String errorForUi = "";

  fetchIncomes() async {
    MyResponse myResponse = await incomesRepository.getAllIncomes();

    if (myResponse.error.isEmpty) {
      incomesModel = myResponse.data as List<IncomesModel>;
    } else {
      errorForUi = myResponse.error;
    }
    notifyListeners();
  }
}
