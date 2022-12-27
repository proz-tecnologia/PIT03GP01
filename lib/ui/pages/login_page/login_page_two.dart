import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/login_page/extensions/extension_string.dart';
import 'package:srminhaeiro/ui/pages/login_page/onboarding.dart';
import 'package:srminhaeiro/Util/group_button_config.dart';
import 'package:mask/mask.dart';

class LoginPageTwo extends StatefulWidget {
  static String route = "logintwo";

  const LoginPageTwo({super.key});

  @override
  State<LoginPageTwo> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageTwo> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool teste = true;
  bool _showPassword = false;
  String _email = "";
  String _password = "";

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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Spacer(),
                      SizedBox(
                          height: 229,
                          width: 112,
                          child: Image.asset("assets/images/SrMinhaeiroo.png")),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: 350,
                            child: TextFormField(
                              controller: _emailController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) =>
                                  Mask.validations.email(value),
                              onSaved: (newValue) => _email = newValue!,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.redAccent),
                                  ),
                                  labelText: "e-mail",
                                  hintText: "nome@email.com",
                                  labelStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 350,
                          child: TextFormField(
                            controller: _senhaController,
                            obscureText: !_showPassword,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              errorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
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
                                icon: Icon(_showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
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
                        padding: const EdgeInsets.only(
                            top: 38, left: 8.0, right: 8.0),
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
                              Navigator.pushReplacementNamed(
                                  context, Onboarding.route);
                            }
                          },
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
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
}
