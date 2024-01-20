import 'package:africanbus_mobile/app/search_ticket/controllers/search_ticket_controller.dart';
import 'package:africanbus_mobile/app/search_ticket/views/ticketDateReservation.dart';
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

    //final hr = SizedBox(height: 30);

    final title = Row(
      children: [
        Text("Offres de voyages" , style: GoogleFonts.ubuntu(
            fontSize: 25,
            fontWeight: FontWeight.bold
        ),),
      ],
    );

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: title,
          bottom: TabBar(
            isScrollable: true,
            tabs: dateList.map((date){
              return Tab(
                child: Text(
                  DateFormat('EEE' , 'fr_FR').format(date).toUpperCase() + ' ' + date.day.toString(),
                  style: TextStyle(
                      color: Colors.teal.shade900,
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
    );
  }
}