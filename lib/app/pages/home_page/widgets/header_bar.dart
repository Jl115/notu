import 'package:flutter/material.dart';
import 'package:notu/app/pages/home_page/provider/home_page_provider.dart';
import 'package:notu/app/widgets/base/base_widget.dart';
import 'package:provider/provider.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomePageProvider>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.deepPurple[400],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Handle menu button press
                BaseWidget.scaffoldKey.currentState?.openDrawer();
              },
            ),
            const Text(
              'Header Bar',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Handle settings button press
              },
            ),
          ],
        ),
      ),
    );
  }
}
