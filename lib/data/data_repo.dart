import 'package:firebase_database/firebase_database.dart';
import 'package:protect/data/models/position.dart';

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

  Stream<bool> getEmergencyStateStream() {
    DatabaseReference bpmRef =
        FirebaseDatabase.instance.ref('protect-ur-kid-001/Emergency_state');
    return bpmRef.onValue.map((event) {
      return event.snapshot.value as bool;
    });
  }

  //   Future<bool> getEmergencyStateFuture() async{
  //   DatabaseReference bpmRef =
  //       FirebaseDatabase.instance.ref('protect-ur-kid-001/Emergency_state');
  //   return (await bpmRef.once()).snapshot.value as bool;
  // }

  Stream<Pos> getPositionStream() {
    DatabaseReference bpmRef =
        FirebaseDatabase.instance.ref('protect-ur-kid-001/GPS');
    return bpmRef.onValue.map((event) {
      return Pos(
          lat: event.snapshot.child("lat").value as double,
          long: event.snapshot.child("lon").value as double);
    });
  }

  // Stream<double> getlatStream(){
  //   DatabaseReference latRef =
  //       FirebaseDatabase.instance.ref('protect-ur-kid-001/GPS/lat');
  //   return latRef.onValue.map((event){
  //     return event.snapshot.value as double ;

  //   });
  // }
  // Stream<double> getlonStream(){
  //   DatabaseReference latRef =
  //   FirebaseDatabase.instance.ref('protect-ur-kid-001/GPS/lon');
  //   return latRef.onValue.map((event){
  //     return event.snapshot.value as double ;

  //   });
  // }

  Stream<bool> getemergencyStream() {
    DatabaseReference emergencyRef =
        FirebaseDatabase.instance.ref('protect-ur-kid/Emergency_state');
    return emergencyRef.onValue.map((event) {
      return event.snapshot.value as bool;
    });
  }
}
