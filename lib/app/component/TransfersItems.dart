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
                Text(transactions.transactionID),
                SizedBox(
                  height: 10,
                ),
                Text(transactions.date),
                SizedBox(
                  height: 10,
                ),
                Text(transactions.receiver),
                SizedBox(
                  height: 10,
                ),
                Text(transactions.sender),
                SizedBox(
                  height: 10,
                ),
                Text(transactions.amount),
              ],
            ),
          ),
        ),
      );
    },
    child: Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.money),
        ),
        title: Text(" ${transactions.sender} "),
        subtitle: Text("${transactions.date} ${transactions.amount}"),
        trailing: Text(transactions.transactionID),
      ),
    ),
  );
}
