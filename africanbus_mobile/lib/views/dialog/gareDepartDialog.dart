import 'package:africanbus_mobile/models/city.dart';
import 'package:africanbus_mobile/service_web/service_web.dart';
import 'package:africanbus_mobile/views/dialog/widgets/cities/cityItem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GareDepartDialog extends StatefulWidget {
  final TextEditingController villeGareDepart ;
  const GareDepartDialog({Key? key , required this.villeGareDepart }) : super(key: key);

  @override
  State<GareDepartDialog> createState() => _GareDepartDialogState();
}

class _GareDepartDialogState extends State<GareDepartDialog> {

  List<City>cities = [];
  List<City>foundCities = [];

  TextEditingController villeDepart = TextEditingController();

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


    final positionOrLocalisation = Container(
      child: Row(
        children: [
          FaIcon(FontAwesomeIcons.locationCrosshairs),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text('Mon emplacement actuel' , style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400
            ),),
          )
        ],
      ),
    );

    final departureCity = Container(
      child: TextField(
        controller: villeDepart,
        onChanged: (value) {
          _runFilter(value);
        },
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
            labelText: 'De',
            labelStyle: TextStyle(
              color: Colors.teal
            )
        ),
      ),
    );



    final hr = SizedBox(height: 5);

    final section = Container(
      child: Column(
        children: [
          departureCity,
          hr,
          hr,
          hr,
          hr,
          positionOrLocalisation
        ],
      ),
    );

    final cityList = foundCities.isNotEmpty ? Container(
      width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      child: Container(
        child: ListView.builder(
          itemCount: foundCities.length,
          itemBuilder: (context, index) => CityItem(city: foundCities[index] , textEditingController: widget.villeGareDepart,),
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
