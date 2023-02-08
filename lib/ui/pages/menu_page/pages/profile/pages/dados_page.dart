import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dados extends StatelessWidget {
  static String route = "Dados";

  const Dados({super.key});

  @override
  Widget build(BuildContext context) {
    /*  final DocumentReference snapshot = FirebaseFirestore.instance
        .collection("Users") as DocumentReference<Object?>; */
    final user = FirebaseAuth.instance.currentUser!;
    // final RegisterController useeer = Provider.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 209, 209),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(25, 50),
            // topRight: Radius.elliptical(60, 20),
            bottomLeft: Radius.elliptical(25, 50),
            bottomRight: Radius.elliptical(25, 50),
          ),
        ),
        label: const Text("Voltar"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  child: Text(
                    "Olá ${user.displayName?.split(" ").first}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 26),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(60)),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 32.0,
                              left: 32,
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Alterar Foto do sonho",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Abrir câmera",
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Selecionar na galeria",
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Remover foto",
                                        style: TextStyle(
                                            color: Colors.red[300],
                                            fontSize: 16),
                                      ))
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 111, 107, 107),
                      radius: 80,
                      child: user.photoURL == null
                          ? const Icon(
                              Icons.person,
                              size: 100,
                              color: Color.fromARGB(255, 211, 209, 209),
                            )
                          : ClipOval(
                              child: Image.network(
                              user.photoURL!,
                              fit: BoxFit.fill,
                              height: 150,
                              width: 150,
                            )),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Dados cadastrais",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Divider(
                thickness: 3,
                endIndent: 150,
              ),
              const Divider(
                thickness: 3,
                endIndent: 20,
                indent: 150,
              ),
              const Divider(
                thickness: 3,
                endIndent: 150,
                indent: 40,
              ),
              const Divider(
                thickness: 3,
                endIndent: 60,
                indent: 150,
              ),
              const Divider(
                thickness: 3,
                endIndent: 150,
                indent: 120,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 16.0, left: 16, right: 16, top: 32),
                child: SizedBox(
                  child: Text(
                    "Nome: ${user.displayName}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  child: Text(
                    "Email: ${user.email}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 18),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  child: Text(
                    "Telefone: (**) 9 ****-****",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                  ),
                ),
              ),
              const Spacer(),
              /*  Center(
                child: Image.asset(
                  "assets/images/money.png",
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              ),
              const Spacer(), */
            ]),
      ),
    );
  }
}
