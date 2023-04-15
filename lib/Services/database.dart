import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {

  final String uid;
  DataBaseService({required this.uid});
  //collection
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('Users');

  Future<void> updateUserData(String nomUtlisateur) async {
    return await userCollection.doc(uid).set({
      'Nom utilisateur': nomUtlisateur,
    });
  }

}