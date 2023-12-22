import 'package:app/app/const/app_color.dart';
import 'package:app/app/controllers/main_controller.dart';
import 'package:app/app/data/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class sendingFundsPage extends GetView {
  final _formKey = GlobalKey<FormState>();
  String? _bitcoinAddress;
  String? _Amount;
  bool _isValidBitcoinAddress(String? value) {
    if (value == null) {
      return false;
    }
    // Basic validation: check if the address starts with "1", "3", or "bc1"
    return value.startsWith(RegExp(r'1|3|bc1'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Funds"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "To",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: "bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh",
                  decoration: InputDecoration(
                    labelText: 'Bitcoin Address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (!_isValidBitcoinAddress(value)) {
                      return 'Please enter a valid Bitcoin address';
                    }
                    return null;
                  },
                  onSaved: (value) => _bitcoinAddress = value,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Amount",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (GetUtils.isNullOrBlank(value.toString()) == true) {
                      return 'Please enter a Amount';
                    }

                    final double? parsedValue = double.tryParse(value.toString());
                    if (parsedValue == null || parsedValue <= 0) {
                      return 'Please enter a number greater than 0';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _Amount = newValue,
                ),
                Spacer(),
                Container(
                  width: Get.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => AppColors.KBlueColor,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate() == false) {
                        return;
                      }
                      _formKey.currentState!.save();
                      print(KTransactionsBlanse.value.toString());
                      print(_Amount);
                      if (num.parse(_Amount.toString()) > KTransactionsBlanse.value) {
                        // Handle insufficient balance

                        Get.dialog(
                          AlertDialog(
                            title: Text("Error"),
                            content: Text(
                              'Insufficient balance. Available balance: ${KTransactionsBlanse.value}',
                            ),
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

                        return;
                      }
                      KTransactionsBlanse.value = KTransactionsBlanse.value - num.parse(_Amount.toString());

                      Get.find<MainController>().addTransfar(
                        amount: _Amount.toString(),
                        receiver: "bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh",
                        sender: _bitcoinAddress.toString(),
                      );
                    },
                    child: Text(
                      "Send",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
