import 'package:africanbus_mobile/app/home/views/profil_view_tab.dart';
import 'package:africanbus_mobile/app/home/views/reservation_ticket_list_view.dart';
import 'package:africanbus_mobile/app/home/views/reservation_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _TabsPageState();
}

class _TabsPageState extends State<HomeView> {

  int _index = 0 ;

  int _currentIndex = 0;
  final List<Widget> _pages = [
    ReservationTab(),
    ReservationListTab(),
    ProfilView()
    //AuthentificationTab(),
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
          icon: Icon(Icons.home , size: 40,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.airplane_ticket , size: 40),
          label: 'Mes billets',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person , size: 40),
          label: 'Mon profil',
        ),
      ],
      currentIndex: _currentIndex,
      selectedItemColor: Colors.teal.shade900,
      onTap: onTabTapped,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        elevation: 5,
        title: Text("AFRICAN BUS" , style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize : 20
        ),),
      ),
      body: SafeArea(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: bottomNavigation
    );
  }
}
