import 'package:flutter/material.dart';
import 'package:fyp2/presentation/home_screen/home_screen.dart';
import 'package:fyp2/presentation/my_profile_screen/my_profile_screen.dart';
import 'package:fyp2/presentation/order_page_pending_tab_container_screen/order_page_pending_tab_container_screen.dart';
import 'package:fyp2/presentation/search_screen/search_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavbarPage extends StatefulWidget {

  const NavbarPage({Key? key}): super(key:key);

  @override
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(availability: '', category: '', location: '',),
    OrderPagePendingTabContainerScreen(),
    MyProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: GNav(
          onTabChange: _navigateBottomBar,
          tabs: const[
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.search,
              text: "Search",
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: "Order",
            ),
            GButton(
              icon: Icons.account_circle,
              text: "Profile",
            ),
          ]
      ),
    );
  }
}