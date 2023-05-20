import 'package:africanbus_mobile/views/dialog/viewModel/station/gareDepartViewModel.dart';
import 'package:africanbus_mobile/views/dialog/viewModel/station/gareDestinationViewModel.dart';
import 'package:africanbus_mobile/views/dialog/viewModel/traveller/categoryPassagerViewModel.dart';
import 'package:flutter/material.dart';
import 'package:africanbus_mobile/router/router.dart' as router;
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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

          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generateRoute,
        initialRoute: router.splashViewRoute,
      ),
    );
  }
}
