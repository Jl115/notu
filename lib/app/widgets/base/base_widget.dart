import 'dart:io';
import 'package:flutter/material.dart';
import 'package:notu/app/providers/router_provider.dart';
import 'package:notu/app/widgets/side_bar/controller/sidebarx_controller.dart';
import 'package:notu/app/widgets/side_bar/models/models.dart';
import 'package:notu/app/widgets/side_bar/sidebarx_base.dart';
import 'package:notu/app/widgets/side_bar/theme/sidebarx_theme.dart';
import 'package:provider/provider.dart'; // <-- ADD THIS

class BaseWidget extends StatelessWidget {
  BaseWidget({super.key});
  final primaryColor = Color(0xFF685BFF);
  final canvasColor = Color(0xFF2E2E48);
  final scaffoldBackgroundColor = Color(0xFF464667);
  final accentCanvasColor = Color(0xFF3E3E61);
  final white = Colors.white;
  final actionColor = Color(0xFF5F5FA7);
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  static GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  final divider = Divider(color: Colors.white.withOpacity(0.3), height: 1);
  static final SidebarXController _controller = SidebarXController(
    selectedIndex: 0,
    extended: true,
  );

  bool isPhone(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) {
      final shortestSide = MediaQuery.of(context).size.shortestSide;
      return shortestSide < 600;
    }
    return false;
  }

  Widget buildMobile(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SidebarX(
        controller: _controller,
        theme: SidebarXTheme(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: canvasColor,
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: const TextStyle(color: Colors.white),
          selectedTextStyle: const TextStyle(color: Colors.white),
          itemTextPadding: const EdgeInsets.only(left: 30),
          selectedItemTextPadding: const EdgeInsets.only(left: 30),
          itemDecoration: BoxDecoration(border: Border.all(color: canvasColor)),
          selectedItemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: actionColor.withOpacity(0.37)),
            gradient: LinearGradient(colors: [accentCanvasColor, canvasColor]),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.28), blurRadius: 30),
            ],
          ),
          iconTheme: const IconThemeData(color: Colors.white, size: 20),
        ),
        extendedTheme: SidebarXTheme(
          width: 200,
          decoration: BoxDecoration(color: canvasColor),
          margin: EdgeInsets.only(right: 10),
        ),
        footerDivider: divider,
        headerBuilder: (context, extended) {
          return SafeArea(
            child: SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Notu'),
              ),
            ),
          );
        },
        items: [
          SidebarXItem(
            icon: Icons.home,
            label: 'Home',
            onTap: () => context.read<RouterProvider>().setView('home'),
          ),
          SidebarXItem(
            icon: Icons.settings,
            label: 'Settings',
            onTap: () => context.read<RouterProvider>().setView('settings'),
          ),
          SidebarXItem(
            icon: Icons.search,
            label: 'Search',
            onTap: () => context.read<RouterProvider>().setView('search'),
          ),
          SidebarXItem(
            icon: Icons.people,
            label: 'People',
            onTap: () => context.read<RouterProvider>().setView('people'),
          ),
          SidebarXItem(
            icon: Icons.favorite,
            label: 'Favorites',
            onTap: () => context.read<RouterProvider>().setView('favorites'),
          ),
        ],
      ),
      body: Stack(
        children: [
          Consumer<RouterProvider>(
            builder: (context, router, _) => router.getCurrentView(context),
          ),
          // Positioned(
          //   top: 46,
          //   left: 16,
          //   child: Material(
          //     color: Colors.transparent,
          //     child: IconButton(
          //       icon: const Icon(Icons.menu_rounded, color: Colors.deepPurple),
          //       onPressed: () {
          //         _scaffoldKey.currentState?.openDrawer();
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildDesktop(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SidebarX(
            controller: _controller,
            theme: SidebarXTheme(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              textStyle: const TextStyle(color: Colors.white),
              selectedTextStyle: const TextStyle(color: Colors.white),
              itemTextPadding: const EdgeInsets.only(left: 30),
              selectedItemTextPadding: const EdgeInsets.only(left: 30),
              itemDecoration: BoxDecoration(
                border: Border.all(color: Colors.tealAccent),
              ),
              selectedItemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.limeAccent.withOpacity(0.37)),
                gradient: const LinearGradient(
                  colors: [Colors.limeAccent, Colors.tealAccent],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.28),
                    blurRadius: 30,
                  ),
                ],
              ),
              iconTheme: const IconThemeData(color: Colors.white, size: 20),
            ),
            extendedTheme: const SidebarXTheme(
              width: 200,
              decoration: BoxDecoration(color: Colors.tealAccent),
              margin: EdgeInsets.only(right: 10),
            ),
            footerDivider: Divider(
              color: Colors.white.withOpacity(0.3),
              height: 1,
            ),
            headerBuilder: (context, extended) {
              return SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Notu',
                    style: TextStyle(
                      color: extended ? Colors.white : Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
            items: [
              SidebarXItem(
                icon: Icons.home,
                label: 'Home',
                onTap: () => context.read<RouterProvider>().setView('home'),
              ),
              SidebarXItem(
                icon: Icons.settings,
                label: 'Settings',
                onTap: () => context.read<RouterProvider>().setView('settings'),
              ),
              SidebarXItem(
                icon: Icons.search,
                label: 'Search',
                onTap: () => context.read<RouterProvider>().setView('search'),
              ),
              SidebarXItem(
                icon: Icons.people,
                label: 'People',
                onTap: () => context.read<RouterProvider>().setView('people'),
              ),
              SidebarXItem(
                icon: Icons.favorite,
                label: 'Favorites',
                onTap:
                    () => context.read<RouterProvider>().setView('favorites'),
              ),
            ],
          ),
          Expanded(
            child: Consumer<RouterProvider>(
              builder: (context, router, _) => router.getCurrentView(context),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isPhone(context) ? buildMobile(context) : buildDesktop(context);
  }
}
