import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentOfTotal;
  const ChartBar(this.label, this.spendingAmount, this.spendingPercentOfTotal,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((ctext, constraint) {
      return Column(children: [
        SizedBox(
          height: constraint.maxHeight * 0.15,
          child: FittedBox(
            child: Text("\$${spendingAmount.toStringAsFixed(0)}"),
          ),
        ),
        SizedBox(height: constraint.maxHeight * 0.05),
        SizedBox(
          height: constraint.maxHeight * 0.6,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: const Color.fromRGBO(220, 220, 220, 12),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              heightFactor: spendingPercentOfTotal,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ]),
        ),
        SizedBox(height: constraint.maxHeight * 0.05),
        SizedBox(
          height: constraint.maxHeight * 0.15,
          child: FittedBox(
            child: Text(label),
          ),
        )
      ]);
    }));
  }
}
