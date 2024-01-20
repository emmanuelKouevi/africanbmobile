import 'package:africanbus_mobile/services/service_web.dart';
import 'package:flutter/material.dart';

import '../../app/data/models/city.dart';
import 'cityItem.dart';

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

  List<City>villeList = [
    City(id: 1  , designation: "Lomé" , pays: "Togo"),
    City(id: 2  , designation: "Abidjan" , pays: "Côte d'Ivoire"),
    City(id: 3  , designation: "Korhogo" , pays: "Côte d'Ivoire"),
    City(id: 4  , designation: "Abudja" , pays: "Nigeria"),
    City(id: 5  , designation: "Accra" , pays: "Ghana"),
    City(id: 6  , designation: "Tacoradi" , pays: "Ghana"),
    City(id: 7  , designation: "Los Angeles" , pays: "United States"),
    City(id: 8  , designation: "Johannesburg" , pays: "Afrique du sud"),
    City(id: 9  , designation: "Tokyo" , pays: "Chine"),
  ];

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
      results = villeList ;
    } else {
      results = villeList
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
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.teal.shade900,
                )
            ),
            labelText: 'Arrivée',
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
