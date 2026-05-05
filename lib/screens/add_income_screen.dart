import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/transaction_model.dart';
import '../providers/expense_provider.dart';

class AddIncomeScreen extends StatefulWidget {
  const AddIncomeScreen({super.key});
  @override
  State<AddIncomeScreen> createState() => _AddIncomeScreenState();
}
class _AddIncomeScreenState extends State<AddIncomeScreen> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  String source = 'Salary';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Income')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: titleController, decoration: InputDecoration(labelText: 'Income Title', border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)))),
          const SizedBox(height: 12),
          TextField(controller: amountController, decoration: InputDecoration(labelText: 'Amount', border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)))),
          DropdownButton<String>(value: source, items: ['Salary','Bonus','Gift','Freelance','Others'].map((e)=>DropdownMenuItem(value:e, child: Text(e))).toList(), onChanged:(v)=>setState(()=>source=v!)),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: (){
            Provider.of<ExpenseProvider>(context, listen:false).addTransaction(TransactionModel(title:titleController.text, amount:double.parse(amountController.text), category:source, isIncome:true, date:DateTime.now()));
            Navigator.pop(context);
          }, child: const Text('Save Income'))
        ]),
      ),
    );
  }
}
