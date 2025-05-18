import 'package:flutter/material.dart';
import 'package:notu/app/pages/home_page/home_page.dart';
import 'package:notu/app/pages/settings_page/settings_page.dart';

class AppRoutes {
  static const home = '/';
  static const settings = '/settings';

  static Route<dynamic> generateRoute(RouteSettings routes) {
    switch (routes.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
