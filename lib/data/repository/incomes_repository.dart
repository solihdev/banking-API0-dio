import '../api_service/api_service.dart';
import '../models/incomes_model.dart';

class IncomesRepository {
  IncomesRepository({
    required this.apiService,
  });

  ApiService apiService;

  Future<List<IncomesModel?>?> getAllIncomes() => apiService.getAllIncomes();
}