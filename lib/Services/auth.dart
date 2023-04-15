import 'package:firebase_auth/firebase_auth.dart';
import 'package:testflutterproject/Services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get userStream {
    return _auth.authStateChanges();
  }
  // Connexion avec l'e-mail et le mot de passe
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return userCredential;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Inscription avec l'e-mail et le mot de passe
  Future<UserCredential?> registerWithEmailAndPassword(String email, String password, String nomUtilisateur) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      User? user = result.user;

      await DataBaseService(uid: user!.uid).updateUserData(nomUtilisateur);
      return result;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Déconnexion
  Future<void> signOut() async {
    await _auth.signOut();
  }
}