// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:srminhaeiro/navigator_key.dart';
import 'package:srminhaeiro/store/user.store.dart';
import 'package:srminhaeiro/ui/components/alert_dialog.component.dart';
import 'package:srminhaeiro/ui/components/progress_dialog.component.dart';
import 'package:srminhaeiro/ui/pages/check_page/check_page.dart';
import 'package:srminhaeiro/ui/pages/forgot_password_page/forgot_password_page.dart';
import 'package:srminhaeiro/ui/pages/login_page/controller/login.controller.dart';
import 'package:srminhaeiro/ui/pages/login_page/extensions/extension_string.dart';
import 'package:srminhaeiro/Util/group_button_config.dart';
import 'package:mask/mask.dart';
import 'package:srminhaeiro/ui/pages/login_page/login_page.dart';
import 'package:srminhaeiro/ui/pages/login_page/onboarding.dart';

class LoginPageTwo extends StatefulWidget {
  static String route = "logintwo";

  const LoginPageTwo({super.key});

  @override
  State<LoginPageTwo> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageTwo> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool teste = true;
  bool _showPassword = false;
  String _email = "";
  String _password = "";
  final _controllerLogin = LoginController();
  final _progressDialog = ProgressDialogComponent();
  final _alertDialog = AlertDialogComponent();
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => preLoad());
    super.initState();
  }

  Future preLoad() async {
    _streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user != null) {
        await _streamSubscription!.cancel();
        navigatorKey.currentState?.pushReplacementNamed(CheckPage.route);
      }
    });
  }

  /* @override
  void dispose() async {
    if (_streamSubscription != null) await _streamSubscription!.cancel();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Form(
                key: _formKey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: SizedBox(
                        height: 229,
                        width: 112,
                        child: Image.asset("assets/images/SrMinhaeiroo.png")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8, top: 8, bottom: 16),
                    child: SizedBox(
                        child: TextFormField(
                      onChanged: _controllerLogin.changeEmail,
                      controller: _emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => Mask.validations.email(value),
                      onSaved: (newValue) => _email = newValue!,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16)),
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.black),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16)),
                        ),
                        labelText: "e-mail",
                        hintText: "nome@email.com",
                        labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: TextFormField(
                        onChanged: _controllerLogin.changePassword,
                        controller: _passwordController,
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          errorBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.redAccent),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                          ),
                          labelText: "senha",
                          hintText: "Digite sua senha",
                          helperText: "Mín. 6 e máx. 20 caracteres",
                          labelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                            onPressed: (() {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            }),
                            icon: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        validator: ((value) {
                          if (!value!.isValidPassword) {
                            return "Senha inválida";
                          }

                          return null;
                        }),
                        onSaved: (newValue) => _password = newValue!,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 38, left: 8.0, right: 8.0),
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
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _signIn();
                        }
                      },
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, ForgotPasswordPage.route);
                      },
                      child: const Text("Esqueci minha senha")),
                  const Spacer(),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _signIn() async {
    try {
      _progressDialog.show("Autenticando...");
      await _controllerLogin.signIn();
    } on ExceptionUsers catch (e) {
      _progressDialog.hide();
      _alertDialog.showInfo(title: "Vish!", message: e.message);
    }
  }
}
