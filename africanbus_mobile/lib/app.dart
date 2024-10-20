import 'package:africanbus_mobile/global_config/globalConst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:africanbus_mobile/router/router.dart' as router;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: GlobalConst.providers,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('fr', 'FR'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(useMaterial3: true,),
        darkTheme: ThemeData.light(useMaterial3: true),
        onGenerateRoute: router.generateRoute,
        initialRoute: router.splashViewRoute,
      )
    );
  }
}
