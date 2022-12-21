import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/incomes_view_model.dart';

class SampleUsageIncomes extends StatefulWidget {
  const SampleUsageIncomes({Key? key}) : super(key: key);

  @override
  State<SampleUsageIncomes> createState() => _SampleUsageIncomesState();
}

class _SampleUsageIncomesState extends State<SampleUsageIncomes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Incomes Types"),
      ),
      body: Consumer<IncomesViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.incomesModel == null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text("No data Yet"),
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<IncomesViewModel>().fetchIncomes();
                    },
                    child: const Text("Get Data")),
              ],
            );
          }
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: viewModel.incomesModel!.length,
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
                                viewModel.incomesModel![index].icon,
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
                                    "Incomes type: ${viewModel.incomesModel![index].incomeType}",
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
              });
        },
      ),
    );
  }
}
