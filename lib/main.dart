import 'package:crypto_dashboard/pages/login/loginpage.dart';
import 'package:crypto_dashboard/pages/home/homepage.dart';
import 'package:crypto_dashboard/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const OPERATING_CHAIN = 97;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, _) {
        return Container(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "GBR Tokens dApp",
            themeMode: ThemeMode.dark,
            darkTheme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: GoogleFonts.poppinsTextTheme().copyWith(
                bodySmall: TextStyle(
                  color: kCaptionColor,
                  fontSize: 16.0,
                ),
              ),
              scaffoldBackgroundColor: kPrimaryColor,
              appBarTheme: AppBarTheme(
                elevation: 0.0,
                color: kPrimaryColor,
              ),
            ),
            routes: {
              HomePage.routeName: (context) => HomePage(),
              LoginPage.routeName: (context) => LoginPage(),
            },
            initialRoute: '/wallet-connect',
          ),
        );
      },
    );
  }
}
