import 'package:africanbus_mobile/app/search_ticket/controllers/search_ticket_controller.dart';
import 'package:africanbus_mobile/app/search_ticket/views/ticket_selected_for_reservation.dart';
import 'package:africanbus_mobile/views/searchTicket/ticketDateReservation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SearchTicket extends StatefulWidget {
  const SearchTicket({Key? key}) : super(key: key);

  @override
  State<SearchTicket> createState() => _SearchTicketState();
}

class _SearchTicketState extends State<SearchTicket> with SingleTickerProviderStateMixin{

  final searchTicketController = Get.put(SearchTicketController());

  final dateList = List<DateTime>.generate(5, (i) =>
      DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ).add(Duration(days: i)));

  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final hr = SizedBox(height: 30);

    final title = Row(
      children: [
        Text("Billets de voyages" , style: GoogleFonts.ubuntu(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),),
      ],
    );


    final dates = TabBar(
      controller: tabController,
        unselectedLabelColor: Colors.grey,
        dividerColor: Colors.transparent,
        indicatorPadding: EdgeInsets.only(top: 50),
        labelColor: Colors.teal,
        indicatorColor: Colors.teal,
        tabs: dateList.map((date){
          return Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.teal.shade900,
                width: 1.5
              )
            ),
            child: Column(
              children: [
                Text(DateFormat('EEE', 'fr_FR').format(date).toUpperCase() , style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.normal
                ),),
                Text(date.day.toString() , style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),),
              ],
            )//Text(DateFormat('EEE').format(date).toUpperCase() + ' ' + date.day.toString()),
          );
        }).toList()
    );

    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50 , left: 10),
        child: Column(
          children: [
            title,
            hr,
            dates
          ],
        ),
      ),
    );

    /*return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          title: Text("RECHERCHE DE BILLETS" , style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),),
          actions: [
            Obx(() => Badge.count(
              count: searchTicketController.ticketsSelectedList.length,
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: (){
                  Get.to(TicketListSelected(searchTicketController.ticketsSelectedList));
                },
                icon: Icon(Icons.shopping_cart_rounded , size: 30, color: Colors.white70,),
              ),)
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: dateList.map((date){
              return Tab(
                  //text: DateFormat('EEE').format(date).toUpperCase() + ' ' + date.day.toString() + ' ' + DateFormat('MMMM').format(date).toUpperCase(),
                child: Text(
                  DateFormat('EEE').format(date).toUpperCase() + ' ' + date.day.toString() + ' ' + DateFormat('MMMM').format(date).toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontStyle: FontStyle.italic
                    ),
                ),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: TicketDateReservation()
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TicketDateReservation()
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TicketDateReservation()
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TicketDateReservation()
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TicketDateReservation()
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TicketDateReservation()
            ),
          ],
        ),
      ),
    );*/
  }
}
