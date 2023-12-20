import 'package:app/app/component/TransfersItems.dart';
import 'package:app/app/data/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Text(
              'Welcome, Valentino Morose 👋',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 16,
            ),
            WalletBox(),
            SizedBox(
              height: 16,
            ),
            Text(
              "Recent Transfers",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: KListOfTransactions.length,
                itemBuilder: (context, index) {
                  return TransfersItems(KListOfTransactions.elementAt(index));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Container WalletBox() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xff3B46F1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Your Wallet",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Balance",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "\$ ${Transactions.calculateTotalAmount(KListOfTransactions).toString()}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
