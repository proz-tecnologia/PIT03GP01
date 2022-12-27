// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/login_page/login_page_two.dart';
import 'package:srminhaeiro/ui/pages/login_page/onboarding.dart';
import 'package:srminhaeiro/Util/group_button_config.dart';

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
                  Navigator.pushReplacementNamed(context, LoginPageTwo.route);
                },
              ),
            ),
            Spacer(),
            Text(
              "- OU -",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
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
                    onPressed: () {},
                    iconSize: 65,
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/images/linkedin1.png",
                    ),
                    onPressed: () {},
                    iconSize: 65,
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/images/facebook1.png",
                    ),
                    iconSize: 65,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: RichText(
                  text: TextSpan(children: const [
                TextSpan(
                    text: "Não possui uma conta?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    )),
                TextSpan(
                    text: " Cadastre-se",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ))
              ])),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
