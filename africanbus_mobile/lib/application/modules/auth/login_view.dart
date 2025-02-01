import 'package:africanbus_mobile/app/forgot_password/views/forget_password_view.dart';
import 'package:africanbus_mobile/app/home/controllers/home_controller.dart';
import 'package:africanbus_mobile/app/home/views/home_view.dart';
import 'package:africanbus_mobile/app/login/services/login_service.dart';
import 'package:africanbus_mobile/app/login/viewmodel/login_view_model.dart';
import 'package:africanbus_mobile/application/modules/auth/register_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../custom_widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}): super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  bool isLoading = false;
  TextEditingController id = new TextEditingController();
  TextEditingController code = new TextEditingController();
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    final loginProvider = Provider.of<LoginViewModel>(context);

    final defaultTextStyle = GoogleFonts.ubuntuCondensed(
      color: Colors.black
    );

    final linkTextStyle = GoogleFonts.ubuntuCondensed(
      color:Colors.teal.shade900, fontSize: 16, fontWeight: FontWeight.bold
    );


    final forgotPassword = Container(
      margin: EdgeInsets.only(top: 20.0),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => Get.to(ForgetPasswordView()),
        child: Text("Mot de passe oublié?",
          style: GoogleFonts.ubuntuCondensed(color: Colors.black.withOpacity(0.7), fontSize: 15),
        ),
      ),
    );

    final continueWithoutLogin = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Continuer sans connexion", style: GoogleFonts.akshar(color: Colors.white, fontSize: 18)),
        IconButton(
            onPressed: () => Get.to(() => HomeView()),
            icon: Icon(Icons.arrow_forward, color: Colors.white,)
        )
      ],
    );

    final email = Container(
      child: CustomTextFormField(
        controller: id, icon: Icons.mail,
        key: Key("idField"), labelText: "E-mail Ou Pseudo",
        enabled: true, isOutlined: false,
      ),
    );

    final password = Container(
      child: CustomTextFormField(
        labelText: "Mot de Passe", key: Key("motDePasse"),
        icon: Icons.lock, isPasswordField: true,
        controller: code, enabled: true, isOutlined: false,
      ),
    );

    final connexionBtn = Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal.shade900.withOpacity(0.7),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: () async{
            setState(() {
              isLoading = true;
            });
            final userConnected = await AuthentificationService().toLogin(id.text, code.text);
            if(userConnected.login!.isNotEmpty && userConnected.email!.isNotEmpty && userConnected.id != null){
              loginProvider.initializeUserConnected(userConnected);
              setState(() {
                isLoading = false;
              });
              Get.to(HomeView());
            }else{
              setState(() {
                isLoading = false;
              });
            }
          },
          child: Text("Connexion".toUpperCase(), style: TextStyle(
              color: Colors.white
          ),)
      ),
    );

    final loading = Center(
      child: SpinKitFadingCircle(
        size: 35, color: Colors.teal.shade900,
      ),
    );

    final dontHaveAnAccount = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 40.0),
      child: RichText(
        key: Key("registerRouter"),
        text: TextSpan(
          text: "Vous n'avez pas de compte ! ",
          style: defaultTextStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Get.to(RegisterView());
            },
          children: <TextSpan>[
            TextSpan(
              text: 'Inscrivez-vous ?',
              style: linkTextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.to(RegisterView());
                },
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color(0xff192a56),
                Color(0xff1dd1a1),
                //Colors.teal
              ]
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    continueWithoutLogin,
                    SizedBox(height: 30),
                    Text("Bienvenue", style: GoogleFonts.akshar(
                      fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white
                    )),
                    SizedBox(height: 10),
                    Text("Connectez-vous à votre compte" , style: GoogleFonts.akshar(
                        color: Colors.white, fontSize: 25
                    ),)
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60) , topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SizedBox(height: 60),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 75, 0, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10)
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: email,
                            ),
                            Container(
                              child: password,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      forgotPassword,
                      SizedBox(height: 5),
                      isLoading == true ? loading : connexionBtn,
                      SizedBox(height: 5),
                      dontHaveAnAccount,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
