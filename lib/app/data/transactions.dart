// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

var KListOfTransactions = Transactions.generateFakeTransactions(10);

class Transactions {
  String transactionID;
  String date;
  String sender;
  String receiver;
  String amount;
  Transactions({
    required this.transactionID,
    required this.date,
    required this.sender,
    required this.receiver,
    required this.amount,
  });

  static List<Transactions> generateFakeTransactions(int count) {
    Random random = Random();
    List<Transactions> transactionsList = [];

    for (int i = 0; i < count; i++) {
      transactionsList.add(Transactions(
        transactionID: 'T-${random.nextInt(9999).toString().padLeft(4, '0')}',
        date: '2023-12-${random.nextInt(30) + 1}',
        sender: 'Sender ${random.nextInt(100)}',
        receiver: 'Receiver ${random.nextInt(100)}',
        amount: '\$${random.nextInt(1000) + 1}.00',
      ));
    }

    return transactionsList;
  }

  static double calculateTotalAmount(List<Transactions> transactions) {
    double total = 0.0;
    for (var transaction in transactions) {
      String amountString = transaction.amount.replaceAll('\$', '').replaceAll(',', '');
      double amount = double.tryParse(amountString) ?? 0.0;
      total += amount;
    }
    return total;
  }
}
