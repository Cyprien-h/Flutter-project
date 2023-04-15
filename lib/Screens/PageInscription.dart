import 'package:flutter/material.dart';
import 'package:testflutterproject/Background/BackgroundImage.dart';
import 'package:testflutterproject/Services/auth.dart';
import 'package:testflutterproject/loading/loading.dart ';
import 'package:testflutterproject/Screens/PageAccueuil.dart';

class PageInscription extends StatefulWidget {
  const PageInscription({Key? key}) : super(key: key);

  @override
  State<PageInscription> createState() => _PageInscriptionState();
}

class _PageInscriptionState extends State<PageInscription> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();


bool loading = false;
  String error = '';
  String nomUtilisateur = '';
  String eMail = '';
  String motDePasse = '';
  String confirmationMotDePasse = '';

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      body: Container(
        child: BackgroundImage(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  <Widget>[
                SizedBox(height: 100.0),
                Text(
                  'Inscription',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontFamily: 'GoogleSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Veuillez saisir ces différentes informations,',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'GoogleSans',
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  'afin que vos listes soient sauvegardées.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'GoogleSans',
                      letterSpacing: 1
                  ),
                ),
                SizedBox(height: 30.0),

                  TextFormField(
                    validator: (val) => val!.length < 1 ? "entrez un nom d'utilisateur" : null,
                    onChanged: (val){
                      nomUtilisateur = val;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF1E262C),
                      hintText: "Nom d'utilisateur",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (val) => val!.length < 1 ? "entrez un mail" : null,
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
                    border: InputBorder.none,
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
                const SizedBox(height: 10),
                TextFormField(
                  validator: (val) {
                    if (val!.length < 6) {
                      return 'Entrez un mot de passe de minimum 6 caractères';
                    } else if (val != motDePasse) {
                      return 'Les mots de passe ne correspondent pas';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val){
                    setState(() {
                      confirmationMotDePasse = val;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF1E262C),
                    hintText: "Confirmation de mot de passe",
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
                const SizedBox(height: 40),
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
                      dynamic result = await _auth.registerWithEmailAndPassword(eMail, motDePasse, nomUtilisateur);
                      if(result == null){
                        setState(() {
                          loading = false;
                          error = 'Veuillez entrez un email valide';
                        });
                      }else {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PageAccueil()));
                      }
                    }
                  },
                  child: Text(
                    "S'inscrire",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'GoogleSans',
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: const Color(0xFF636AF6), width: 2),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(300, 50),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "J'ai déja un compte",
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