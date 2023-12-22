// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';
import 'dart:math';

import 'package:get/get.dart';

RxList KListOfTransactions = Transactions.generateFakeTransactions(10).obs;
RxDouble KTransactionsBlanse = 0.0.obs;

class Transactions {
  String transactionID;
  String date;
  String sender;
  String receiver;
  String amount;
  String transactionStatus;
  Transactions({
    required this.transactionID,
    required this.date,
    required this.sender,
    required this.receiver,
    required this.amount,
    required this.transactionStatus,
  });

  static List<Transactions> generateFakeTransactions(int count) {
    Random random = Random();
    List<Transactions> transactionsList = [];
    double total = 0.0;
    for (int i = 0; i < count; i++) {
      int amount = random.nextInt(1000) + 1 ?? 0;
      transactionsList.add(Transactions(
        transactionID: 'T-${random.nextInt(9999).toString().padLeft(4, '0')}',
        date: '2023-12-${random.nextInt(30) + 1}',
        sender: 'bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh',
        receiver: 'bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh',
        amount: '\$${amount}.00',
        transactionStatus: "0",
      ));
      total += amount.toDouble();
    }

    KTransactionsBlanse.value = total;
    return transactionsList;
  }
}
