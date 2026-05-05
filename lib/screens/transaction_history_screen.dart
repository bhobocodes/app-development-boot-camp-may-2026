import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';
import '../widgets/transaction_tile.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction History')),
      body: provider.transactions.isEmpty ? const Center(child: Text('No Transactions Yet'))
      : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: provider.transactions.length,
        itemBuilder: (c,i)=>TransactionTile(transaction: provider.transactions[i]),
      ),
    );
  }
}
