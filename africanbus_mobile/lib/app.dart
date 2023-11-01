import 'package:africanbus_mobile/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_custom.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override

  @override
  void initState(){

  }
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [ const Locale('en') , const Locale('fr')],
      initialRoute: Routes.splash,
      getPages: AppPages.routes,
    );
  }
}
