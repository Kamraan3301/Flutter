import 'package:expenseplanner/models/transaction.dart';
import 'package:expenseplanner/widgets/new_transaction.dart';
import 'package:expenseplanner/widgets/transaction_list.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:expenseplanner/widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime ChosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: ChosenDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        //bujhi nai
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final _isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appbars = AppBar(
      title: Text(
        'Expense Planner',
        style: TextStyle(fontFamily: 'OpenSans'),
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {
              _startAddNewTransaction(context);
            },
            icon: Icon(Icons.add))
      ],
    );
    final txwidgetList = Container(
        height: (media.size.height -
                appbars.preferredSize.height -
                media.padding.top) *
            .70,
        child: TransactionList(_userTransactions, _deleteTransaction));
    return Scaffold(
      appBar: appbars,
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Card(
              //   child: Container(
              //     width: double.infinity,
              //     child: Text(
              //       style: TextStyle(
              //           fontSize: 20, color: Color.fromARGB(255, 73, 21, 135)),
              //       'Chart',
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              //   // elevation: 60,
              // ),
              if (_isLandscape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Show Chart"),
                    Switch(
                      value: _showChart,
                      onChanged: (val) {
                        setState(() {
                          _showChart = val;
                        });
                      },
                    ),
                  ],
                ),
              if (!_isLandscape)
                Container(
                    height: (media.size.height -
                            appbars.preferredSize.height -
                            media.padding.top) *
                        0.3,
                    child: Chart(_recentTransactions)),
              if (!_isLandscape) txwidgetList,
              if (_isLandscape)
                _showChart // aida bool value false default deya ase, jodiclick kori then true hobe taile chart ta show korbe otherwie list show korbe tai toh!
                    ? Container(
                        height: (media.size.height -
                                appbars.preferredSize.height -
                                media.padding.top) *
                            0.7,
                        child: Chart(_recentTransactions))
                    : txwidgetList,
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (() => _startAddNewTransaction(context)),
      ),
    );
  }
}
