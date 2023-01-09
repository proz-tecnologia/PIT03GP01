import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:mask/mask/mask.dart';
import 'package:srminhaeiro/ui/pages/login_page/onboarding.dart';
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

  bool teste = true;

  // ignore: unused_field
  var _value = 0.0;
  final _formKey = GlobalKey<FormState>();

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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Novo Cadastro',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Consumer<RegisterController>(
                        builder: (_, controller, __) {
                      return TextFormField(
                        maxLength: 20,
                        decoration: const InputDecoration(
                          hintText: "Nome",
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
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      maxLength: 40,
                      decoration: const InputDecoration(
                        hintText: "E-mail",
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
                      padding: const EdgeInsets.all(16.0),
                      child: Consumer<RegisterController>(
                          builder: (_, controller, __) {
                        return TextFormField(
                          maxLength: 11,
                          decoration: const InputDecoration(
                            hintText: "Telefone",
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
                          validator: (value) => Mask.validations.phone(value),
                        );
                      })),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Consumer<RegisterController>(
                          builder: (_, controller, __) {
                        return TextFormField(
                          maxLength: 20,
                          decoration: const InputDecoration(
                            hintText: "Profissão",
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
                          controller: profissaoController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => Mask.validations.generic(value),
                        );
                      })),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Consumer<RegisterController>(
                          builder: (_, controller, __) {
                        return TextFormField(
                          maxLength: 10,
                          decoration: const InputDecoration(
                            hintText: "Sua Renda",
                            //prefix: Text("R\$ "),
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
                          controller: rendaController,
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: [
                            CurrencyTextInputFormatter(
                                locale: "pt_BR", decimalDigits: 2, symbol: '')
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Informe um valor.";
                            }
                            final valueDouble = double.parse(
                                value.replaceAll('.', '').replaceAll(',', '.'));
                            if (valueDouble == 0) {
                              return "Informe um valor diferente de 0";
                            }
                            return null;
                          },
                          onSaved: (newValue) => _value = double.parse(newValue!
                              .replaceAll('.', '')
                              .replaceAll(',', '.')),
                        );
                      })),
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
                        Navigator.pushNamed(context, Onboarding.route);
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
}
