import 'package:africanbus_mobile/app/home/views/profil_view_tab.dart';
import 'package:africanbus_mobile/app/home/views/reservation_ticket_list_view.dart';
import 'package:africanbus_mobile/app/home/views/reservation_view.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _TabsPageState();
}

class _TabsPageState extends State<HomeView> {

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

    final bottomNavigation = Container(
      height: MediaQuery.of(context).size.height/6,
      child: DotNavigationBar(
        margin: EdgeInsets.only(left: 10, right: 10),
        currentIndex: _currentIndex,
        dotIndicatorColor: Colors.white,
        unselectedItemColor: Colors.grey[300],
        splashBorderRadius: 50,
        onTap: onTabTapped,
        items: [
          /// Home
          DotNavigationBarItem( icon: Icon(Icons.home , size: 40,),
            selectedColor: Colors.teal.shade900,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: Icon(Icons.airplane_ticket , size: 40,),
            selectedColor: Colors.teal.shade900,
          ),
          /// Profile
          DotNavigationBarItem(icon: Icon(Icons.person , size: 40,),
            selectedColor: Colors.teal.shade900,
          ),
        ],
      ),
    );

    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: bottomNavigation
    );
  }
}
