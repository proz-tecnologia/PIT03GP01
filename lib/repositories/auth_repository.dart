import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  User? loadUser() {
    return FirebaseAuth.instance.currentUser;
  }

  Future<User?> logout() async {
    await FirebaseAuth.instance.signOut();
    return null;
  }
}
