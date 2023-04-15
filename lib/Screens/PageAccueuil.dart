import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageAccueil extends StatefulWidget {
  const PageAccueil({Key? key}) : super(key: key);

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        backgroundColor: const Color(0xFF1A2025),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              // Code pour la première icône
            },
            icon: SvgPicture.asset('assets/images/like.svg', height: 24),
          ),
          SizedBox(width: 10.0,),
          IconButton(
            onPressed: () {
              // Code pour la deuxième icône
            },
            icon: SvgPicture.asset('assets/images/whishlist.svg', height: 24),
          ),
          SizedBox(width: 15.0,),
        ],
      ),
      body: Container(
        color: const Color(0xFF1A2025),
      ),
    );
  }
}
