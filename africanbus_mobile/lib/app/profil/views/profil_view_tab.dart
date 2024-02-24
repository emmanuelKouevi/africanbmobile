import 'package:africanbus_mobile/app/home/controllers/home_controller.dart';
import 'package:africanbus_mobile/app/login/views/login_view.dart';
import 'package:africanbus_mobile/app/profil/views/change_password_view.dart';
import 'package:africanbus_mobile/app/profil/views/edit_profil_user_view.dart';
import 'package:africanbus_mobile/app/profil/views/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilView extends GetView{
  const ProfilView ({Key? key}): super(key: key);

  Widget build(BuildContext context){

    final homeController = Get.put(HomeController());

    final spacing = SizedBox(height: 15,);
    
    final divider = Divider();

    final reservationSection = Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15),
          child: Text("Reservations" , style: GoogleFonts.ubuntu(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ],
    );

    final mesReservations = ListTile(
      leading: FaIcon(FontAwesomeIcons.ticketSimple ,),
      title: Text("Mes réservations" , style: GoogleFonts.ubuntu(
          color: Colors.black
      ),),
    );

    final checkingTicket = ListTile(
      leading: FaIcon(FontAwesomeIcons.qrcode ),
      title: Text("Scanner mon billet" , style: GoogleFonts.ubuntu(
          color: Colors.black,
      ),),
    );


    final logoutSection = Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15),
          child: Text("Deconnexion" , style: GoogleFonts.ubuntu(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ],
    );

    final logout = ListTile(
      leading: FaIcon(FontAwesomeIcons.rightFromBracket , color: Colors.teal.shade800,),
      title: Text("Se déconnecter" , style: GoogleFonts.ubuntu(
        color: Colors.teal.shade800,
        fontWeight: FontWeight.bold
      ),),
    );

    final securitySection = Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15),
          child: Text("Paramètre et sécurité" , style: GoogleFonts.ubuntu(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ],
    );

    final modifierInfosPersonnel = ListTile(
      onTap: () => Get.to(EditProfilUserView()),
      leading: FaIcon(FontAwesomeIcons.pencil),
      title: Text("Informations Personnelles" , style: GoogleFonts.ubuntu(
        color: Colors.black,
      ),),
    );

    final reinitialiseMotDePasse = ListTile(
      onTap: () => Get.to(ResetPasswordView()),
      leading: FaIcon(FontAwesomeIcons.key),
      title: Text("Reinitialiser mon mot de passe" , style: GoogleFonts.ubuntu(
        color: Colors.black,
      ),),
    );

    final modifierMotDePasse = ListTile(
      onTap: () => Get.to(ChangePasswordView()),
      leading: FaIcon(FontAwesomeIcons.lock),
      title: Text("Changer de mot de passe" , style: GoogleFonts.ubuntu(
        color: Colors.black,
      ),),
    );


    final helpingAndContactSection = Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15),
          child: Text("Aide et Contact" , style: GoogleFonts.ubuntu(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ],
    );

    final title = Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Text("Mon compte" , style: GoogleFonts.ubuntu(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
        ),
      ],
    );

    final aboutUs = ListTile(
      leading: FaIcon(FontAwesomeIcons.circleInfo),
      title: Text("À propos" , style: GoogleFonts.ubuntu(
        color: Colors.black,
      ),),
    );

    final contactUs = ListTile(
      leading: FaIcon(FontAwesomeIcons.headset),
      title: Text("Nous contacter" , style: GoogleFonts.ubuntu(
        color: Colors.black,
      ),),
    );

    final shareApp = ListTile(
      leading: FaIcon(FontAwesomeIcons.shareNodes),
      title: Text("Partager l'application" , style: GoogleFonts.ubuntu(
        color: Colors.black,
      ),),
    );

    final local = ListTile(
      leading: FaIcon(FontAwesomeIcons.locationDot),
      title: Text("Où nous trouver" , style: GoogleFonts.ubuntu(
        color: Colors.black,
      ),),
    );

    final help = ListTile(
      leading: FaIcon(FontAwesomeIcons.handshakeAngle),
      title: Text("Aide" , style: GoogleFonts.ubuntu(
        color: Colors.black,
      ),),
    );

    final historySection = Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15),
          child: Text("Historiques" , style: GoogleFonts.ubuntu(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ],
    );

    final history = ListTile(
      leading: FaIcon(FontAwesomeIcons.clockRotateLeft),
      title: Text("Historiques" , style: GoogleFonts.ubuntu(
        color: Colors.black,
      ),),
    );


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: title,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white70,
      body: homeController.currentUser.value!.id.isNotEmpty ? SingleChildScrollView(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            spacing,
            reservationSection,
            mesReservations,
            checkingTicket,
            divider,
            historySection,
            history,
            divider,
            securitySection,
            modifierInfosPersonnel,
            reinitialiseMotDePasse,
            modifierMotDePasse,
            divider,
            spacing,
            helpingAndContactSection,
            shareApp,
            local,
            contactUs,
            aboutUs,
            help,
            divider,
            logoutSection,
            logout
          ],
        ),
      ): Center(
        child: Column(
          children: [
            Text("Aucun compte utilisateur détecté", style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w700
            ),textAlign: TextAlign.center,),
            SizedBox(height: 5,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () => Get.to(LoginView()),
                child: Text("Connectez-vous", style: TextStyle(
                  color: Colors.white,
                ),)
            ),
          ],
        ),
      ),
    );
  }
}