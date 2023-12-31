import 'package:app/app/component/TransfersItems.dart';
import 'package:app/app/data/transactions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class transactionsPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfers"),
      ),
      body: ListView.builder(
        itemCount: KListOfTransactions.value.length,
        itemBuilder: (context, index) {
          return TransfersItems(
            KListOfTransactions.value.elementAt(index),
          );
        },
      ),
    );
  }
}
