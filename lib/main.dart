import 'package:app/app/controllers/main_controller.dart';
import 'package:app/app/data/transactions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(() => MainController());

  runApp(
    GetMaterialApp(
      title: "Block Chain Wallet",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.cairoTextTheme(),
      ),
    ),
  );
}
