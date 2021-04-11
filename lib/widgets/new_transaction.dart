import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _addTransaction;

  NewTransaction(this._addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountController = TextEditingController();

  final titleController = TextEditingController();

  void _addInputData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget._addTransaction(enteredTitle, enteredAmount);

    // close the topmost sheet that is open
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter the amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _addInputData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter the title'),
              controller: titleController,
              onSubmitted: (_) => _addInputData(),
            ),
            FlatButton(
              onPressed: _addInputData,
              child: Text('Add transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
