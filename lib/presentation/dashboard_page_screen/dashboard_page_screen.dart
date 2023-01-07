import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/Tool/appbar_widgets.dart';
import 'package:fyp2/Tool/auth_controller.dart';
import 'package:fyp2/Tool/auth_handler.dart';
import 'package:fyp2/Tool/online_offline.dart';
import 'package:fyp2/presentation/edit_service_page_screen/edit_service_page_screen.dart';
import 'package:fyp2/presentation/edit_store_page_screen/edit_store_page_screen.dart';
import 'package:fyp2/presentation/job_page_pending_page/job_page.dart';
import 'package:fyp2/presentation/navbar_serviceprovider/navbar_serviceprovider.dart';
import 'package:fyp2/presentation/service_provider_homepage_screen/service_provider_homepage_screen.dart';
import 'package:fyp2/presentation/wallet_page_screen/wallet_page_screen.dart';
import 'package:fyp2/widgets/alert_dialog.dart';
import 'controller/dashboard_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_button.dart';

List<String> label = [
  'my store',
  'jobs',
  'edit profile',
  'manage\nservices',
  'balance',
];

List<IconData> icons = [
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
];

List<Widget> pages = [
  NavbarServiceProviderPage(selectedindex: 0,),
  NavbarServiceProviderPage(selectedindex: 1,),
  const EditStorePageScreen(),
  NavbarServiceProviderPage(selectedindex: 2,),
  WalletPageScreen(),
];


class DashboardPageScreen extends GetWidget<DashboardPageController> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstant.gray900,
            elevation: 0,
            centerTitle: true,
            title: AppBarTitle(title: 'Dashboard',),
            actions: [
              IconButton(
                  onPressed: () {
                    MyAlertDilaog.showMyDialog(
                        context: context,
                        title: 'Log Out',
                        content:
                        'Are you sure to log out ?',
                        tabNo: () {
                          Navigator.pop(context);
                        },
                        tabYes: () async {
                          await AuthRepo.logOut()
                              .whenComplete(() {Navigator.pop(context);
                            Navigator.pushReplacementNamed(
                                context, '/Welcome_page_screen');
                          });
                        });
                  },
                  icon: const Icon(
                    Icons.logout,
                  ))
            ],),
            backgroundColor: ColorConstant.gray900,
            body:
             Padding(
                 padding: getPadding(
                     left: 10, top: 10, right: 10, bottom: 10),
                 child: GridView.count(
                   mainAxisSpacing: 7,
                   crossAxisSpacing: 7,
                   crossAxisCount: 2,

                   children: List.generate(5, (index) {
                     return InkWell(
                       onTap: () {
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context) => pages[index]));},
                       child: Card(
                         shadowColor: Colors.purpleAccent.shade200,
                         color: ColorConstant.whiteA700,
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(
                               icons[index],
                               size: 50,
                               color: ColorConstant.indigoA700,),
                             Text(
                               label[index].toUpperCase(),
                               textAlign: TextAlign.center,
                               style: const TextStyle(
                                   fontSize: 12,
                                   color: Colors.indigo,
                                   fontWeight: FontWeight.w600,
                                   letterSpacing: 2,
                                   fontFamily: 'Roboto'),
                             )],),),);}),
                                ))),
    );
  }}

