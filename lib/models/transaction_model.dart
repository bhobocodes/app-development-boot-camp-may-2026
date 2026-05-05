class TransactionModel {
  String title;
  double amount;
  String category;
  bool isIncome;
  DateTime date;

  TransactionModel({
    required this.title,
    required this.amount,
    required this.category,
    required this.isIncome,
    required this.date,
  });
}
