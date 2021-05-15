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
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 8,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                            child: Text('\$${_transactions[position].amount}')),
                      ),
                    ),
                    title: Text(
                      _transactions[position].title.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat('yyy/MM/dd')
                          .format(_transactions[position].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
