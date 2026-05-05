import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Statistics Summary')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Total Income: \$${provider.totalIncome.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Text('Total Expense: \$${provider.totalExpense.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Text('Current Balance: \$${provider.balance.toStringAsFixed(2)}', style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }
}
