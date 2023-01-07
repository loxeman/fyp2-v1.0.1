import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserPresence {
  //static final _app = FirebaseApp.instance;
  FirebaseDatabase _db = FirebaseDatabase.instance;
  late DatabaseReference con;

  Future<void> updatePresence() async {
    // All the refs required for updation
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final userStatusDatabaseRef = _db.ref('/status/' + uid);
    await _db.goOnline();

    var isOnlineForDatabase = {
      "state": 'online',
      "last_seen": ServerValue.timestamp,
    };

    var isOnlineForFirestore = {
      "status": 'online',
      "last_seen": FieldValue.serverTimestamp(),
    };

    var isOfflineForDatabase = {
      "state": 'offline',
      "last_seen": ServerValue.timestamp,
    };

    var isOfflineForFirestore = {
      "status": 'offline',
      "last_seen": FieldValue.serverTimestamp(),
    };

    _db.ref().child('.info/connected').onValue.listen((event) async {
      try {
        if (event.snapshot.value == true) {
          await userStatusDatabaseRef.onDisconnect().update(isOfflineForDatabase)
              .then((snap){
            userStatusDatabaseRef.set(isOnlineForDatabase);
          });
        }
      }catch(e){
        print(e.toString());
      }
    }
    );
  }

  void connect(){
    _db.goOnline();
  }
// Remove connection for this device when signing out
  void disconnect(){
    _db.goOffline();
  }
}