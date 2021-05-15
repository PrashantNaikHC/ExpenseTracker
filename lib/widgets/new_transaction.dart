import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addTransaction;

  NewTransaction(this._addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountController = TextEditingController();
  DateTime _selectedDate;
  final titleController = TextEditingController();

  void _addInputData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget._addTransaction(enteredTitle, enteredAmount, _selectedDate);

    // close the topmost sheet that is open
    Navigator.of(context).pop();
  }

  void _showDateTimePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? "No date chosen."
                          : DateFormat().add_yMd().format(_selectedDate),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _showDateTimePicker,
                    child: Text("Choose date"),
                  )
                ],
              ),
            ),
            RaisedButton(
              onPressed: _addInputData,
              child: Text('Add transaction'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
