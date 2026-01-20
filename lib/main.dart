import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_ecommerce/routes/app_route.dart';
import 'package:project_ecommerce/screen/detail_screen/check_out_ex.dart';
import 'package:project_ecommerce/screen/detail_screen/detail_shirt.dart';
import 'package:project_ecommerce/screen/homescreen/home_screen_ex.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.spaceGroteskTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      // home: OffersEx(),
      initialRoute: AppRoute.HomeScreen,
      routes: {
        AppRoute.HomeScreen: (context) => HomeScreenEx(),
        AppRoute.DetailPage: (context) => DetailShirt(),
        AppRoute.CheckoutPage: (context) => CheckOutEx(),
      },
    );
  }
}
