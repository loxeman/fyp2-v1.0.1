import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserPresence {
  //static final _app = FirebaseApp.instance;
  static final FirebaseDatabase _db = FirebaseDatabase.instance;
  UpdatePresence() async {
    // All the refs required for updation
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var userStatusDatabaseRef = _db.ref('/status/' + uid);
    var userStatusFirestoreRef =
    FirebaseFirestore.instance.collection('service-provider').doc(uid);

    var isOfflineForDatabase = {
      "state": 'offline',
      "last_changed": ServerValue.timestamp,
    };

    var isOnlineForDatabase = {
      "state": 'online',
      "last_changed": ServerValue.timestamp,
    };

    // Firestore uses a different server timestamp value, so we'll
    // create two more constants for Firestore state.
    var isOfflineForFirestore = {
      "status": 'offline',
      "last_changed": FieldValue.serverTimestamp(),
    };

    var isOnlineForFirestore = {
      "status": 'online',
      "last_changed": FieldValue.serverTimestamp(),
    };

    _db.ref().child('.info/connected').onValue.listen((event) async {
      if (event.snapshot.value == false) {
        // Instead of simply returning, we'll also set Firestore's state
        // to 'offline'. This ensures that our Firestore cache is aware
        // of the switch to 'offline.'
        userStatusDatabaseRef.onDisconnect().update(isOfflineForDatabase);
        userStatusFirestoreRef.update(isOfflineForFirestore);
        return;
      }
      else{
        userStatusDatabaseRef.set(isOnlineForDatabase);
        userStatusFirestoreRef.update(isOnlineForFirestore);
      }

    });
  }
}