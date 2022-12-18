import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'models/order_page_pending_one_model.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class OrderPageCompletePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
        .collection('order')
        .where('cid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('status', isEqualTo: 'complete')
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (snapshot.data!.docs.isEmpty) {
        return const Center(
            child: Text(
              'You Have no \n\n Complete Orders !',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'RobotoRoman',
                  fontSize: 26,
                  letterSpacing: 1.5,
                color: Colors.white,
              ),
            ));
      }
      return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            return OrderPageOngoingModel(
              order: snapshot.data!.docs[index],
            );
          });
    },);}
}
