import 'package:africanbus_mobile/models/city.dart';
import 'package:africanbus_mobile/service_web/service_web.dart';
import 'package:africanbus_mobile/views/dialog/widgets/cities/cityItem.dart';
import 'package:flutter/material.dart';

class GareDestinationDialog extends StatefulWidget {
  final TextEditingController villeGareDestination ;
  const GareDestinationDialog({Key? key , required this.villeGareDestination}) : super(key: key);

  @override
  State<GareDestinationDialog> createState() => _GareDestinationDialogState();
}

class _GareDestinationDialogState extends State<GareDestinationDialog> {

  List<City>cities = [];
  List<City>foundCities = [];

  TextEditingController villeDestination = TextEditingController();

  void initializeCities() async{
    cities = await ServiceWebApi().getTravelCities();
  }

  @override
  void initState(){
    initializeCities();
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<City> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = cities;
    } else {
      results = cities
          .where((city) =>
          city.designation.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    // Refresh the UI
    setState(() {
      foundCities = results;
    });
  }
  @override
  Widget build(BuildContext context) {

    final hr = SizedBox(height: 5);

    final destinationCity = Container(
      child: TextField(
        onChanged: (value) => _runFilter(value),
        controller: villeDestination,
        showCursor: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.teal,
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.teal,
                    width: 3
                )
            ),
            labelText: 'À',
            labelStyle: TextStyle(
                color: Colors.teal
            )
        ),
      ),
    );

    final section = Container(
      child: Column(
        children: [
          destinationCity,
          hr,
          hr,
        ],
      ),
    );

    final cityList = foundCities.isNotEmpty ? Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          child: ListView.builder(
            itemCount: foundCities.length,
            itemBuilder: (context, index) => CityItem(city: foundCities[index] , textEditingController: widget.villeGareDestination),
          ),
        )
    ) : Container(
        margin: EdgeInsets.only(top: 60),
        child: Center(
          child: Text('Nous n\'avons pas trouvé de gars correspondant à votre recherche',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),),
        )
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 40 , right: 30),
        child: Column(
          children: [
            hr,
            hr,
            hr,
            section,
            cityList
          ],
        ),
      ),
    );
  }
}
