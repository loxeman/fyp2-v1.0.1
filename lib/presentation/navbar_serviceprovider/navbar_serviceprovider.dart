import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/Tool/online_offline.dart';
import 'package:fyp2/presentation/dashboard_page_screen/dashboard_page_screen.dart';
import 'package:fyp2/presentation/edit_service_page_screen/edit_service_page_screen.dart';
import 'package:fyp2/presentation/job_page_pending_page/job_page.dart';
import 'package:fyp2/presentation/service_provider_homepage_screen/service_provider_homepage_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavbarServiceProviderPage extends StatefulWidget {
  int selectedindex;
  NavbarServiceProviderPage({Key? key, required this.selectedindex}): super(key:key);

  @override
  _NavbarServiceProviderPageState createState() => _NavbarServiceProviderPageState();
}

class _NavbarServiceProviderPageState extends State<NavbarServiceProviderPage> with WidgetsBindingObserver {

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    UserPresence().updatePresence();
    super.initState();
  }

  String? changes;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      UserPresence().connect();
    }
    if (state == AppLifecycleState.resumed) {
      UserPresence().disconnect();
    }
  }
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }



  void _navigateBottomBar(int index){
    setState(() {
      widget.selectedindex = index;
    });
  }

  final List<Widget> _pages = [
    ServiceProviderHomepageScreen(suppId: FirebaseAuth.instance.currentUser!.uid),
    JobPage(),
    EditServicePageScreen(),
    DashboardPageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(widget.selectedindex),
      bottomNavigationBar: GNav(
        gap: 2,
        iconSize: 18,
          activeColor: Colors.white,
          backgroundColor: Colors.indigo.shade700,
          onTabChange: _navigateBottomBar,
          tabs: const[
            GButton(
              icon: Icons.store,
              text: "Store",
              iconColor: Colors.grey,
            ),
            GButton(
              icon: Icons.work,
              text: "Jobs",
              iconColor: Colors.grey,
            ),
            GButton(
              icon: Icons.design_services,
              text: "Services",
              iconColor: Colors.grey,
            ),
            GButton(
              icon: Icons.dashboard,
              text: "Dashboard",
              iconColor: Colors.grey,
            ),
          ]
      ),
    );
  }
}