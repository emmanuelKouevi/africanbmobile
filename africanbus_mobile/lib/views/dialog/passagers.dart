import 'package:africanbus_mobile/dialogService/dialogService.dart';
import 'package:africanbus_mobile/views/dialog/viewModel/categoryPassagerViewModel.dart';
import 'package:africanbus_mobile/views/dialog/widgets/selectedCategoryTravellerList.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PassagersSection extends StatefulWidget {
  const PassagersSection({Key? key}) : super(key: key);

  @override
  State<PassagersSection> createState() => _PassagersSectionState();
}

class _PassagersSectionState extends State<PassagersSection> {

  @override
  Widget build(BuildContext context) {

    final travellerCategoryProvider = Provider.of<CategoryPassagerViewModel>(context);

    final addPassagersBtn = Container(
      width: MediaQuery.of(context).size.width/1.3,
      child: ElevatedButton.icon(
          onPressed: () => DialogService().showSelectTypePassagersDialog(context),
          icon: FaIcon(FontAwesomeIcons.plus , color: Colors.teal),
          label: Text('Ajouter un passager' , style: TextStyle(
            color: Colors.teal
          ),),
        style: ElevatedButton.styleFrom(
          primary: Colors.white
        ),
      ),
    );

    final validatePassagersBtn = Container(
      width: MediaQuery.of(context).size.width/1.3,
      child: ElevatedButton.icon(
        onPressed: () => DialogService().showSelectTypePassagersDialog(context),
        icon: Icon(Icons.check , color: Colors.white),
        label: Text('VALIDER' , style: TextStyle(
            color: Colors.white,
            fontSize: 15
        ),),
        style: ElevatedButton.styleFrom(
            primary: Colors.teal
        ),
      ),
    );

    final bottom = Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,

        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 6.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          children: [
            addPassagersBtn,
            validatePassagersBtn
          ],
        ),
      ),
    );


    final noTraveller = SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 150),
              child: Column(
                children: [
                  FaIcon(FontAwesomeIcons.solidCircleUser, size: 100, color: Colors.black.withOpacity(0.5),),
                  SizedBox(height: 10),
                  Text('Oups... Pas de Passagers' , style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
          )
        ],
      ),
    );

    final travellerExist = SingleChildScrollView(
      child: Column(
        children: [
          SelectedCategoryTravellerList(categoryPassagerViewModel: travellerCategoryProvider),
        ],
      ),
    );
    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Text('Passagers', style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: travellerCategoryProvider.data.length == 0 ? noTraveller : travellerExist
          ),
          bottom,
        ],
      ),
    );
  }
}
