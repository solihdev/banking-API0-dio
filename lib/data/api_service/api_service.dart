import 'package:banking_api_dio/data/models/incomes_model.dart';
import 'package:dio/dio.dart';

import 'api_client.dart';

class ApiService extends ApiClient {
  Future<List<IncomesModel>> getAllIncomes() async {
    try {
      Response response = await dio.get("${dio.options.baseUrl}/income-types");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => IncomesModel.fromJson(e))
            .toList();
      }
    } catch (error) {
      print(error.toString());
    }
    return [];
  }
}
