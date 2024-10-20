import 'package:africanbus_mobile/app/modules/auth/repository/auth_repository.dart';
import 'package:africanbus_mobile/router/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../custom_widgets/custom_text_form_field.dart';
import '../../../forgot_password/views/forget_password_view.dart';
import '../../../register/views/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  TextEditingController id = new TextEditingController();
  TextEditingController code = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthRepository>(context, listen: false);

    final defaultTextStyle = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w600,
    );

    final linkTextStyle = TextStyle(
      color: Colors.teal.shade900,
      fontWeight: FontWeight.w600,
    );


    final forgotPassword = Container(
      margin: EdgeInsets.only(top: 20.0),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => Get.to(ForgetPasswordView()),
        child: Text("Mot de passe oublié?",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
        ),
      ),
    );

    final continueWithoutLogin = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Continuer sans connexion", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white)),
        IconButton(
            onPressed: () => Navigator.pushNamed(context, homeViewRoute),
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
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Color(0xff273c75), Colors.teal.shade700,Colors.teal]
          )
      ),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent.withOpacity(0.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          ),
          onPressed: (){
            authProvider.pseudoOrMailController = id ;
            authProvider.passwordController = code;
            Navigator.pushNamed(context, loadingPageViewRoute);
          },
          child: Text("Connexion".toUpperCase(), style: TextStyle(
              color: Colors.white
          ),)
      ),
    );

    final dontHaveAnAccount = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 40.0),
      child: RichText(
        key: Key("registerRouter"),
        text: TextSpan(
          text: "Vous n'avez pas de compte ? ",
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
                Colors.teal.shade700,
                Colors.teal
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
                    Text("Bienvenue", style: TextStyle(color: Colors.white, fontSize: 40 , fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("Connectez-vous à votre compte" , style: TextStyle(color: Colors.white, fontSize: 18),)
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
                      connexionBtn,
                      SizedBox(height: 5),
                      dontHaveAnAccount
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