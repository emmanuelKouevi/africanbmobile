import 'package:africanbus_mobile/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: Routes.splash,
      getPages: AppPages.routes,
    );
    /*return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryPassagerViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => GareDepartViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => GareDestinationViewModel(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generateRoute,
        initialRoute: router.homeViewRoute,
      ),
    );*/
  }
}
