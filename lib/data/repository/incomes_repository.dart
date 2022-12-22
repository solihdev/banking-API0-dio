import '../api_service/api_service.dart';
import '../models/my_response/my_response.dart';

class IncomesRepository {
  IncomesRepository({
    required this.apiService,
  });

  ApiService apiService;

  Future<MyResponse> getAllIncomes() => apiService.getAllIncomes();
}
