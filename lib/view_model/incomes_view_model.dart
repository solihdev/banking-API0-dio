import 'package:banking_api_dio/data/models/incomes_model.dart';
import 'package:banking_api_dio/data/repository/incomes_repository.dart';
import 'package:flutter/cupertino.dart';

class IncomesViewModel extends ChangeNotifier {
  IncomesViewModel({required this.incomesRepository});

  List<IncomesModel>? incomesModel;
  IncomesRepository incomesRepository;

  fetchIncomes() async {
    incomesModel = await incomesRepository.getAllIncomes() as List<IncomesModel>;
    notifyListeners();
  }
}