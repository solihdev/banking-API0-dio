import 'package:banking_api_dio/data/api_service/api_service.dart';
import 'package:banking_api_dio/data/repository/incomes_repository.dart';
import 'package:banking_api_dio/ui/sample_usage.dart';
import 'package:banking_api_dio/view_model/incomes_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (context) => IncomesViewModel(
                  incomesRepository: IncomesRepository(
                apiService: ApiService(),
              ))),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API-DIO',
      home: SampleUsageIncomes(),
    );
  }
}
