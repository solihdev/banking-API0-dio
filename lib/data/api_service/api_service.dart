import 'package:banking_api_dio/data/models/incomes_model.dart';
import 'package:dio/dio.dart';
import 'api_client.dart';

class MyResponse {
  MyResponse({
    this.data,
    required this.error,
  });

  dynamic data;
  String error = "";
}

class ApiService extends ApiClient {
  Future<MyResponse> getAllIncomes() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/income-types");
      if (response.statusCode == 200) {
        myResponse.data = (response.data as List)
            .map((e) => IncomesModel.fromJson(e))
            .toList();
      }
    } catch (error) {
      myResponse = MyResponse(
        error: error.toString(),
      );
      // print(error.toString());
    }
    return myResponse;
  }
}
