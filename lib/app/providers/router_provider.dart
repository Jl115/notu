import 'package:flutter/material.dart';
import 'package:notu/app/pages/home_page/home_page.dart';
import 'package:notu/app/pages/settings_page/settings_page.dart';

class RouterProvider with ChangeNotifier {
  String _currentView = 'home';
  String get currentView => _currentView;

  void setView(String view) {
    if (_currentView != view) {
      _currentView = view;
      notifyListeners();
    }
  }

  // The map lives here
  final Map<String, WidgetBuilder> viewBuilders = {
    'home': (context) => HomePage(),
    'settings': (context) => SettingsPage(),
  };

  Widget getCurrentView(BuildContext context) {
    final builder = viewBuilders[_currentView];
    return builder != null
        ? builder(context)
        : Center(child: Text('Unknown view'));
  }
}
