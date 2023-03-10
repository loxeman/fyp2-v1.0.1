import 'package:flutter/material.dart';
import 'package:fyp2/presentation/navbar/navbar.dart';
import 'package:get/get.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
      ),
      onPressed: () {
        Get.back();
      },
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.white,
          fontFamily: 'RobotoRoman',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          letterSpacing: 1.5),
    );
  }
}

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.home,
        color: Colors.white,
      ),
      onPressed: () {Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  NavbarCustomerPage(selectedindex: 0)));
      },
    );
  }
}
