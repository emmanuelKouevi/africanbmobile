import 'package:africanbus_mobile/views/tabs/login/authentification.dart';
import 'package:africanbus_mobile/views/tabs/reservation/reservation.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {

  int _currentIndex = 0;
  final List<Widget> _pages = [
    ReservationTab(),
    AuthentificationTab(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    final bottomNavigation = BottomNavigationBar(
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Recherche',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.login),
          label: 'Connexion',
        ),
      ],
      currentIndex: _currentIndex,
      selectedItemColor: Colors.teal,
      onTap: onTabTapped,
    );

    return Scaffold(
      body: SafeArea(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: bottomNavigation,
    );
  }
}
