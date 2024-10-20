import 'package:africanbus_mobile/app/login/services/login_service.dart';
import 'package:africanbus_mobile/app/login/viewmodel/login_view_model.dart';
import 'package:africanbus_mobile/custom_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final loginProvider = Provider.of<LoginViewModel>(context);

    const space = SizedBox(height: 60,);
    const hr = SizedBox(height: 20,);

    final title = Row(
      children: [
        Text("Paramètres et Sécurité", style: GoogleFonts.ubuntu(
          color: Colors.black.withOpacity(0.7),
          fontWeight: FontWeight.bold,
          fontSize: 23
        ))
      ],
    );

    final myIcon = Row(
      children: [
        Expanded(
          child: Column(
            children: [
              FaIcon(FontAwesomeIcons.unlock , color: Colors.teal.shade800,size: 90,),
              hr,
              Text(
                  "Veuillez suivre les différentes instructions pour le changement de votre mot de passe. "
                      "Celles-ci nous permettront de vérifier vos informations.", textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        )
      ],
    );

    final myCurrentPassword = Container(
      child: CustomTextFormField(
        key: Key("currentPassword"),
        icon: FontAwesomeIcons.lock,
        controller: currentPassword,
        labelText: "Votre mot de passe actuel",
        isPasswordField: true,
        enabled: true,
        isOutlined: false,
      ),
    );

    final myNewPassword = Container(
      child: CustomTextFormField(
        key: Key("newPassword"),
        icon: FontAwesomeIcons.lock,
        controller: newPassword,
        labelText: "Entrer votre nouveau mot de passe",
        isPasswordField: true,
        enabled: true,
        isOutlined: false,
      ),
    );

    final myConfirmPassword = Container(
      child: CustomTextFormField(
        key: Key("newPassword"),
        icon: FontAwesomeIcons.lock,
        controller: confirmNewPassword,
        labelText: "Répétez votre nouveau mot de passe",
        isPasswordField: true,
        enabled: true,
        isOutlined: false,
      ),
    );

    final changePasswordBtn = Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal.shade800
        ),
        onPressed:() async{
           if(currentPassword.text.isEmpty || newPassword.text.isEmpty || confirmNewPassword.text.isEmpty){
             Get.snackbar("Erreur", "Champs non renseigné" , backgroundColor: Colors.red , colorText: Colors.white);
           }else if(currentPassword.text == newPassword.text){
             Get.snackbar("Erreur", "Votre mot de passe actuel est le meme que le nouveau mot de passe" , backgroundColor: Colors.red , colorText: Colors.white);
           }else if(newPassword.text != confirmNewPassword.text){
             Get.snackbar("Erreur", "Le mot de passe de confirmation est incorrect" , backgroundColor: Colors.red , colorText: Colors.white);
           }else{
             await AuthentificationService().changePasswordUser(loginProvider.userConnected.email!, currentPassword.text, newPassword.text);
           }
        },
        child: Text("CHANGER VOTRE MOT DE PASSE" ,style: GoogleFonts.ubuntu(
          color: Colors.white,
          fontWeight: FontWeight.w700
        ),),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: SingleChildScrollView(
        padding:EdgeInsets.only(left: 10 , right: 10),
        child: Column(
          children: [
            space,
            myIcon,
            hr,
            myCurrentPassword,
            hr,
            myNewPassword,
            hr,
            myConfirmPassword,
            hr,
            changePasswordBtn,
          ],
        ),
      ),
    );
  }
}
