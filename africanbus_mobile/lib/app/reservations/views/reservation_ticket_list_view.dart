import 'package:africanbus_mobile/app/data/models/reservationBillet.dart';
import 'package:africanbus_mobile/app/home/views/reservation_view.dart';
import 'package:africanbus_mobile/app/payment/views/payment_view.dart';
import 'package:africanbus_mobile/app/reservations/views/reservation_detail_view.dart';
import 'package:africanbus_mobile/app/search_ticket/controllers/search_ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ReservationListTab extends StatefulWidget {
  final int index ;
  const ReservationListTab({Key?key, required this.index}):super(key: key);

  @override
  State<ReservationListTab> createState() => _ReservationListTabState();
}

class _ReservationListTabState extends State<ReservationListTab> {
  final reservationController = Get.put(SearchTicketController(),permanent: true );

  @override
  Widget build(BuildContext context) {


    final title = Row(
      children: [
        Text('Vos réservations de billets' , style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),)
      ],
    );

    final label = Text("Vous n'avez pas de billet en réservation",textAlign: TextAlign.center, style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w500,
        fontSize: 20
    ),);

    final noReservation = Column(
      children: [
        LottieBuilder.asset("assets/lottie/not_ticket.json"),
        label
      ],
    );

    final showReservationOrNot = Obx(() =>
        reservationController.reservationTicketModelList.isEmpty ? noReservation :
        Obx(() => Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 30 , bottom: 30),
            itemCount: reservationController.reservationTicketModelList.length ,
            itemBuilder:  (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Card(
                  elevation: 4,
                  child: Container(
                    padding: EdgeInsets.only(left: 10 , right: 10 , bottom: 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Réference n° ${index + 1}", style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.bold
                            ),),
                            Row(
                              children: [
                                IconButton(
                                    onPressed:() => openBottomSheet(context, reservationController.reservationTicketModelList[index]),
                                    icon: FaIcon(FontAwesomeIcons.ellipsisVertical)
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Date de reservation :" , style: GoogleFonts.ubuntu(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),),
                            Text(DateTime.now().day.toString() + " " + DateTime.now().month.toString() + " " + DateTime.now().year.toString(),style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color(0xfff130f40)

                            ),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Offre de voyage :" , style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w400
                            ),),
                            Text(reservationController.reservationTicketModelList[index].billet.depart + " " +
                                reservationController.reservationTicketModelList[index].billet.destination
                              , style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold, color: Color(0xfff130f40)
                              ),),

                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Categorie : " , style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w400
                            ),),
                            Text(reservationController.reservationTicketModelList[index].billet.categorieOffreVoyage , style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xfff130f40)
                            ),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Prix du billet : " , style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w400
                            ),),
                            Text(reservationController.reservationTicketModelList[index].billet.coutReservation.toString() + " " + "FCFA" , style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xfff130f40)
                            ),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Status: " , style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                            Text('En cours de réservation' , style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xfff130f40)
                            ),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton.icon(
                                onPressed: () => Get.to(PaymentView(billet: reservationController.reservationTicketModelList[index].billet)),
                                icon: FaIcon(FontAwesomeIcons.caretLeft , color: Colors.teal.shade800,),
                                label: Text("Payer" , style: GoogleFonts.ubuntu(
                                  color: Colors.teal.shade800,
                                  fontWeight: FontWeight.bold
                                ),)
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ))
    );


    final showBookListOtherPersonOrNot = Obx(() =>
      reservationController.booksForPersonList.isEmpty ? noReservation :
    Obx(() => Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 30 , bottom: 30),
        itemCount: reservationController.booksForPersonList.length ,
        itemBuilder:  (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Card(
              elevation: 4,
              child: Container(
                padding: EdgeInsets.only(left: 10 , right: 10 , bottom: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Réference n° ${index + 1}", style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold
                        ),),
                        Row(
                          children: [
                            IconButton(
                                onPressed:() => openBottomSheet(context, reservationController.booksForPersonList[index]),
                                icon: FaIcon(FontAwesomeIcons.ellipsisVertical)
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(DateTime.now().toString(),style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xfff130f40)
                        ),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Offre de voyage :" , style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                        ),),
                        Text(reservationController.booksForPersonList[index].billet.depart + " " +
                            reservationController.booksForPersonList[index].billet.destination
                          , style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.bold, color: Color(0xfff130f40)
                          ),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Categorie : " , style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                        ),),
                        Text(reservationController.booksForPersonList[index].billet.categorieOffreVoyage , style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfff130f40)
                        ),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Prix du billet : " , style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                        ),),
                        Text(reservationController.booksForPersonList[index].billet.coutReservation.toString() + " " + "FCFA" , style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfff130f40)
                        ),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Nom : " , style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                        ),),
                        Text(reservationController.booksForPersonList[index].customer.firstname , style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfff130f40)
                        ),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Prenoms : " , style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                        ),),
                        SizedBox(height: 5,),
                        Text(reservationController.booksForPersonList[index].customer.lastname, style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfff130f40)
                        ),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Téléphone : " , style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                        ),),
                        SizedBox(height: 5,),
                        Text(reservationController.booksForPersonList[index].customer.phoneNumber, style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfff130f40)
                        ),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Status: " , style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                        Text('En cours de réservation' , style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfff130f40)
                        ),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                            onPressed: () => Get.to(PaymentView(billet: reservationController.booksForPersonList[index].billet)),
                            icon: FaIcon(FontAwesomeIcons.caretLeft , color: Colors.teal.shade800,),
                            label: Text("Payer" , style: GoogleFonts.ubuntu(
                                color: Colors.teal.shade800,
                                fontWeight: FontWeight.bold
                            ),)
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ))
    );

    
    final findTicketBtn = Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal.shade900
        ),
        onPressed: () => Get.to(ReservationTab()),
        child: Text('Trouver une offre', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),),
      ),
    );


    return DefaultTabController(
      initialIndex: widget.index,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorPadding: EdgeInsets.only(top: 25),
            indicatorColor: Colors.teal.shade800,
            tabs: [
              Text("Pour vous", style: GoogleFonts.ubuntu(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),),
              Text("Pour Autres", style: GoogleFonts.ubuntu(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),),
            ],
          ),
          title: title,
        ),
        body: TabBarView(
          children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(top: 10 , left: 10 , right: 10),
                child: Column(
                  children: [
                    //title,
                    Center(
                        child: showReservationOrNot
                    ),
                    SizedBox(height: 25,),
                    findTicketBtn
                  ],
                ),
              ),

              SingleChildScrollView(
                padding: EdgeInsets.only(top: 10 , left: 10 , right: 10),
                child: Column(
                  children: [
                    //title,
                    Center(
                        child: showBookListOtherPersonOrNot
                    ),
                    SizedBox(height: 25,),
                    findTicketBtn
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  void openBottomSheet(BuildContext context , ReservationBillet reservationBillet){

    final dividerTitle = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width/8,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ],
    );

    final more = ListTile(
      onTap: () => Get.to(ReservationDetailView(billet: reservationBillet.billet)),
      leading: FaIcon(FontAwesomeIcons.circleInfo),
      title: Text("Voir plus"),
    );

    final delete = ListTile(
      onTap: () {
        if(reservationBillet.isForOtherPerson){
          reservationController.removeBookForPerson(reservationBillet);
          Get.snackbar("Suppression effectuée",  "La réservation a bien été supprimé", backgroundColor: Colors.green , colorText: Colors.white);
        }else{
          reservationController.removeBook(reservationBillet);
          Get.snackbar("Suppression effectuée",  "La réservation a bien été supprimé", backgroundColor: Colors.green , colorText: Colors.white);
        }
      },
      leading: FaIcon(FontAwesomeIcons.trash),
      title: Text("Supprimer"),
    );

    Get.bottomSheet(
      Container(
        height: MediaQuery.of(context).size.height/3,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              dividerTitle,
              more,
              delete,
            ],
          ),
        ),
      ),
    );
  }
}

