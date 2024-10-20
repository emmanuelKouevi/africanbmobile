import 'package:africanbus_mobile/app/home/views/home_view.dart';
import 'package:africanbus_mobile/app/modules/auth/repository/auth_repository.dart';
import 'package:africanbus_mobile/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState(){
    super.initState();
    initializeData();
  }

  initializeData() async{
    final authProvider = Provider.of<AuthRepository>(context, listen: false);
    await authProvider.toLogin();
    Navigator.pushReplacementNamed(context, homeViewRoute);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitFadingCircle(
            color: Colors.teal,
            size: 40,
          )
      ),
    );
  }
}
