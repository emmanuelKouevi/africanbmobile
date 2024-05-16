import 'package:africanbus_mobile/app/home/controllers/home_controller.dart';
import 'package:africanbus_mobile/app/profil/views/profil_view_tab.dart';
import 'package:africanbus_mobile/app/reservations/views/reservation_ticket_list_view.dart';
import 'package:africanbus_mobile/app/home/views/reservation_view.dart';
import 'package:africanbus_mobile/app/search_ticket/controllers/search_ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../notification/views/notification_view.dart';

/// Date : 18-01-2024
/// Author : Kouevi Ayite Emmanuel Herve
/// Description : Ce widget répresente la page d'accueil de l'application African Bus

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _TabsPageState();
}

class _TabsPageState extends State<HomeView> with TickerProviderStateMixin {

  final homeController = Get.put(HomeController() , permanent: true);
  final searchTicketController = Get.put(SearchTicketController() , permanent: true);

  int _currentIndex = 0;
  final List<Widget> _pages = [
    ReservationTab(),
    ReservationListTab(index: 0,),
    NotificationView(),
    ProfilView()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final bottomNavigation = BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      showUnselectedLabels: false,
      selectedFontSize: 20,
      selectedIconTheme: IconThemeData(color: Colors.teal.shade800, size: 30),
      selectedItemColor: Colors.teal.shade800,
      selectedLabelStyle: GoogleFonts.ubuntu(fontWeight: FontWeight.bold , fontSize:11 ),
      unselectedIconTheme: IconThemeData(
        color: Colors.black.withOpacity(0.8),
      ),
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.magnifyingGlass),  label: 'Rechercher',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.ticket), label: 'Vos billets',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bell), label: 'Notification',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.user), label: 'Mon compte',
        ),
      ],
      onTap: onTabTapped,
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
