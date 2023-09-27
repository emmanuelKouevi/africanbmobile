import 'package:africanbus_mobile/views/searchTicket/ticketDateReservation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchTicket extends StatefulWidget {
  const SearchTicket({Key? key}) : super(key: key);

  @override
  State<SearchTicket> createState() => _SearchTicketState();
}

class _SearchTicketState extends State<SearchTicket> {

  final dateList = List<DateTime>.generate(6, (i) =>
      DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ).add(Duration(days: i)));
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
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
    );
  }
}
