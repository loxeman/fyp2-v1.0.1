import 'package:flutter/material.dart';
import 'package:fyp2/presentation/dashboard_page_screen/dashboard_page_screen.dart';
import 'package:fyp2/presentation/edit_service_page_screen/edit_service_page_screen.dart';
import 'package:fyp2/presentation/job_page_pending_page/job_page_pending_page.dart';
import 'package:fyp2/presentation/service_provider_homepage_screen/service_provider_homepage_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavbarServiceProviderPage extends StatefulWidget {

  const NavbarServiceProviderPage({Key? key}): super(key:key);

  @override
  _NavbarServiceProviderPageState createState() => _NavbarServiceProviderPageState();
}

class _NavbarServiceProviderPageState extends State<NavbarServiceProviderPage> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    ServiceProviderHomepageScreen(),
    JobPagePendingPage(),
    EditServicePageScreen(),
    DashboardPageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: GNav(
          onTabChange: _navigateBottomBar,
          tabs: const[
            GButton(
              icon: Icons.store,
              text: "Store",
            ),
            GButton(
              icon: Icons.work,
              text: "Jobs",
            ),
            GButton(
              icon: Icons.design_services,
              text: "Services",
            ),
            GButton(
              icon: Icons.dashboard,
              text: "Dashboard",
            ),
          ]
      ),
    );
  }
}