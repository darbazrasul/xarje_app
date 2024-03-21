import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/transaction.dart';

import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;

  TransactionList(this.userTransactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460,
      child: userTransactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: [
                    Text('No transactions added yet!',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.8,
                        child: LottieBuilder.asset(
                          'assets/animations/Animation.json',
                          fit: BoxFit.cover,
                          animate: true,
                        )),
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: userTransactions.length,
              itemBuilder: (ctx, index) {
                return TransactionItem(
                    userTransaction: userTransactions[index],
                    deleteTx: deleteTx);
              },
            ),
    );
  }
}
