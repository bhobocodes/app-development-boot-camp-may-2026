import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/expense_provider.dart';
import 'screens/splash_screen.dart';
import 'utils/app_theme.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MExpenseApp());
}

class MExpenseApp extends StatelessWidget {
  const MExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExpenseProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MExpense',
        theme: AppTheme.lightTheme,
        home: const LoginScreen(),
      ),
    );
  }
}
