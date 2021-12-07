// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final Function deleteTx;
  final List<Transaction> transactions;

  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView(
            children: transactions
            .map((tx) => TransactionItem(
              key: ValueKey(tx.id),
              transaction: tx,
              deleteTx: deleteTx,
              )).toList(),
              // return Card(
              //     child: Row(children: <Widget>[
              //   Container(
              //     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              //     decoration: BoxDecoration(
              //       border: Border.all(
              //         color: Theme.of(context).primaryColor,
              //         width: 2,
              //       ),
              //     ),
              //     padding: EdgeInsets.all(10),
              //     child: Text(
              //       '\$${transactions[index].amount.toStringAsFixed(2)}',
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 20,
              //         color: Theme.of(context).primaryColor,
              //       ),
              //     ),
              //   ),
              //   Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Text(
              //         transactions[index].title,
              //         style: Theme.of(context).textTheme.subtitle1,
              //       ),
              //       Text(
              //         DateFormat.yMMMd().format(transactions[index].date),
              //         style: TextStyle(
              //           color: Colors.grey,
              //         ),
              //       ),
              //     ],
              //   )
              // ]));
          );
  }
}
