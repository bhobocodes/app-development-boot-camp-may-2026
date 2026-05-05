import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class ExpenseProvider extends ChangeNotifier {
  final List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions;

  void addTransaction(TransactionModel transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  double get totalIncome => _transactions.where((t) => t.isIncome).fold(0.0, (s, i) => s + i.amount);
  double get totalExpense => _transactions.where((t) => !t.isIncome).fold(0.0, (s, i) => s + i.amount);
  double get balance => totalIncome - totalExpense;
}
