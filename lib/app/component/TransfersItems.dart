import 'package:app/app/data/transactions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget TransfersItems(Transactions transactions) {
  return InkWell(
    onTap: () {
      Get.bottomSheet(
        Container(
          height: Get.height / 2,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(16),
              right: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "TransactionID",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(transactions.transactionID),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Transaction Date",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(transactions.date),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "From",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(transactions.receiver),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "To",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(transactions.sender),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Amount",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(transactions.amount),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      );
    },
    child: Card(
      child: ListTile(
        leading: CircleAvatar(
          child: transactions.transactionStatus == "0"
              ? IconButton(onPressed: () {}, icon: Icon(Icons.arrow_downward))
              : IconButton(onPressed: () {}, icon: Icon(Icons.arrow_upward)),
        ),
        title: Text(" ${transactions.transactionID} "),
        subtitle: Text("${transactions.date} ${transactions.amount}"),
        trailing: Icon(Icons.more_vert),
      ),
    ),
  );
}
