// import 'package:expenseplanner/models/transaction.dart';
// import 'package:expenseplanner/widgets/new_transaction.dart';
// import 'package:expenseplanner/widgets/transaction_list.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';

// class UserTransactions extends StatefulWidget {
//   @override
//   State<UserTransactions> createState() => _UserTransactionsState();
// }

// class _UserTransactionsState extends State<UserTransactions> {
//   final List<Transaction> _userTransactions = [
//     Transaction(id: '1', title: 'Orange', amount: 12.63, date: DateTime.now()),
//     Transaction(id: '2', title: 'Apple', amount: 18.63, date: DateTime.now()),
//     Transaction(
//         id: '3', title: 'PineApple', amount: 20.69, date: DateTime.now()),
//     Transaction(id: '4', title: 'Mango', amount: 19.89, date: DateTime.now()),
//     Transaction(id: '5', title: 'Peanut', amount: 17.69, date: DateTime.now()),
//     Transaction(id: '6', title: 'Audi', amount: 96.25, date: DateTime.now()),
//   ];
//   void _addNewTransaction(String title, double amount) {
//     final newTx = Transaction(
//         id: DateTime.now().toString(),
//         title: title,
//         amount: amount,
//         date: DateTime.now());

//     setState(() {
//       _userTransactions.add(newTx);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       NewTransaction(_addNewTransaction),
//       TransactionList(_userTransactions),
//     ]);
//   }
// }
