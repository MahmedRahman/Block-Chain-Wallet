import 'package:app/app/data/transactions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  void addTransfar({
    required String receiver,
    required String sender,
    required String amount,
  }) {
    Transactions transactions = Transactions(
      date: DateTime.now().toString(),
      receiver: receiver.toString(),
      sender: sender.toString(),
      amount: amount.toString(),
      transactionID: "T ${KListOfTransactions.value.length + 1}",
      transactionStatus: "1",
    );

    KListOfTransactions.insert(0, transactions);

    Get.dialog(
      AlertDialog(
        title: Text('Success'),
        content: Text("Money sent successfully!'"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void updateData() {}

  void _submitForm() {}
}
