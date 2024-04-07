import 'package:africanbus_mobile/app/data/services/commonServiceWeb.dart';
import 'package:flutter/material.dart';

import '../../app/data/models/city.dart';
import '../../app/data/models/villeModel.dart';
import 'cityItem.dart';

class GareDestinationDialog extends StatefulWidget {
  final TextEditingController villeGareDestination ;
  const GareDestinationDialog({Key? key , required this.villeGareDestination}) : super(key: key);

  @override
  State<GareDestinationDialog> createState() => _GareDestinationDialogState();
}

class _GareDestinationDialogState extends State<GareDestinationDialog> {

  List<City>cities = [];
  List<Ville>foundCities = [];
  List<Ville>villesList = [];

  TextEditingController villeDestination = TextEditingController();

  void initializeCities() async{
    villesList = await CommonServiceWeb().obtenirListeDesVilles();
    print(villesList.length);
  }


  @override
  void initState(){
    initializeCities();
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Ville> results = [];
    if (enteredKeyword.isEmpty) {
      results = villesList ;
    } else {
      results = villesList
          .where((ville) =>
          ville.designation.toLowerCase().contains(enteredKeyword.toLowerCase()))
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
            itemBuilder: (context, index) => CityItem(ville: foundCities[index] , textEditingController: widget.villeGareDestination),
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
