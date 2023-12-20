import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class sendingFundsPage extends GetView {
  final _formKey = GlobalKey<FormState>();
  String? _bitcoinAddress;

  bool _isValidBitcoinAddress(String? value) {
    if (value == null) {
      return false;
    }
    // Basic validation: check if the address starts with "1", "3", or "bc1"
    return value.startsWith(RegExp(r'1|3|bc1'));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Valid Bitcoin Address')),
      );
    }
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
              children: [
                TextFormField(
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
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: () {
                      _submitForm();
                    },
                    child: Text("Send Funds"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
