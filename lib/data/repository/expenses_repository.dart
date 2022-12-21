import '../api_service/api_service.dart';

class ExpensesRepository {
  ExpensesRepository({
    required this.apiService,
  });

  ApiService apiService;

  Future<MyResponse> getAllExpenses() => apiService.getAllExpenses();
}
