
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_portfolio_web/folders/screens/about.dart';
// import 'package:my_portfolio_web/folders/screens/contact.dart';
import 'package:my_portfolio_web/folders/screens/home.dart';
// import 'package:my_portfolio_web/folders/screens/portfolio.dart';
// import 'package:my_portfolio_web/folders/screens/resume.dart';
// import 'package:my_portfolio_web/folders/screens/services.dart';

import 'folders/utils/routes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      // designSize: const Size(768, 1336),
      builder: (context, child) =>    MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        initialRoute: HomePage.routeName,
        // home: Resume(),
      ),
    );
  }
}





