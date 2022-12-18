import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/presentation/order_page_pending_one_page/models/order_page_complete_one_model.dart';
import 'models/order_page_pending_one_model.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class OrderPageOngoingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
        .collection('order')
        .where('cid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('status', isEqualTo: 'ongoing')
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
              'You Have no \n\n Ongoing Orders !',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'RobotoRoman',
                  fontSize: 26,
                  letterSpacing: 1.5
              ),
            ));
      }
      return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            return OrderPageCompleteModel(
              order: snapshot.data!.docs[index],
            );
          });
    },);}
}
