import 'package:banking_api_dio/data/models/transactions-expenses/data_model.dart';
import 'package:banking_api_dio/data/models/transactions-expenses/expenses_model.dart';
import 'package:banking_api_dio/view_model/expenses_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/incomes_view_model.dart';

class SampleUsageExpenses extends StatefulWidget {
  const SampleUsageExpenses({Key? key}) : super(key: key);

  @override
  State<SampleUsageExpenses> createState() => _SampleUsageExpensesState();
}

class _SampleUsageExpensesState extends State<SampleUsageExpenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Types"),
      ),
      body: Consumer<ExpensesViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorForUi.isNotEmpty) {
            return Center(
              child: Text(viewModel.errorForUi),
            );
          }
          return viewModel.expenses.isEmpty
              ? Center(child: Text(viewModel.expenses.length.toString()))
              : ListView(
                  shrinkWrap: true,
                  children: List.generate(viewModel.expenses.length, (index) {
                    ExpensesModel upperListItem = viewModel.expenses[index];
                    return ListView(
                      children: [
                        Text(
                          upperListItem.transferDate,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 40,
                          ),
                        ),
                        ...List.generate(upperListItem.dataModel.length,
                            (index) {
                          DataModel innerList = upperListItem.dataModel[index];
                          return Padding(
                            padding: const EdgeInsets.all(24),
                            child: Text(innerList.receiverModel.name),
                          );
                        })
                      ],
                    );
                  }));
        },
      ),
    );
  }
}
