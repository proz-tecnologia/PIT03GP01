// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/ui/pages/check_page/check_page.dart';
import 'package:srminhaeiro/ui/pages/login_page/controller/facebook_login.controller.dart';
import 'package:srminhaeiro/ui/pages/login_page/controller/google_login.controller.dart';
import 'package:srminhaeiro/ui/pages/login_page/login_page_two.dart';
import 'package:srminhaeiro/Util/group_button_config.dart';
import 'package:srminhaeiro/ui/pages/register_page/register.dart';

class LoginPage extends StatefulWidget {
  static String route = "login";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool teste = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 33.0),
              child: const Text("Bem vindo!",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
                height: 229,
                width: 112,
                child: Image.asset("assets/images/SrMinhaeiroo.png")),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Prazer, \$r. Minhaeiro",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GroupButtonConfig(
                changecolor: teste,
                text: const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onpressed: () {
                  Navigator.pushNamed(context, CheckPage.route);
                },
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, LoginPageTwo.route);
              },
              child: RichText(
                  text: TextSpan(children: const [
                TextSpan(
                    text: "Ainda não tem uma conta?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    )),
                /*  TextSpan(
                    text: " Cadastre-se",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    )) */
              ])),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GroupButtonConfig(
                changecolor: teste,
                text: const Text(
                  "Cadastre-se",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onpressed: () {
                  Navigator.pushNamed(context, Register.route);
                },
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 160, minWidth: 120),
                    height: 1,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "OU",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 160, minWidth: 120),
                    height: 1,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Image.asset(
                      "assets/images/google1.png",
                    ),
                    onPressed: () {
                      final provider = Provider.of<GoogleLoginController>(
                          context,
                          listen: false);
                      provider.googleLogin();
                    },
                    iconSize: 65,
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/images/facebook1.png",
                    ),
                    iconSize: 65,
                    onPressed: () {
                      final provider = Provider.of<FacebookLoginController>(
                          context,
                          listen: false);
                      provider.facebookLogin();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
