import 'package:app/app/component/TransfersItems.dart';
import 'package:app/app/data/transactions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class transactionsPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfers Old"),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: KListOfTransactions.length,
          itemBuilder: (context, index) {
            return TransfersItems(KListOfTransactions.elementAt(index));
          },
        ),
      ),
    );
  }
}
