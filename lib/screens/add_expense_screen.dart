import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/transaction_model.dart';
import '../providers/expense_provider.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});
  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}
class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  String category = 'Food';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: titleController, decoration: InputDecoration(labelText: 'Expense Title', border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)))),
          const SizedBox(height: 12),
          TextField(controller: amountController, decoration: InputDecoration(labelText: 'Amount', border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)))),
          DropdownButton<String>(value: category, items: ['Food','Transport','Shopping','Bills','Others'].map((e)=>DropdownMenuItem(value:e, child: Text(e))).toList(), onChanged:(v)=>setState(()=>category=v!)),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: (){
            Provider.of<ExpenseProvider>(context, listen:false).addTransaction(TransactionModel(title:titleController.text, amount:double.parse(amountController.text), category:category, isIncome:false, date:DateTime.now()));
            Navigator.pop(context);
          }, child: const Text('Save Expense'))
        ]),
      ),
    );
  }
}
