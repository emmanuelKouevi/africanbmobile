import 'package:africanbus_mobile/services/service_web.dart';
import 'package:africanbus_mobile/views/dialog/widgets/cities/cityItem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/data/models/city.dart';

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
      results = cities.where((city) =>
          city.designation.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
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
            child: Text('Mon emplacement' , style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400
            ),),
          )
        ],
      ),
    );

    final departureCity = Container(
      child: TextField(
        style: TextStyle( fontSize: 17 , fontWeight: FontWeight.bold , color: Colors.black.withOpacity(0.7) ),
        controller: villeDepart,
        onChanged: (value) {
          _runFilter(value);
        },
        decoration: InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.teal.shade900,
                  width: 2
                )
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.teal.shade900,
                    width: 2
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
    ):Container(
        margin: EdgeInsets.only(top: 60),
        child: Center(
          child: Text('Nous n\'avons pas trouvé de gars correspondant à votre recherche',
            style: GoogleFonts.ubuntu(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
        )
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            weight: 3.0
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 40 , right: 30),
        child: Column(
          children: [
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
