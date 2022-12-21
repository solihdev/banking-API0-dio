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
          return viewModel.expensesModel!=null?ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: viewModel.expensesModel!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 150,
                              height: 180,
                              child: Image.network(
                                viewModel.expensesModel![index].dataModel[index].receiverModel.brandImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    "DATA: ${viewModel.expensesModel![index].transferDate}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }):   Center(
            child: ElevatedButton(
                onPressed: () {
                  context.read<IncomesViewModel>().fetchIncomes();
                },
                child: const Text("Get Data")),
          );
        },
      ),
    );
  }
}
