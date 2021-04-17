import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// this uses the Listview.Builder which is equivalent of the Recyclerview in Android
// this lazily initializes each items

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No transactions are added yet",
                  style: Theme.of(context).textTheme.headline6,
                ),
                // sixedbox can be used for padding/margin
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (context, position) {
                return Card(
                  child: Row(children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      )),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      padding: EdgeInsets.all(10),
                      child: Text(
                          "\$ ${_transactions[position].amount.toStringAsFixed(2)}",
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _transactions[position].title.toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          DateFormat('yyy/MM/dd')
                              .format(_transactions[position].date),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ]),
                );
              },
            ),
    );
  }
}
