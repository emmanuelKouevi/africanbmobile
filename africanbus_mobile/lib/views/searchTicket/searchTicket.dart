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

  final dateList = List<DateTime>.generate(6, (i) =>
      DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ).add(Duration(days: i)));

  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 6, vsync: this);
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
          );}
        ).toList()
    );

    final bodyListTicket = Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.teal.shade900,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(35),
          topLeft: Radius.circular(35)
        )
      ),
      child: TicketDateReservation()
    );

    /*return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            title,
            hr,
            dates,
            hr,
            bodyListTicket
          ],
        ),
      ),
    );*/

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: title,
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.grey,
            dividerColor: Colors.transparent,
            indicatorPadding: EdgeInsets.only(top: 50),
            labelColor: Colors.teal,
            indicatorColor: Colors.teal,
            tabs: dateList.map((date){
              return Tab(
                child: Text(
                  DateFormat('EEE' , 'fr_FR').format(date).toUpperCase() + ' ' + date.day.toString(),
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
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal.shade900
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TicketDateReservation()
              ),
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
    );
  }
}
