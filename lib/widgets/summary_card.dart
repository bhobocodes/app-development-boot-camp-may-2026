import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String title; final String amount; final IconData icon;
  const SummaryCard({super.key, required this.title, required this.amount, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 8, spreadRadius: 2, offset: const Offset(0,4))]),
      child: Column(children: [Icon(icon, color: const Color(0xFF16A34A)), const SizedBox(height: 8), Text(title), const SizedBox(height: 6), Text(amount)]),
    ));
  }
}
