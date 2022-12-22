import '../api_service/api_service.dart';
import '../models/my_response/my_response.dart';

class ExpensesRepository {
  ExpensesRepository({
    required this.apiService,
  });

  ApiService apiService;

  Future<MyResponse> getAllExpenses() => apiService.getAllExpenses();
}
