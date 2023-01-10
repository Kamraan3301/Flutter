import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:expenseplanner/main.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction added!',
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.cyan,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount} ')),
                      ),
                    ),
                    title: (Text(
                      (transactions[index].title as String),
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
                    subtitle: (Text(DateFormat.yMMMMEEEEd()
                        .format(transactions[index].date))),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Color.fromARGB(255, 162, 57, 57),
                      onPressed: () {
                        deleteTx(transactions[index].id);
                      },
                    ),
                  ),
                );

                // return Card(
                //   child: Row(children: <Widget>[
                //     Container(
                //       margin: EdgeInsets.symmetric(
                //         vertical: 10,
                //         horizontal: 15,
                //       ),
                //       decoration: BoxDecoration(
                //           border: Border.all(
                //         color: Colors.red,
                //       )),
                //       padding: EdgeInsets.all(10),
                //       child: Text(
                //           style: TextStyle(
                //               fontSize: 20,
                //               fontWeight: FontWeight.bold,
                //               color: Theme.of(context).primaryColorDark),
                //           '\$${transactions[index].amount.toStringAsFixed(2)}' //+ tx.amount.toString(), // dollar means u want to interpolate thus use backslash to escape it
                //           ),
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: <Widget>[
                //         Text(
                //             style: TextStyle(
                //                 fontSize: 20,
                //                 fontWeight: FontWeight.bold,
                //                 color: Color.fromRGBO(156, 231, 176, 1)),
                //             transactions[index].title),
                //         Text(
                //           style: TextStyle(fontSize: 10, color: Colors.grey),
                //           DateFormat('MMM 26,yyyy')
                //               .format(transactions[index].date),
                //         ),
                //       ],
                //     )
                //   ]),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}





























































// import 'package:flutter/material.dart';
// import '../models/transaction.dart';
// import 'package:intl/intl.dart';

// class TransactionList extends StatelessWidget {
//   final List<Transaction> transactions;
//   TransactionList(this.transactions);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 500,
//       child: ListView(
//         children: (transactions.map((tx) {
//           return Card(
//             child: Row(children: <Widget>[
//               Container(
//                 margin: EdgeInsets.symmetric(
//                   vertical: 10,
//                   horizontal: 15,
//                 ),
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                   color: Colors.black,
//                   width: 2,
//                 )),
//                 padding: EdgeInsets.all(10),
//                 child: Text(
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.purple),
//                     '\$${tx.amount}' //+ tx.amount.toString(), // dollar means u want to interpolate thus use backslash to escape it
//                     ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromRGBO(156, 231, 176, 1)),
//                       tx.title),
//                   Text(
//                     style: TextStyle(fontSize: 10, color: Colors.grey),
//                     DateFormat('MMM 26,yyyy').format(tx.date),
//                   ),
//                 ],
//               )
//             ]),
//           );
//         }).toList()),
//       ),
//     );
//   }
// }
