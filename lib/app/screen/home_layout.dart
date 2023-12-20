import 'package:app/app/screen/home_page.dart';
import 'package:app/app/screen/sending_funds_page.dart';
import 'package:app/app/screen/transactions_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';



RxInt SelectPage = 0.obs;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      appBar: AppBar(
        backgroundColor: Color(0xffEEEEEE),
        title: const Text('Block Chain Wallet'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
            ),
          )
        ],
      ),
      drawer: Drawer(),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            SelectPage.value = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "images/menu.png",
                color: SelectPage.value == 0 ? Color(0xff3B46F1) : Colors.grey,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "images/menu_1.png",
                color: SelectPage.value == 1 ? Color(0xff3B46F1) : Colors.grey,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "images/menu_2.png",
                color: SelectPage.value == 2 ? Color(0xff3B46F1) : Colors.grey,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "images/menu_3.png",
                color: SelectPage.value == 3 ? Color(0xff3B46F1) : Colors.grey,
              ),
              label: "",
            ),
          ],
        );
      }),
      body: Obx(() {
        return IndexedStack(
          index: SelectPage.value,
          children: [
            HomePage(),
            transactionsPage(),
            sendingFundsPage(),
          ],
        );
      }),
    );
  }
}




