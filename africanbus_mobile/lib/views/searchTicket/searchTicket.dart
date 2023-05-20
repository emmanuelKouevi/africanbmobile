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
          backgroundColor: Colors.teal,
          title: Text("RECHERCHE DE BILLETS"),
          bottom: TabBar(
            isScrollable: true,
            tabs: dateList.map((date){
              return Tab(text: DateFormat('EEE').format(date).toUpperCase() + ' ' + date.day.toString() + ' ' + DateFormat('MMMM').format(date).toUpperCase() );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Icon(Icons.home),
            ),
            Center(
              child: Icon(Icons.account_circle),
            ),
            Center(
              child: Icon(Icons.alarm),
            ),
            Center(
              child: Icon(Icons.home),
            ),
            Center(
              child: Icon(Icons.account_circle),
            ),
            Center(
              child: Icon(Icons.alarm),
            )
          ],
        ),
      ),
    );
  }
}
