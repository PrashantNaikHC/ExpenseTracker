import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(id: "111", amount: 20, title: "Noodles", date: DateTime.now()),
    Transaction(id: "222", amount: 100, title: "Noodles", date: DateTime.now())
  ];

  void _addNewTransaction(String txnTitle, double txnAmount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: txnTitle,
        amount: txnAmount,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          // wrapped in the gesture detector to avoid the sheet closure when
          // clicked inside the sheet
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter app'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _startNewTransaction(context);
              })
        ],
      ),
      body: Center(
        child: TransactionList(_transactions),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startNewTransaction(context),
      ),
    );
  }
}
