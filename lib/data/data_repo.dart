import 'package:firebase_database/firebase_database.dart';

class DataRepo {
  // final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Stream<int> getBPMStream({String id = "G8eg0w8vMtYk7NIqVzbiPqMGBWs2"}) {
  //   return firestore.collection("users").doc(id).snapshots().map((event) {
  //     return event.get("BPM");
  //   });
  // }

  Stream<int> getBPMStream() {
    DatabaseReference bpmRef =
        FirebaseDatabase.instance.ref('protect-ur-kid-001/BPM');
    return bpmRef.onValue.map((event) {
      return event.snapshot.value as int;
    });
  }
}
