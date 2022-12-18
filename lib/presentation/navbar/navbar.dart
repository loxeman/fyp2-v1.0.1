import 'package:flutter/material.dart';
import 'package:fyp2/presentation/home_screen/home_screen.dart';
import 'package:fyp2/presentation/my_profile_screen/my_profile_screen.dart';
import 'package:fyp2/presentation/order_page_pending_page/Order_page.dart';
import 'package:fyp2/presentation/search_screen/search_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavbarCustomerPage extends StatefulWidget {
  int selectedindex;
  NavbarCustomerPage({Key? key, required this.selectedindex}): super(key:key);

  @override
  _NavbarCustomerPageState createState() => _NavbarCustomerPageState();
}

class _NavbarCustomerPageState extends State<NavbarCustomerPage> {
  void _navigateBottomBar(int index){
    setState(() {
      widget.selectedindex=index;
    });
  }

  final List<Widget> _pages = [
    CustomerHomeScreen(),
    SearchScreen(availability: 'online', category: '', location: '',),
    OrderPage(),
    MyProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(widget.selectedindex),
      bottomNavigationBar: SizedBox(height: 70,
        child:GNav(
          activeColor: Colors.white,
            backgroundColor: Colors.indigo.shade700,
          onTabChange: _navigateBottomBar,
          tabs: const[
            GButton(
              icon: Icons.home,
              text: "Home",
              iconColor: Colors.grey,
            ),
            GButton(
              icon: Icons.search,
              text: "Search",
              iconColor: Colors.grey,
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: "Order",
              iconColor: Colors.grey,
            ),
            GButton(
              icon: Icons.account_circle,
              text: "Profile",
              iconColor: Colors.grey,
            ),
          ]
      ),),
    );
  }
}