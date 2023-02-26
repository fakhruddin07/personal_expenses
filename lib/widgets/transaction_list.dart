import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTranction;
  const TransactionList(this.transactions, this.deleteTranction, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(children: [
                Text(
                  "No transactin added here!",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset("assets/images/waiting.png"),
                )
              ]);
            })
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 35,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text(
                              "\$${transactions[index].amount.toStringAsFixed(2)}"),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(transactions[index].date),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: MediaQuery.of(context).size.width > 600
                        ? TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                            label: const Text("Delete"),
                          )
                        : IconButton(
                            onPressed: () =>
                                deleteTranction(transactions[index].id),
                            icon: const Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                          ),
                  ),
                );
              },
            ),
    );
  }
}
