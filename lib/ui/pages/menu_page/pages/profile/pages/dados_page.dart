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
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
              topRight: Radius.circular(0)),
        ),
        label: const Text("Voltar"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Center(
                  child: Image.asset(
                    "assets/images/money.png",
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              const Spacer(),
            ]),
      ),
    );
  }
}
