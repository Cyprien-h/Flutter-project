import 'package:flutter/material.dart';
import 'package:testflutterproject/Background/BackgroundImage.dart';
import 'package:testflutterproject/Screens/PageInscription.dart';
import 'package:testflutterproject/Services/auth.dart';
import 'package:testflutterproject/Screens/PageAccueuil.dart';
import 'package:testflutterproject/loading/loading.dart';

class PageConnexion extends StatefulWidget {
  const PageConnexion({Key? key}) : super(key: key);

  @override
  State<PageConnexion> createState() => _PageConnexionState();
}

class _PageConnexionState extends State<PageConnexion> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

bool loading = false;
  String eMail = '';
  String motDePasse = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Container(
        child: BackgroundImage(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100.0),
                Text(
                  'Bienvenue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontFamily: 'GoogleSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Veuillez vous connecter ou',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'GoogleSans',
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  'créer un nouveau compte',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'GoogleSans',
                      letterSpacing: 1
                  ),
                ),
                Text(
                  "pour utiliser l'application",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'GoogleSans',
                      letterSpacing: 1
                  ),
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  validator: (val) => val!.length < 1 ? 'entrez un mail' : null,
                  onChanged: (val){
                    setState(() {
                      eMail = val;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF1E262C),
                    hintText: "E-Mail",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),

                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),

                TextFormField(
                  validator: (val) => val!.length < 6 ? 'Entrez un mot de passe de minimum 6 caractères' : null,
                  onChanged: (val){
                    setState(() {
                      motDePasse = val;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF1E262C),
                    hintText: "Mot de passe",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  obscureText: true,
                ),
                const SizedBox(height: 100),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF636AF6),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(300, 50),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signInWithEmailAndPassword(eMail, motDePasse);
                      if(result == null){
                        setState(() {
                          error = 'Veuillez entrez un email et un mot de passe valide';
                          loading = false;
                        });
                      }else {
                        print('vous êtes connecter');
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PageAccueil()));
                      }
                    }
                    setState(() {
                      loading = false;
                    });
                  },
                  child: Text(
                    "Se connecter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'GoogleSans',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: const Color(0xFF636AF6), width: 2),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(300, 50),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PageInscription()));
                  },
                  child: Text(
                    "Créer un nouveau compte",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'GoogleSans',
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
