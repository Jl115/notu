import 'package:flutter/material.dart';

class SideMenuHamburgerWidget extends StatelessWidget {
  final List<Widget> items;
  const SideMenuHamburgerWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(children: items));
  }
}
