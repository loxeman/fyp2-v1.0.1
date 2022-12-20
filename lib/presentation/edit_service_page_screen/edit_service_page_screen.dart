import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/Tool/appbar_widgets.dart';
import 'package:fyp2/presentation/add_service_page_screen/add_service_page_screen.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/edit_service_page_screen/models/edit_service_page_model.dart';
import 'package:fyp2/presentation/serviie_provider_page_available_screen/models/service_page_model.dart';

class EditServicePageScreen extends StatelessWidget {
  EditServicePageScreen({Key? key}) : super(key: key);

  final Stream<QuerySnapshot> _prodcutsStream = FirebaseFirestore.instance
      .collection('services')
      .where('sid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

@override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: ColorConstant.gray900,
              leading: const AppBarBackButton(),
              centerTitle: true,
              title: const AppBarTitle(title: 'Manage Services',),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddServicePageScreen()));
              },
              label: const Text('Add service', style: TextStyle(color:Colors.white),),
              icon: const Icon(Icons.add, color: Colors.white,),
              backgroundColor: ColorConstant.indigoA700,
            ),
            backgroundColor: ColorConstant.gray900,
            body: StreamBuilder<QuerySnapshot>(
              stream: _prodcutsStream,
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
                        'This store \n\n has no service yet !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Acme',
                            letterSpacing: 1.5),
                      )
                  );
                }

                return SingleChildScrollView(
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return ServicePageModel(
                          services: snapshot.data!.docs[index],
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),),
                );
              },
            ),));
  }

}
