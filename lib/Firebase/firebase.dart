import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseClass {
  FirebaseFirestore db = FirebaseFirestore.instance;

  void addtoFirebase({required name, required number}) {
    final data = {"Name": name, "Number": number};

    db
        .collection("User")
        .add(data)
        .then((DocumentReference docs) => {print('User Id Is::' + docs.id)});
  }
}
