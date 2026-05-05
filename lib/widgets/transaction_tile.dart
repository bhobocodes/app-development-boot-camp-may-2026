import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionTile({super.key, required this.transaction});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: transaction.isIncome ? Colors.green : Colors.red,
          child: Icon(transaction.isIncome ? Icons.arrow_downward : Icons.arrow_upward, color: Colors.white),
        ),
        title: Text(transaction.title),
        subtitle: Text(transaction.category),
        trailing: Text('\$${transaction.amount.toStringAsFixed(2)}'),
      ),
    );
  }
}
