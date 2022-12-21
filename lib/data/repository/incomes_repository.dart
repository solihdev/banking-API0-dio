import '../api_service/api_service.dart';

class IncomesRepository {
  IncomesRepository({
    required this.apiService,
  });

  ApiService apiService;

  Future<MyResponse> getAllIncomes() => apiService.getAllIncomes();
}
