import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';
import '../widgets/summary_card.dart';
import '../widgets/action_button.dart';
import 'add_expense_screen.dart';
import 'add_income_screen.dart';
import 'transaction_history_screen.dart';
import 'statistics_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('MExpense Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: const Color(0xFF16A34A), borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                const Text('Current Balance', style: TextStyle(color: Colors.white)),
                const SizedBox(height: 10),
                Text('\$${provider.balance.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold))
              ]),
            ),
            const SizedBox(height: 20),
            Row(children: [
              SummaryCard(title: 'Income', amount: '\$${provider.totalIncome.toStringAsFixed(2)}', icon: Icons.arrow_downward),
              SummaryCard(title: 'Expense', amount: '\$${provider.totalExpense.toStringAsFixed(2)}', icon: Icons.arrow_upward),
            ]),
            const SizedBox(height: 20),
            ActionButton(text: 'Add Expense', onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddExpenseScreen()))),
            ActionButton(text: 'Add Income', onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddIncomeScreen()))),
            ActionButton(text: 'Transaction History', onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const TransactionHistoryScreen()))),
            ActionButton(text: 'Statistics', onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const StatisticsScreen()))),
          ],
        ),
      ),
    );
  }
}
