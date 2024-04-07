import 'package:africanbus_mobile/custom_widgets/simpleTextField.dart';
import 'package:africanbus_mobile/services/service_web.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/data/models/city.dart';
import '../../app/data/models/villeModel.dart';
import '../../app/data/services/commonServiceWeb.dart';
import 'cityItem.dart';

class GareDepartDialog extends StatefulWidget {
  final TextEditingController villeGareDepart ;
  const GareDepartDialog({Key? key , required this.villeGareDepart }) : super(key: key);

  @override
  State<GareDepartDialog> createState() => _GareDepartDialogState();
}

class _GareDepartDialogState extends State<GareDepartDialog> {

  List<City>cities = [];
  List<Ville>citiesFound = [];
  List<Ville>villesList = [];
  TextEditingController villeDepart = TextEditingController();

  void initializeCities() async{
    villesList = await CommonServiceWeb().obtenirListeDesVilles();
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
      results = villesList.where((ville) =>
          ville.designation.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    // Refresh the UI
    setState(() {
      citiesFound = results;
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
            labelText: 'Départ',
            labelStyle: TextStyle(color: Colors.teal)
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

    final cityList = citiesFound.isNotEmpty ? Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
            child: ListView.builder(
              itemCount: citiesFound.length,
              itemBuilder: (context, index) => CityItem(ville: citiesFound[index] , textEditingController: widget.villeGareDepart,),
            ),)
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
