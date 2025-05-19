import 'package:flutter/material.dart';
import 'package:notu/app/widgets/side_menu/easy_sidemenu.dart';
import 'package:provider/provider.dart';

class BaseWidget extends StatelessWidget {
  const BaseWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SideMenu(
          showToggle: true,
          style: SideMenuStyle(
            showHamburger: true,
            displayMode: SideMenuDisplayMode.compact,
            selectedColor: Colors.blue,
            backgroundColor: Colors.white,
            selectedIconColor: Colors.white,
            unselectedIconColor: Colors.black,
            selectedTitleTextStyle: const TextStyle(color: Colors.white),
            unselectedTitleTextStyle: const TextStyle(color: Colors.black),
          ),
          bottomItems: [
            SideMenuItem(
              index: 0,
              title: 'Home',
              icon: const Icon(Icons.home),
              onTap:
                  () => context.read<SideMenuController>().changePage(
                    0,
                    routeName: '/',
                    context: context,
                  ),
            ),
            SideMenuItem(
              index: 1,
              title: 'Settings',
              icon: const Icon(Icons.settings),
              onTap:
                  () => context.read<SideMenuController>().changePage(
                    1,
                    routeName: '/settings',
                    context: context,
                  ),
            ),
          ],
        ),
        Expanded(child: child),
      ],
    );
  }
}
