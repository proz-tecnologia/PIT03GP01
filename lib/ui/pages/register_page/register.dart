import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask/mask/mask.dart';
import 'package:srminhaeiro/navigator_key.dart';
import 'package:srminhaeiro/ui/components/alert_dialog.component.dart';
import 'package:srminhaeiro/ui/components/progress_dialog.component.dart';
import 'package:srminhaeiro/ui/pages/check_page/check_page.dart';
import 'package:srminhaeiro/ui/pages/login_page/extensions/extension_string.dart';
import 'package:srminhaeiro/ui/pages/login_page/login_page.dart';
import 'package:srminhaeiro/ui/pages/register_page/controller_register.dart';
//import 'package:srminhaeiro/ui/pages/register_page/model_register.dart';
import '../../../Util/group_button_config.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  static String route = "register";

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController rendaController = TextEditingController();
  final TextEditingController profissaoController = TextEditingController();
  final _progressDialog = ProgressDialogComponent();
  bool _showPassword = false;
  bool _showRepeatPassword = false;
  String password = "";
  bool teste = true;
  final _alertDialog = AlertDialogComponent();
  final _controller = RegisterController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(0)),
          ),
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.pushReplacementNamed(context, LoginPage.route);
          },
          label: const Text("Voltar")),
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
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 32.0,
                    ),
                    child: Text(
                      "Cadastre-se",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/images/add-user.png")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<RegisterController>(
                        builder: (_, controller, __) {
                      return TextFormField(
                        onChanged: _controller.changeName,
                        maxLength: 40,
                        decoration: const InputDecoration(
                          labelText: "Nome ",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          hintText: "Digite seu nome completo",
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        controller: nomeController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => Mask.validations.generic(value),
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: _controller.changeEmail,
                      maxLength: 40,
                      decoration: const InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        hintText: "Digite seu e-mail",
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
                      ),
                      keyboardType: TextInputType.text,
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => Mask.validations.generic(value),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Consumer<RegisterController>(
                          builder: (_, controller, __) {
                        return TextFormField(
                          onChanged: _controller.changePhoneNumber,
                          maxLength: 16,
                          decoration: const InputDecoration(
                            labelText: "Telefone",
                            labelStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            hintText: "Digite seu telefone",
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16)),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          controller: telefoneController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: Mask.validations.phone,
                          inputFormatters: [Mask.phone()],
                        );
                      })),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: TextFormField(
                        onChanged: _controller.changePassword,
                        maxLength: 20,
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
                          errorBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.redAccent),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                          ),
                          labelText: "Senha",
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
                        onSaved: (newValue) => password = newValue!,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: TextFormField(
                        onChanged: _controller.changeRepeatPassword,
                        maxLength: 20,
                        obscureText: !_showRepeatPassword,
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
                          errorBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.redAccent),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                          ),
                          labelText: "Repetir senha",
                          hintText: "Repita sua senha",
                          helperText: "Mín. 6 e máx. 20 caracteres",
                          labelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                            onPressed: (() {
                              setState(() {
                                _showRepeatPassword = !_showRepeatPassword;
                              });
                            }),
                            icon: Icon(
                              _showRepeatPassword
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
                        onSaved: (newValue) => password = newValue!,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GroupButtonConfig(
                      changecolor: teste,
                      text: const Text(
                        "Cadastrar",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      onpressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _signUp();
                        }
                      },
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _signUp() async {
    _progressDialog.show("Registrando cadastro...");
    final response = await _controller.signUp();
    if (response.isSuccess) {
      _progressDialog.hide();
      _alertDialog.showInfo(
        title: "Parabéns",
        message: "Conta criada com sucesso!",
      );
    } else {
      _progressDialog.hide();
      _alertDialog.showInfo(title: "Eita!", message: response.message!);
    }
  }
}
